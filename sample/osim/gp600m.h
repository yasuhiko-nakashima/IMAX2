
/* Pipeline Simulator                  */
/*        Copyright (C) 2007 by NAIST. */
/*         Primary writer: Y.Nakashima */
/*                nakashim@is.naist.jp */

/* csim.h 2005/7/18 */

#ifndef UTYPEDEF
#define UTYPEDEF
typedef unsigned char      Uchar;
typedef unsigned short     Ushort;
typedef unsigned int       Uint;
typedef unsigned long long Ull;
typedef long long int      Sll;
#endif

void   hard_bar2w();
Uint   hard_bar2r();
void   hard_bar2sync();

#define  MODE             0
#define  SIN              1
#define  SCK              2
#define  IH5_0            3
#define  SPIKE23_0        4
#define  DCK              5
#define  OSEL1_0          6
#define  EVA32_01         7
#define  CAPTURE          8
#define  SOUT             9
#define  XPLUS14_0       10
#define  XDIFF14_0       11
#define  BAR2_REGNUM     16
union bar2 {
  Uint ful;
} soft_bar2[BAR2_REGNUM], *hard_bar2;

#define  BAR3_L2CT_REGNUM 8
union l2ct {
  Uint ful;
} soft_l2ct[BAR3_L2CT_REGNUM], *hard_l2ct;

/**/



