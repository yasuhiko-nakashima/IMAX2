
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

#define  DATAOUT0         0
#define  DATAOUT1         1
#define  DATAOUT2         2
#define  DATAOUT3         3
#define  DATAOUT4         4
#define  DATAMSK0         5
#define  DATAMSK1         6
#define  DATAMSK2         7
#define  DATAMSK3         8
#define  DATAMSK4         9
#define  DATACTRL0       10
#define  DATACTRL1       11
#define  DATACTRL2       12
#define  DATACTRL3       13
#define  DATAIN0          0
#define  DATAIN1          1
#define  DATAIN2          2
#define  DATAIN3          3
#define  DATAIN4          4
#define  WRCOUNT         15
#define  BAR2_REGNUM     16
union bar2 {
  Uint ful;
} soft_bar2[BAR2_REGNUM], *hard_bar2;

#define  BAR3_L2CT_REGNUM 8
union l2ct {
  Uint ful;
} soft_l2ct[BAR3_L2CT_REGNUM], *hard_l2ct;

/**/



