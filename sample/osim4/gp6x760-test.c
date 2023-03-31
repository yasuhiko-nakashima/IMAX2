
static char RcsHeader[] = "$Header: /usr/home/nakashim/proj-emax/src/xsim/RCS/gp6x760-test.c,v 1.6 2012/11/28 07:59:00 nakashim Exp nakashim $";

/* LAPP Simulator                      */
/*         Copyright (C) 2005 by NAIST */
/*         Primary writer: Y.Nakashima */
/*                nakashim@is.naist.jp */

/* esim.c 2005/3/22 */ 

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <sys/times.h>
#include "gp6x760.h"

#define TEST_SIZE 256

main(argc, argv)
     int argc;
     char **argv;
{
  int   gp6x;

  if ((gp6x = u_gp6x760_open()) == -1) {
    fprintf(stderr, "ERROR GP6X760 is not available\n");
    exit(1);
  }

  /********/
  /* USB0 */
  /********/
  function_test(0);

  if (gp6x == 1) goto skip;

  /********/
  /* USB1 */
  /********/
  function_test(1);

skip:
  u_gp6x760_close();

  return(0);
}

function_test(usb) Uint usb;
{
  int   i;
  struct iov iov[4];
  Uint  r[USB_SPACE_REG_NUM]      __attribute__((aligned(32)));
  Uint  m[TEST_SIZE/sizeof(Uint)] __attribute__((aligned(32)));

#ifdef PSEUDO
  printf("==== PSEUDO-TEST ====\n");
#else
  printf("==== REAL-TEST ====\n");
#endif

//	 0x100	:	sr_reg_dout[31:0]	<=	c0_wdat[ 31:  0]; //MODE
//	 0x108	:	sr_reg_dout[31:0]	<=	c0_wdat[ 63: 32]; //SIN
//	 0x110	:	sr_reg_dout[31:0]	<=	c0_wdat[ 95: 64]; //SCK
//	 0x118	:	sr_reg_dout[31:0]	<=	c0_wdat[127: 96]; //IH5-0
//	 0x120	:	sr_reg_dout[31:0]	<=	c0_wdat[159:128]; //SPIKE23-0
//	 0x128	:	sr_reg_dout[31:0]	<=	c0_wdat[191:160]; //DCK
//	 0x130	:	sr_reg_dout[31:0]	<=	c0_wdat[223:192]; //OSEL1-0
//	 0x138	:	sr_reg_dout[31:0]	<=	c0_wdat[255:224]; //EVA32-01
//	 0x140	:	sr_reg_dout[31:0]	<=	c0_captcount[31:0];
//	 0x148  :       sr_reg_dout[31:0]	<=	c0_rdat[ 31:  0]; //SOUT
//	 0x150  :       sr_reg_dout[31:0]	<=	c0_rdat[ 63: 32]; //XPLUS14-XPLUS0
//       0x158  :       sr_reg_dout[31:0]	<=      c0_rdat[ 95: 64]; //XDIFF14-XDIFF0
//	 0x180	:	sr_reg_dout[31:0]	<=	c1_wdat[ 31:  0]; //MODE
//	 0x188	:	sr_reg_dout[31:0]	<=	c1_wdat[ 63: 32]; //SIN
//	 0x190	:	sr_reg_dout[31:0]	<=	c1_wdat[ 95: 64]; //SCK
//	 0x198	:	sr_reg_dout[31:0]	<=	c1_wdat[127: 96]; //IH5-0
//	 0x1a0	:	sr_reg_dout[31:0]	<=	c1_wdat[159:128]; //SPIKE23-0
//	 0x1a8	:	sr_reg_dout[31:0]	<=	c1_wdat[191:160]; //DCK
//	 0x1b0	:	sr_reg_dout[31:0]	<=	c1_wdat[223:192]; //OSEL1-0
//	 0x1b8	:	sr_reg_dout[31:0]	<=	c1_wdat[255:224]; //EVA32-01
//	 0x1c0	:	sr_reg_dout[31:0]	<=	c1_captcount[31:0];
//	 0x1c8  :       sr_reg_dout[31:0]	<=	c1_rdat[ 31:  0]; //SOUT
//	 0x1d0  :       sr_reg_dout[31:0]	<=	c1_rdat[ 63: 32]; //XPLUS14-XPLUS0
//       0x1d8  :       sr_reg_dout[31:0]	<=      c1_rdat[ 95: 64]; //XDIFF14-XDIFF0

  printf("Function test for USB%d PE-REG\n", usb);
  printf(" Writing");
  for (i=64; i<128; i+=2) r[i] = 0xffff0000 | i;
  for (i=64; i<128; i+=2) printf(" %08.8x", r[i]);
  for (i=64; i<128; i+=2) u_usb_space_reg_write(usb, &r[i], i);
  printf("\n");

  printf(" Reading");
  for (i=64; i<128; i+=2) r[i] = 0;
  for (i=64; i<128; i+=2) u_usb_space_reg_read(usb, &r[i], i);
  for (i=64; i<128; i+=2) printf(" %08.8x", r[i]);
  printf("\n");

  printf("Function test for USB%d PE-MEM\n", usb);
  printf(" Writing");
  for (i=0; i<TEST_SIZE/sizeof(Uint); i++) m[i] = 0x55550000 | i;
  for (i=0; i<TEST_SIZE/sizeof(Uint); i++) printf(" %08.8x", m[i]);
  u_usb_space_mem_write(usb, m, 256, USB_SPACE_MEM0);
  printf("\n");

  printf(" Reading");
  for (i=0; i<TEST_SIZE/sizeof(Uint); i++) m[i] = 0;
  u_usb_space_mem_read(usb, m, 256, USB_SPACE_MEM0);
  for (i=0; i<TEST_SIZE/sizeof(Uint); i++) printf(" %08.8x", m[i]);
  printf("\n");

  printf(" Writing");
  for (i=0; i<TEST_SIZE/sizeof(Uint); i++) m[i] = 0x77770000 | i;
  for (i=0; i<TEST_SIZE/sizeof(Uint); i++) printf(" %08.8x", m[i]);
  u_usb_space_mem_write(usb, m, 256, USB_SPACE_MEM0);
  printf("\n");

  printf(" Reading");
  for (i=0; i<TEST_SIZE/sizeof(Uint); i++) m[i] = 0;
  u_usb_space_mem_read(usb, m, 256, USB_SPACE_MEM0);
  for (i=0; i<TEST_SIZE/sizeof(Uint); i++) printf(" %08.8x", m[i]);
  printf("\n");
}

struct tms      utms;
long            tmssave;

restme()
{
        times(&utms);
        tmssave = utms.tms_utime;
}
gettme()
{
        times(&utms);
        return(utms.tms_utime-tmssave);
}

int u_gp6x760_open()
{
#ifdef PSEUDO
  return (2);
#else
  return gp6x760_open();
#endif
}

int u_gp6x760_close()
{
#ifdef PSEUDO
  return (0);
#else
  return gp6x760_close();
#endif
}

u_usb_space_reg_write(usb, p, regno) Uint usb; union usb_space_reg *p; Uint regno;
{
#ifdef PSEUDO
  usb_space_reg[regno] = *p;
#else    
  usb_space_reg_write(usb, p, regno);
#endif
}

u_usb_space_reg_read(usb, p, regno) Uint usb; union usb_space_reg *p; Uint regno;
{
#ifdef PSEUDO
  *p = usb_space_reg[regno];
#else
  usb_space_reg_read(usb, p, regno);
#endif
}

u_usb_space_mem_write(usb, p, len, a) Uint usb; Uchar *p; Uint len, a;
{
#ifdef PSEUDO
  len = (len+3)/4;
  while (len--) {
    *(Uint*)&ddr3[a] = *(Uint*)p;
    a+=4;
    p+=4;
  }
#else
  usb_space_mem_write(usb, p, len, a);
#endif
}

u_usb_space_mem_read(usb, p, len, a) Uint usb; Uchar *p; Uint len, a;
{
#ifdef PSEUDO
  len = (len+3)/4;
  while (len--) {
    *(Uint*)p = *(Uint*)&ddr3[a];
    a+=4;
    p+=4;
  }
#else
  usb_space_mem_read(usb, p, len, a);
#endif
}

u_usb_space_mem_writev(usb, iov, iovcnt, a) Uint usb; struct iov *iov; Uint iovcnt, a;
{
#ifdef PSEUDO
  Uchar *p;
  Uint len, i;
  Uint al[1024];

  if (iovcnt) {
    p   = (Uchar*)iov->iov_base;
    len = iov->iov_len;
    len = (len+3)/4;
    i   = 0;
    while (len--) {
      *(Uint*)&ddr3[a] = *(Uint*)p;
      if (i<iovcnt-1)
	al[i++] = *(Uint*)p;
      a+=4;
      p+=4;
    }
  }
  i = 0;
  while (iovcnt--) {
    iov++;
    p   = (Uchar*)iov->iov_base;
    len = iov->iov_len;
    len = (len+3)/4;
    while (len--) {
      *(Uint*)&ddr3[al[i] & (DDR3_SIZE-1)] = *(Uint*)p;
      al[i]+=4;
      p+=4;
    }
    i++;
  }
#else
  usb_space_mem_writev(usb, iov, iovcnt, a);
#endif
}

u_usb_space_mem_readv(usb, iov, iovcnt, a) Uint usb; struct iov *iov; Uint iovcnt, a;
{
#ifdef PSEUDO
  Uchar *p;
  Uint len, i;
  Uint al[1024];

  if (iovcnt) {
    p   = (Uchar*)iov->iov_base;
    len = iov->iov_len;
    len = (len+3)/4;
    i   = 0;
    while (len--) {
      *(Uint*)p = *(Uint*)&ddr3[a];
      if (i<iovcnt-1)
	al[i++] = *(Uint*)p;
      a+=4;
      p+=4;
    }
  }
  i = 0;
  while (iovcnt--) {
    iov++;
    p   = (Uchar*)iov->iov_base;
    len = iov->iov_len;
    len = (len+3)/4;
    while (len--) {
      *(Uint*)p = *(Uint*)&ddr3[al[i] & (DDR3_SIZE-1)];
      al[i]+=4;
      p+=4;
    }
    i++;
  }
#else
  usb_space_mem_readv(usb, iov, iovcnt, a);
#endif
}
