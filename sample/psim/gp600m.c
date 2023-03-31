
/* Definition */

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
#include <sys/mman.h>
#include <termios.h>
#include "gp600m.h"

#define GP600M_LOCKFIL "/tmp/gp600m.lock"
#define GP600M_DEVNAME "/dev/gp600m"
#define GP600M_MCSFILE "/usr/home/nakashim/proj-arm/src/osim/gp600m_arm.mcs"

#define MEMREGRD1           _IOWR('m', 310, struct s)
#define MEMREGRD2           _IOWR('m', 323, struct s)
#define MEMREGRD4           _IOWR('m', 324, struct s)
#define MEMREGWR1           _IOWR('m', 320, struct s)
#define MEMREGWR2           _IOWR('m', 321, struct s)
#define MEMREGWR4           _IOWR('m', 322, struct s)

static int fd;

static struct s{
  int adr;
  int data;
  int len;
  int param[18];
  int result;
} dt;

#if 1
#define HARD_BAR2W(i, d)         *((Uint*)hard_bar2+(i)) = (d)
#define HARD_BAR2R(i)            *((Uint*)hard_bar2+(i))
#define HARD_BAR2SYNC()          msync((Uint*)hard_bar2, BAR2_REGNUM*4, MS_SYNC)
#else
#define HARD_BAR2W(i, d)         {dt.adr=(i*4+0x2000000);dt.data=(d);ioctl(fd, MEMREGWR4,(void *)&dt);}
#define HARD_BAR2R(i)            (dt.adr=(i*4+0x2000000),ioctl(fd, MEMREGRD4,(void *)&dt),dt.data)
#define HARD_BAR2SYNC()          {}
#endif

int gp600m_open()
{
#if 0
  if ((fd=open(GP600M_LOCKFIL,O_CREAT|O_RDWR|O_EXLOCK)) == -1) {
    printf("gp600m.c: ERROR can not open lockfile %s\n", GP600M_LOCKFIL);
    return (-1);
  }
#endif

  if ((fd=open(GP600M_DEVNAME,O_RDWR)) == -1) {
    printf("gp600m.c: ERROR can not open gp600m\n");
    return (-1);
  }

  if ((hard_l2ct = (union l2ct*)mmap((caddr_t)0, 0x4000000, PROT_READ|PROT_WRITE, MAP_SHARED, fd, (off_t)0)) == MAP_FAILED) {
    printf("gp600m.c: ERROR MAP_FAILED on gp600m\n");
    return (-1);
  }
  
  hard_bar2 = (union bar2*) ((char*)hard_l2ct + 0x2000000);
  return (0);
}

int gp600m_close()
{
  close(fd);
  unlink(GP600M_LOCKFIL);
  return (0);
}

void hard_bar2w(i, d) Uint i; Uint d;
{
  *(Uint*)((Ull*)hard_bar2+i) = d;
}

Uint hard_bar2r(i) Uint i;
{
  return *(Uint*)((Ull*)hard_bar2+i);
}

void hard_bar2sync()
{
  msync(hard_bar2, BAR2_REGNUM*4, MS_SYNC);
}
