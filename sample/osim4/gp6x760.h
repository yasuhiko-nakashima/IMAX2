
/* Stereo image processor              */
/*   Copyright (C) 2002 by KYOTO UNIV. */
/*         Primary writer: Y.Nakashima */
/*         nakashim@econ.kyoto-u.ac.jp */

/* common.h 2002/4/18 */

#include <sys/types.h>
#include <sys/param.h>
#include <sys/times.h>
#include <sys/stat.h>
#include <signal.h>
#include <setjmp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WD           320
#define HT           240
#define BITMAP       (WD*HT)

unsigned int   *L;
unsigned int   *R;
unsigned int   *W;
unsigned int   *D;
unsigned int   *B;
unsigned int   *C;
unsigned char  *X;

struct SADmin { unsigned int    SADmin[HT][WD];}         *SADmin;
struct SAD1   { unsigned int    SAD1[HT][WD];}           *SAD1;
struct SAD2   { unsigned int    SAD2[HT][WD];}           *SAD2;
struct Xl     { unsigned int    Xl[HT][1024];}           *Xl;
struct Xr     { unsigned int    Xr[HT][1024];}           *Xr;
unsigned short *Bl; /* [BITMAP] */
unsigned short *Br; /* [BITMAP] */
struct El     { unsigned char   El[HT][WD];}             *El;
struct Er     { unsigned char   Er[HT][WD];}             *Er;
struct Fl     { unsigned char   Fl[HT][WD];}             *Fl;
struct Dl     { unsigned char   Dl[HT][WD];}             *Dl;
struct Dr     { unsigned char   Dr[HT][WD];}             *Dr;
unsigned char  *bl; /* [BITMAP] */
unsigned char  *br; /* [BITMAP] */
struct el     { unsigned char   el[HT][WD/8];}           *el;
struct er     { unsigned char   er[HT][WD/8];}           *er;

typedef unsigned char      Uchar;
typedef unsigned short     Ushort;
typedef unsigned int       Uint;
typedef unsigned long long Ull;
typedef long long int      Sll;

#if 1
struct iov {
  void *iov_base;
  int  iov_len;
};
#endif

/*  игUSB0ибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибид  */
/*  ивpwritev(fd, iov, 1, reg_addr)    0x0000017f-0x00000100                          ив  */
/*  ив                                      SDRAM 0x0000017f-0x00000100 PE0.REG       ив  */
/*  ивpwritev(fd, iov, iovcnt, offset) 0x1fffffff-0x10002000                          ив  */
/*  ивstatic struct emax_wvect {                                                      ив  */
/*  ив  { int *emax_wctrl; int bytes; },    SDRAM 0x1fffffff-0x10002000               ив  */
/*  ив  { int *wdata1;     int bytes; },    lmm<->SDRAM addr-translation              ив  */
/*  ив  { int *wdata2;     int bytes; },                                              ив  */
/*  ив           :                                                                    ив  */
/*  ив};                                                                              ив  */
/*  ивpreadv(fd, top, 1, offset)       0x0000017f-0x00000100                          ив  */
/*  ив                                      SDRAM 0x0000017f-0x00000100 PE0.REG       ив  */
/*  ивpreadv(fd, iov, iovcnt, offset)  0x1fffffff-0x10000000                          ив  */
/*  ивstatic struct emax_rvect {                                                      ив  */
/*  ив  { int *rdata1;     int bytes; },    SDRAM 0x1fffffff-0x10100000               ив  */
/*  ив  { int *rdata2;     int bytes; },    lmm<->SDRAM addr-translation              ив  */
/*  ив           :                                                                    ив  */
/*  ив};                                                                              ив  */
/*  изибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибий  */
/*  ив  0x0000003f-0x00000000:DMA└й╕ц                                                 ив  */
/*  ив  0x0000017f-0x00000100:PE0.REG                                                 ив  */
/*  ив[ 0x000001ff-0x00000180:PE1.REG             ] reserved                          ив  */
/*  ив[ 0x1000007f-0x10000000:PE0.L2CT            ] reserved                          ив  */
/*  ив[ 0x100000ff-0x10000080:PE1.L2CT            ] reserved                          ив  */
/*  ив--0x1fffffff-0x10000100:USER----------------------------------------------------ив  */
/*  ив  0x10003fff-0x10002000:PE0.emax_wctrl(8KB)  for wdata                          ив  */
/*  ив  0x17ffffff-0x10100000:PE0.wdata(1MB*127)   for wdata                          ив  */
/*  ив  0x18003fff-0x18002000:PE1.emax_wctrl(8KB)  for wdata                          ив  */
/*  ив  0x1fffffff-0x18100000:PE1.wdata(1MB*127)   for wdata                          ив  */
/*  ив  0x2fffffff-0x20000000:other-side-DDR3      for rdata                          ив  */
/*  ижибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибие  */
/*  игUSB1ибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибид  */
/*  ив[ 0x0000003f-0x00000000:DMA└й╕ц             ] reserved                          ив  */
/*  ив[ 0x0000017f-0x00000100:PE2.REG             ] reserved                          ив  */
/*  ив[ 0x000001ff-0x00000180:PE3.REG             ] reserved                          ив  */
/*  ив[ 0x1000007f-0x10000000:PE2.L2CT            ] reserved                          ив  */
/*  ив[ 0x100000ff-0x10000080:PE3.L2CT            ] reserved                          ив  */
/*  ив--0x1fffffff-0x10000100:USER----------------------------------------------------ив  */
/*  ив[ 0x10003fff-0x10002000:PE2.emax_wctrl(8KB) ] reserved                          ив  */
/*  ив[ 0x17ffffff-0x10100000:PE2.wdata(1MB*127)]   reserved                          ив  */
/*  ив[ 0x18003fff-0x18002000:PE3.emax_wctrl(8KB) ] reserved                          ив  */
/*  ив[ 0x1fffffff-0x18100000:PE3.wdata(1MB*127)]   reserved                          ив  */
/*  ив[ 0x2fffffff-0x20000000:other-side-DDR3     ] (unsused)                         ив  */
/*  ижибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибибие  */

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

#define USB_SPACE_RESET_STATUS     16
#define USB_SPACE_USB_CHID         18
#define USB_SPACE_REG_TOP          64
#define C0_MODE                    64+ 0
#define C0_SIN                     64+ 2
#define C0_SCK                     64+ 4
#define C0_IH5_0                   64+ 6
#define C0_SPIKE23_0               64+ 8
#define C0_DCK                     64+10
#define C0_OSEL1_0                 64+12
#define C0_EVA32_01                64+14
#define C0_CAPTURE                 64+16
#define C0_SOUT                    64+18
#define C0_XPLUS14_0               64+20
#define C0_XDIFF14_0               64+22
#define C1_MODE                    64+32
#define C1_SIN                     64+34
#define C1_SCK                     64+36
#define C1_IH5_0                   64+38
#define C1_SPIKE23_0               64+40
#define C1_DCK                     64+42
#define C1_OSEL1_0                 64+44
#define C1_EVA32_01                64+46
#define C1_CAPTURE                 64+48
#define C1_SOUT                    64+50
#define C1_XPLUS14_0               64+52
#define C1_XDIFF14_0               64+54
#define USB_SPACE_REG_NUM         128

#define USB_SPACE_MEM0             0x10000000
#define USB_SPACE_MEM1             0x20000000
#define USB_SPACE_MEM_PE0_L2CT0000 0x10000078
#define USB_SPACE_MEM_PE1_L2CT0000 0x100000f8

union usb_space_reg {
  Uint row;
  struct reset_status {
    Uint grst: 1; /* W1:start_reset R:reset in progress */
    Uint nop :31;
  } reset_status;
  struct usb_chid {
    Uint id:   2; /* ID */
    Uint nop :30;
  } usb_chid;
} usb_space_reg[USB_SPACE_REG_NUM];

union usb_space_mem {
  Uint row;
  struct l2ct0000 {
    Uint nop0   : 4;
    Uint m_stat : 2;
    Ull  nop1   :26;
  } l2ct0000;
}; /* allocated at PE0:0x1000007f-078 PE1:0x100000ff - 0f8 */
