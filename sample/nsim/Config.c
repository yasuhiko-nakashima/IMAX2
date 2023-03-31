/*
 * Copyright (c) 2003 Nakashima
 *
 * GP600-M PCI Board Aplication Program for FreeBSD.
 */
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <sys/queue.h>
#include <sys/errno.h>
#include <termios.h>

static struct termios orig, new;
static int peek = -1;
int fd;
struct s dt;

struct s{
  int adr;
  int data;
  int len;
  int param[18];
  int result;
};

/*
BAR1 For QuickLogic Internal registers
*/
/* READ */
#define SYSREGRD1           _IOWR('m', 304, struct s)
#define SYSREGRD2           _IOWR('m', 305, struct s)
#define SYSREGRD4           _IOWR('m', 306, struct s)
/* WRITE */
#define SYSREGWR1           _IOWR('m', 314, struct s)
#define SYSREGWR2           _IOWR('m', 315, struct s)
#define SYSREGWR4           _IOWR('m', 316, struct s)

/*
BAR3 For Memory
*/
/* READ */
#define MEMREGRD1           _IOWR('m', 310, struct s)
#define MEMREGRD2           _IOWR('m', 323, struct s)
#define MEMREGRD4           _IOWR('m', 324, struct s)
/* WRITE */
#define MEMREGWR1           _IOWR('m', 320, struct s)
#define MEMREGWR2           _IOWR('m', 321, struct s)
#define MEMREGWR4           _IOWR('m', 322, struct s)

int     readch        (void);
int     kbhit         (void);
int     one_key       (void);
void    load          (char **);
int     string_key    (char *);
unsigned long  strhextoa( char *);
int   hextoa( char *);
void bar3 (void);

unsigned int hex2int(char *p){
  char         tmp[3];
  unsigned int i;

  tmp[0] = p[0];
  tmp[1] = p[1];
  tmp[2] = 0;
  sscanf(tmp, "%x", &i);
  return i;
}

int
main (int argc, char **argv){
  int i, j, ch;
  int q=-1;

  //  one_key
  tcgetattr(0, &orig);
  new = orig;
  new.c_lflag &= ~ICANON;
  new.c_lflag &= ECHO;
  new.c_lflag &= ~ISIG;
  new.c_cc[VMIN] = 1;
  new.c_cc[VTIME] = 0;
  tcsetattr(0, TCSANOW, &new);

  if (argc != 2){
    printf("Usage : MCS File\n"); exit(-1);
  }

  if ((fd=open("/dev/gp600m",O_RDWR)) == -1){;
    printf("ERROR : Device cannot be opened!\n"); exit(-1);
  } else{
    printf("Driver Module Open --\n");
  }
  do {
    printf("\n");
    printf("* * * * * GP600M-PCI TINY MONITOR * * * * * *\n");
    printf("[L]: Down Load\n");
    printf("[3]: BAR3 Access (For Memory)\n");
    printf("[Q]: Exit\n");
    printf("* * * * * * * * * * * * * * * * * * * * * * * \n");
    ch = one_key();   // Waiting Push Key
    switch (ch){
      case 'Q': q = 0;        break;
      case 'L': load(argv);   break;
      case '3': bar3();       break;
      default :break;
    }
  } while (q);

  close(fd);
}

void load(char **argv)
{
  FILE  *fp;
  int flg, p, i;
  char buf[200];

  printf("-- [DownLoad] --\n");
  printf("Reset\n");
  dt.adr = 0x00;
  dt.data = 0x00;
  ioctl(fd, SYSREGWR1, (void *)&dt);
  sleep(1);
  dt.adr = 0x00;
  dt.data = 0x01;
  ioctl(fd, SYSREGWR1, (void *)&dt);

  do{
    ioctl(fd, SYSREGRD1, (void *)&dt);
    flg = dt.data & 0x01;
  } while (flg==0x00);
  printf("Ready to Configuration!\n");

  dt.adr = 0x00;
  dt.data = 0x11;
  ioctl(fd, SYSREGWR1, (void *)&dt);

  /* Flash ROM Writer*/
  dt.adr = 0x10;
  dt.data = 0x08;
  ioctl(fd, SYSREGWR1, (void *)&dt);

  do{
    dt.adr = 0x18;
    ioctl(fd, SYSREGRD1, (void *)&dt);
    flg = dt.data & 0x08;
  } while (flg==0x00);
  printf("Ready to Flash ROM!\n");

  if ((fp = fopen(argv[1], "r"))==NULL){
    printf("File Open Error\n");
  }
  printf("Downloading..\n");
  dt.adr = 0x08;
  while (fgets(buf, 199, fp) != NULL){
    /*Process Only Data Record */
    if (hex2int(&buf[7])==0){
      p = 9;
      for (i = 0; i < hex2int(&buf[1]); i++){
	/* printf("%02x",hex2int(&buf[p])); */
	dt.adr = 0x08;
        dt.data = hex2int(&buf[p]);
        ioctl(fd, SYSREGWR1, (void *)&dt);
        p += 2;

        dt.adr = 0x18;
        do {
          ioctl(fd, SYSREGRD1, (void *)&dt);
          flg = dt.data & 0x02;
        } while (flg != 0x02);
      }
    /*  printf("\n");*/
    }
  }
   printf("\n");

  /* Flash ROM Writer*/
  dt.adr = 0x10;
  dt.data = 0x00;
  ioctl(fd, SYSREGWR1, (void *)&dt);

  dt.adr = 0x00;
  ioctl(fd, SYSREGRD4, (void *)&dt);
  flg = dt.data & 0x04;
  if (flg != 0x04) printf("Failed (T_T;;) : %x\n",dt.data);
  else printf("Complete!\n");
  fclose(fp);
}

void bar3()
{
  int     num, ret, flg;
  char    string[20];
  int     adr, i, j, k, len, c;

  printf("--[BAR3]-----\n");
  printf("[r]: Read\n");
  printf("[w]: Wirte\n");
  printf("[D]: Dump\n");
  printf("[F]: Fill\n");
  printf("[0]: Zero Fill\n");
  printf("[1]: one  Fill\n");
  printf("[I]: Incriment Fill\n");
  num = one_key();
  switch (num){
  case 'D' :
    printf("\n[Memory Dump] Input Address (HEX) : ");
    string_key(string);
    adr = (int)strhextoa(string) & ~3;
    k = 1;
    for( i = adr; i < 0x1ffffff; i += 0x10 ) {
      printf( "%08x| ", i );
      for( j = 0; j < 4; j++){
        dt.adr = i+j*4;
        ioctl(fd, MEMREGRD4, (void *)&dt);
        printf( "%08x ", dt.data );
      }
      printf("\n");
      if (k++%20 == 0){
        printf( "[Any Key]:Continue  [Esc]:Escape\n" );
        if ((c = one_key()) == 0x1b){
          printf( "\n" );
          return;
        }
      }
    }
    return;
  case 'F':
  case '0':
  case '1':
  case 'I':
    printf("\n[Memory Fill] Input Address (HEX) : ");
    string_key(string);
    adr = (int)strhextoa(string) & ~3;
    printf("\n[Memory Fill] Input Length (HEX) : ");
    string_key(string);
    len = (int)strhextoa(string);
    dt.data = 0x00000000;
    if (num == 'F'){
      printf("\n[Memory Fill] Input HEX : \n");
      string_key(string);
      dt.data = (int)strhextoa(string);
    }
    else if (num == '0'){
      dt.data = 0x00000000;
    }
    else if (num == '1'){
      dt.data = 0xFFFFFFFF;
    }
    for( i = adr; i < adr+len; i+=4) {
      dt.adr = i;
      if (num == 'I'){
        dt.data = dt.data + 1;
      }
      ioctl(fd, MEMREGWR4, (void *)&dt);
    }
    return;
  }
  printf("\nInput Address (HEX) : ");
  string_key(string);
  adr = (int)strhextoa(string) & ~3;
  dt.adr = adr;
  if (num == 'r') {         //  Reg Read
    ioctl(fd, MEMREGRD4, (void *)&dt);
    printf("Adr = %x : DATA = %lx \n", adr, dt.data);
  }
  else{
    printf("\nInput Data (HEX) : ");
    string_key(string);
    dt.data = (int)strhextoa(string);
    ioctl(fd, MEMREGWR4, (void *)&dt);
  }
}

// ------------------------------------------------------------------------------------------//
//
//  one_key
//
// ------------------------------------------------------------------------------------------//
int   one_key()
{
  int   ret;

  while (kbhit() == 0);
  ret = readch();
  putchar('\n');
  return(ret);
}

// ------------------------------------------------------------------------------------------//
//
//  KBHIT
//
// ------------------------------------------------------------------------------------------//
int   kbhit()
{
  char ch;
  int nread;

  if(peek != -1) return 1;
  new.c_cc[VMIN]=0;
  tcsetattr(0, TCSANOW, &new);
  nread = read(0,&ch,1);
  new.c_cc[VMIN]=1;
  tcsetattr(0, TCSANOW, &new);

  if(nread == 1) {
    peek = ch;
    return 1;
  }

  return 0;
}

// ------------------------------------------------------------------------------------------//
//
//  READ CH
//
// ------------------------------------------------------------------------------------------//
int   readch()
{
  char ch;

  if(peek != -1) {
    ch = peek;
    peek = -1;
    return ch;
  }
  read(0,&ch,1);
  return(ch);
}

// ------------------------------------------------------------------------------------------//
//
//  String
//
// ------------------------------------------------------------------------------------------//
int   string_key(char *string)
{
  int       ret = 0;
  int       ch;
  int       i = 0;

  printf("\n");
  do{
    while (kbhit() == 0);
    ch = readch();
    string[i++] = ch;
  } while (ch != '\n');
  string[--i] = 0;
  return(ret);
}

// ------------------------------------------------------------------------------------------//
//
//  hextoa
//
// ------------------------------------------------------------------------------------------//
int   hextoa( char *ch)
{
  int ret;

  if (*ch >= 'A' && *ch <= 'F'){
    ret = *ch - 'A' + 10;
  }
  else if (*ch >= 'a' && *ch <= 'f'){
    ret = *ch - 'a' + 10;
  }
  else if (*ch >= '0' && *ch <= '9'){
    ret = *ch - '0';
  }
  else {
    ret = -1;
  }
  return(ret);
}

// ------------------------------------------------------------------------------------------//
//
//  strhextoa
//
// ------------------------------------------------------------------------------------------//
unsigned long  strhextoa( char *string)
{
  int     i, len;
  unsigned int   reg, ret;

  len = strlen(string);

  ret = 0;
  for (i = 0; i < len; i++){
    reg = (unsigned int)(hextoa(string++) * (0x01 << (len - i - 1) * 4));
    ret += reg;
  }
  return(ret);
}
