
static char RcsHeader[] = "$Header: /usr/home/nakashim/proj-nnet/src/psim/psim.c,v 1.2 2015/07/27 00:24:04 nakashim Exp nakashim $";

/* NNET Simulator                      */
/*         Copyright (C) 2015 by NAIST */
/*         Primary writer: Y.Nakashima */
/*                nakashim@is.naist.jp */

/* frontend.c 2002/4/22 */ 

#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <string.h>
#include <signal.h>
#include <sys/times.h>
#include <sys/file.h>
#include "gp600m.h"

int nnet_siml();
char *version();
void onintr_exit();
int x11_open();
int x11_close();
int x11_update();
int x11_checkevent();
int procimage();
int gp600m_open();
int gp600m_close();
int meminit();
int cam_open();
int cam_capt();
int ppm_capt();
int read_ppm();
int copy_X();
int imageInWindow();

#define WD           320
#define HT           240
#define BITMAP       (WD*HT)

unsigned int   *L;
unsigned int   *W;
unsigned int   *D;
unsigned char  *X;

unsigned char  *lut;
struct SAD1   { unsigned short  SAD1[HT/4][8][WD/4][8];} *SAD1;
struct Xl     { unsigned int    Xl[HT][1024];}           *Xl;
unsigned int   *Bl;
struct El     { unsigned char   El[HT][WD];}             *El;
struct Fl     { unsigned char   Fl[HT][WD];}             *Fl;

#define FROMFILE     1
#define FROMCAMERA   2

void  onintr_exit();
int   flag;
char  *fr0;

/**********************************************************************************/
/* Main */
/**********************************************************************************/

int
main(argc, argv)
     int argc;
     char **argv;
{

  for (argc--, argv++; argc; argc--, argv++) {
    if (**argv != '-') { /* regard as a name */
      if (!fr0)      strcpy(fr0 = (char*)malloc(strlen(*argv) + 1), *argv);
      continue;
    }
    switch (*(*argv+1)) {
    case 'f':
      flag |= FROMFILE;
      break;
    case 'c':
      flag |= FROMCAMERA;
      break;
    default:
      printf("%s\n", version());
      printf("usage: psim -f image.ppm\n");
      printf("       psim -c (from camera)\n");
      exit(1);
    }
  }

  if (!(flag & FROMFILE) && !(flag & FROMCAMERA)) {
    printf("usage: psim -f image.ppm\n");
    printf("       psim -c (from camera)\n");
    exit(1);
  }

  signal(SIGINT,  onintr_exit);
  signal(SIGQUIT, onintr_exit);
  signal(SIGKILL, onintr_exit);
  signal(SIGPIPE, onintr_exit);
  signal(SIGTERM, onintr_exit);

#ifdef GP600M
  /* GP600M使用時の初期化 */
  if (gp600m_open() == -1) {
    printf("ERROR GP600M is not available\n");
    onintr_exit(1);
  }
#endif
  meminit();
  x11_open();

  if (flag & FROMFILE) {
    ppm_capt(fr0, L);
    /* int L[240][320]に画像が入っている */
    /* 画素値は,       | R | G | B | 0 | */
    procimage(L);
    nnet_siml(D);
  }
  else if (flag & FROMCAMERA) {
#ifndef NOV4L2
    cam_open();
    while (1) {
      cam_capt(L);
      /* int L[240][320]に画像が入っている */
      /* 画素値は,       | R | G | B | 0 | */
      procimage(L);
      nnet_siml(D);
    }
#else
    printf("-DNOV4L2 is defined in Makefile\n");
#endif
  }

  onintr_exit(0);
}

/**********************************************************************************/
/* NNET */
/**********************************************************************************/

#define DEGREE  1
#define NWIDTH  (DEGREE*2*8+1)
int oNEURON[NWIDTH][NWIDTH]; /* Old voltage 0-255 */
int nNEURON[NWIDTH][NWIDTH]; /* New voltage 0-255 */
int HLINK[NWIDTH][NWIDTH-1]; /* Register 0-255 */
int VLINK[NWIDTH-1][NWIDTH]; /* Register 0-255 */

int HCURR[NWIDTH][NWIDTH-1]; /* Current V*256/(R+1) 0-65535 */
int VCURR[NWIDTH-1][NWIDTH]; /* Current V*256/(R+1) 0-65535 */
double HCSUM[NWIDTH][NWIDTH-1]; /* Sum of Current HCURR*steps -> control HLINK */
double VCSUM[NWIDTH-1][NWIDTH]; /* Sum of Current VCURR*steps -> control VLINK */

int
nnet_siml(image) Uint *image;
{
#define STEPS     64
  int step;
#define LOOPS     8
  int loop;
#define INSQRT    8
#define IN(y,x)   oNEURON[(y)*(DEGREE*2)+1][(x)*(DEGREE*2)+1]
//#define OUTY      2
//#define OUTX      5
//#define OUT(y,x)  oNEURON[(y)*(DEGREE*2)+8][(x)*(DEGREE*2)+4]
#define MAGNI     255
#define THRESHOLD 256.0
#define abs(x)    ((x)>=0? (x) : -(x))
#define OTON 1.0

#define MAXNUMBER 1
  int number; /* 0-9 */
  /*   ||    ||     ||      ||      ||      ||      ||      ||      ||      ||    */
  /*                                                                              */
  /*                                                                              */
  /*   **    **     **      **       **    ****     **     ****     **      **    */
  /*  ****  ***    ****    ****     ***    **      ** *      **    ****    * **   */
  /*  *  *   **      **      **    * **    ****    ***      **      **     ****   */
  /*  ****   **    **      ****    ****      **    ** *    **      ****      **   */
  /*   **    **    ****     **       **    ****     **     **       **      **    */
  /*                                                                              */
  /*   ||    ||     ||      ||      ||      ||      ||      ||      ||      ||    */
  unsigned long long ntrain[] = {
    0x0000183818181800LL, /* 1 */
    0x0000183c243c1800LL, /* 0 */
    0x0000183c0c303c00LL, /* 2 */
    0x0000183c0c3c1800LL, /* 3 */
    0x00000c1c2c3c0c00LL, /* 4 */
    0x00003c303c0c3c00LL, /* 5 */
    0x0000183438341800LL, /* 6 */
    0x00003c0c18303000LL, /* 7 */
    0x0000183c183c1800LL, /* 8 */
    0x0000182c3c0c1800LL  /* 9 */
  };

  /***************/
  /* RECOGNITION */
  /***************/
  /*   ||      ||      ||      ||      ||      ||      ||      ||      ||      ||    */
  /*                                                                                 */
  /*                                                                                 */
  /*   **      ***     **      **       **    ****     **     ****     **      **    */
  /*  *****   ***     *  *    *  *     * *    *       *          *    *  *    *  *   */
  /*  *  *     **       *       *     *  *    ***     ***       *      **      ***   */
  /*   ***     **      *      *  *    ****       *    *  *     *      *  *       *   */
  /*   **       *     ****     **        *    ***      **     *        **      **    */
  /*                                                                                 */
  /*   ||      ||      ||      ||      ||      ||      ||      ||      ||      ||    */
  unsigned long long nrecog[] = {
    //0x0000081808080800LL, /* 1 */
    //0x0000182424241800LL, /* 0 */
    0x00001c3818180800LL, /* 1 */
    0x0000183e241c1800LL, /* 0 */
    0x0000182408103c00LL, /* 2 */
    0x0000182408241800LL, /* 3 */
    0x00000c14243c0400LL, /* 4 */
    0x00003c2038043800LL, /* 5 */
    0x0000182038241800LL, /* 6 */
    0x00003c0408102000LL, /* 7 */
    0x0000182418241800LL, /* 8 */
    0x000018241c041800LL  /* 9 */
  };

  int x, y, i, j;
  Ull a, b;
  Uint out;

  a = 0LL;
  b = 0LL;
  for (y=15; y<HT-15+1; y+=HT/INSQRT) {
    for (x=55; x<WD-55+1; x+=HT/INSQRT) {
      a = (a<<1) | (image[y*WD+x]>0);
    }
  }

#ifndef GP600M
  /*********************/
  /* NNET siml here    */
  /*********************/
  {
    /*      HLINK                                 */
    /*  n-n-n-n-n-n-n-n-n-n-n-n-n-n-n-n-n 17nodes */
    /*  | | | VLINK                               */
    /*  n I n I n I n I n I n I n I n I n         */
    /*  n n n n n n n n n n n n n n n n n         */
    /*  n I n I n I n I n I n I n I n I n         */
    /*  n n n n n n n n n n n n n n n n n         */
    /*  n I n I n I n I n I n I n I n I n         */
    /*  n n n n n n n n n n n n n n n n n         */
    /*  n I n I n I n I n I n I n I n I n         */
    /*  n n n n O n O n O n O n O n n n n         */
    /*  n I n I n I n I n I n I n I n I n         */
    /*  n n n n O n O n O n O n O n n n n         */
    /*  n I n I n I n I n I n I n I n I n         */
    /*  n n n n n n n n n n n n n n n n n         */
    /*  n I n I n I n I n I n I n I n I n         */
    /*  n n n n n n n n n n n n n n n n n         */
    /*  n I n I n I n I n I n I n I n I n         */
    /*  n n n n n n n n n n n n n n n n n         */
    /************/
    /* TRAINING */
    /************/
    int HLINKinit = 10;
    int VLINKinit = 10;
    //    srand((unsigned)time(NULL));

    for (y=0; y<NWIDTH; y++) {
      for (x=0; x<NWIDTH-1; x++) {
        HLINK[y][x] = HLINKinit;
      }
    }
    
    for (y=0; y<NWIDTH-1; y++) {
      for (x=0; x<NWIDTH; x++) {
        VLINK[y][x] = VLINKinit;
      }
    }
    
    for (loop=0; loop<LOOPS; loop++){
      for (number=0; number<=MAXNUMBER; number++) {
	/* reset NEURON */
	for (y=0; y<NWIDTH; y++) {
	  for (x=0; x<NWIDTH; x++) {
	    oNEURON[y][x] = MAGNI/2 + ((double)rand()/RAND_MAX-0.5)*2*MAGNI/100.0;
	  }
	}
	/* refresh IN */
	for (y=0; y<INSQRT; y++) {
	  for (x=0; x<INSQRT; x++) {
	    IN(y,x) = ((ntrain[number]<<(y*INSQRT+x)) & 0x8000000000000000LL) ? MAGNI:0;
	  }
	}
	/* refresh OUT */
	//for (y=0; y<OUTY; y++) {
        //  for (x=0; x<OUTX; x++) {
	/* 実際には,K-means等による最適配置探索が必要のはず */
	//    OUT(y,x) = (number == (y*OUTX+x)) ? MAGNI:0;
	//  }
	//}
	for (step=0; step<STEPS; step++) {
	  /* horizontal link */
	  for (y=0; y<NWIDTH; y++) {
	    for (x=0; x<NWIDTH-1; x++) {
            //            printf("%d - %d\n",oNEURON[y][x+1],oNEURON[y][x]);
            //            printf("y=%d x=%d HLINK = %d\n",y,x,HLINK[y][x]);
	    HCURR[y][x] = (oNEURON[y][x+1] - oNEURON[y][x])/HLINK[y][x];
            //HCSUM[y][x] += abs(HCURR[y][x]);
            //HLINK[y][x] = (HCSUM[y][x] < THRESHOLD ? HCSUM[y][x]/(THRESHOLD/(MAGNI+1)) : MAGNI) + HLINKinit; /* 累積電流量により抵抗が増加するモデル */
            //if ((x==4)&&(y==4)){
            //  printf("HCSUM = %f\n",HCSUM[y][x]);
            //}
	    }
	  }
	  /* vertical link */
	  for (y=0; y<NWIDTH-1; y++) {
	    for (x=0; x<NWIDTH; x++) {
	      VCURR[y][x] = (oNEURON[y+1][x] - oNEURON[y][x])/VLINK[y][x];
              //VCSUM[y][x] += abs(VCURR[y][x]);
              //printf("%d\n",VCURR[y][x]);
              //VLINK[y][x] = (VCSUM[y][x] < THRESHOLD ? VCSUM[y][x]/(THRESHOLD/(MAGNI+1)) : MAGNI) + VLINKinit; /* 累積電流量により抵抗が増加するモデル */
	    }
	  }
	  /* update NEURON */
	  for (y=0; y<NWIDTH; y++) {
	    for (x=0; x<NWIDTH; x++) {
	      int N, S, W, E;
	      if (y>0)        N = -VCURR[y-1][x  ] ; else N=0;
	      if (y<NWIDTH-1) S =  VCURR[y  ][x  ] ; else S=0;
	      if (x>0)        W = -HCURR[y  ][x-1] ; else W=0;
	      if (x<NWIDTH-1) E =  HCURR[y  ][x  ] ; else E=0;
	      //            printf("%d  %d  %d  %d   \n",N,S,W,E);
	      nNEURON[y][x] = (OTON*(oNEURON[y][x]-MAGNI/2) + (N + S + W + E) + MAGNI/2) ; /* 周囲の電荷移動により電圧が変動するモデル */
	      printf("oNEURON=%d nNEURON=%d\n", oNEURON[y][x], nNEURON[y][x]);
	      if ( step != STEPS-1 ) {
		if (nNEURON[y][x] < 0     ) nNEURON[y][x] = 0;
		if (nNEURON[y][x] > MAGNI ) nNEURON[y][x] = MAGNI;
	      }
	      else {
		if (nNEURON[y][x] <= (MAGNI/2))     nNEURON[y][x] = 0;
		if (nNEURON[y][x] > (MAGNI/2))    nNEURON[y][x] = MAGNI;
	      }
            }
	  }
	  memcpy(oNEURON, nNEURON, sizeof(nNEURON));

	  /* refresh IN */
	  for (y=0; y<INSQRT; y++) {
	    for (x=0; x<INSQRT; x++) {
	      IN(y,x) = ((ntrain[number]<<(y*INSQRT+x)) & 0x8000000000000000LL) ? MAGNI:0;
	    }
	  }
	  /* refresh OUT */
	  //for (y=0; y<OUTY; y++) {
	  //  for (x=0; x<OUTX; x++) {
          /* 実際には,K-means等による最適配置探索が必要のはず */
	  //    OUT(y,x) = (number == (y*OUTX+x)) ? MAGNI:0;
          //  }
          //}
        
          //for (y=0; y<NWIDTH; y++) {
          //  for (x=0; x<NWIDTH; x++) {
          //    printf("%d   ",oNEURON[y][x]);
          //  }
          //}            
        
	  /* intermediate output */
          //printf("Train(%d):", number);
          //for (y=0; y<OUTY; y++) {
          //  for (x=0; x<OUTX; x++) {
	  //    printf(" O(%d)=%04.4d", (y*OUTX+x), OUT(y, x));
          //  }
          //}
          //printf("\n");
        
	  for (y=0; y<HT; y+=HT/(NWIDTH-1)) { /* 240 / 16 = 15 */
	    for (x=40; x<WD-40; x+=HT/(NWIDTH-1)) { /* 240 / 16 = 15 */
	      /*  n - n - n - */
	      /*  |   |   |   */
	      /*  n - I - n - */
	      /*  |   |   |   */
	      /*  n - n - O - */
	      /*  |   |   |   */
	      /*  n - I - n - */
	      /*  |   |   |   */
	      for (i=0; i<8; i++) {
		for (j=0; j<8; j++) {
		  W[(y+i)*WD+(x+j)] = oNEURON[y/15][(x-40)/15]<<8; /* BLUE */
		}
	      }
	      for (i=3; i<7; i++) {
		for (j=8; j<16; j++)
		  W[(y+i)*WD+(x+j)] = HLINK[y/15][(x-40)/15]<<24;
	      }
	      for (i=8; i<16; i++) {
		for (j=3; j<7; j++)
		  W[(y+i)*WD+(x+j)] = VLINK[y/15][(x-40)/15]<<24;
	      }
	    }
	  }
	  copy_X(0+number, W);
	  x11_update();
	}

	/*synapse*/

        /* horizontal link */
        for (y=0; y<NWIDTH; y++) {
          for (x=0; x<NWIDTH-1; x++) {
            HCURR[y][x] = (oNEURON[y][x+1] - oNEURON[y][x])/HLINK[y][x];
            HCSUM[y][x] += abs(HCURR[y][x]);
            HLINK[y][x] = (HCSUM[y][x] < THRESHOLD ? HCSUM[y][x]/(THRESHOLD/(MAGNI+1)) : MAGNI) + HLINKinit; /* 累積電流量により抵抗が増加するモデル */
          }
        }
        /* vertical link */
        for (y=0; y<NWIDTH-1; y++) {
          for (x=0; x<NWIDTH; x++) {
            VCURR[y][x] = (oNEURON[y+1][x] - oNEURON[y][x])/VLINK[y][x];
            VCSUM[y][x] += abs(VCURR[y][x]);
            VLINK[y][x] = (VCSUM[y][x] < THRESHOLD ? VCSUM[y][x]/(THRESHOLD/(MAGNI+1)) : MAGNI) + VLINKinit; /* 累積電流量により抵抗が増加するモデル */
          }
        }
        /* intermediate output */
        //printf("Train(%d):", number);
        //for (y=0; y<OUTY; y++) {
	//  for (x=0; x<OUTX; x++) {
        //    printf(" O(%d)=%04.4d", (y*OUTX+x), OUT(y, x));
        //  }
        //}
        //printf("\n");
        
        for (y=0; y<HT; y+=HT/(NWIDTH-1)) { /* 240 / 16 = 15 */
          for (x=40; x<WD-40; x+=HT/(NWIDTH-1)) { /* 240 / 16 = 15 */
            /*  n - n - n - */
            /*  |   |   |   */
            /*  n - I - n - */
            /*  |   |   |   */
            /*  n - n - O - */
            /*  |   |   |   */
            /*  n - I - n - */
            /*  |   |   |   */
            for (i=0; i<8; i++) {
              for (j=0; j<8; j++){
                W[(y+i)*WD+(x+j)] = oNEURON[y/15][(x-40)/15]<<8; /* BLUE */
              }
            }
            for (i=3; i<7; i++) {
              for (j=8; j<16; j++)
                W[(y+i)*WD+(x+j)] = HLINK[y/15][(x-40)/15]<<24;
            }
            for (i=8; i<16; i++) {
              for (j=3; j<7; j++)
                W[(y+i)*WD+(x+j)] = VLINK[y/15][(x-40)/15]<<24;
            }
          }
        }
        copy_X(4+number, W);
        x11_update();
      }
    }

    /***************/
    /* RECOGNITION */
    /***************/
    for (number=0; number<=MAXNUMBER; number++) {
      /* reset NEURON */
      for (y=0; y<NWIDTH; y++) {
	for (x=0; x<NWIDTH; x++) {
	  oNEURON[y][x] = MAGNI/2 + ((double)rand()/RAND_MAX-0.5)*2*MAGNI/100.0;
	}
      }
      for (y=0; y<INSQRT; y++) {
        for (x=0; x<INSQRT; x++) {
          IN(y,x) = ((nrecog[number]<<(y*INSQRT+x)) & 0x8000000000000000LL) ? MAGNI:0;
        }
      }

      for (step=0; step<2*STEPS; step++) {
        /* horizontal link */
        for (y=0; y<NWIDTH; y++) {
          for (x=0; x<NWIDTH-1; x++) {
            HCURR[y][x] = (oNEURON[y][x+1] - oNEURON[y][x])/HLINK[y][x];
          }
        }
        /* vertical link */
        for (y=0; y<NWIDTH-1; y++) {
          for (x=0; x<NWIDTH; x++) {
            VCURR[y][x] = (oNEURON[y+1][x] - oNEURON[y][x])/VLINK[y][x];
          }
        }
        /* update NEURON */
        for (y=0; y<NWIDTH; y++) {
          for (x=0; x<NWIDTH; x++) {
            int N, S, W, E;
            if (y>0)        N = -VCURR[y-1][x  ] ; else N=0;
            if (y<NWIDTH-1) S =  VCURR[y  ][x  ] ; else S=0;
            if (x>0)        W = -HCURR[y  ][x-1] ; else W=0;
            if (x<NWIDTH-1) E =  HCURR[y  ][x  ] ; else E=0;
            nNEURON[y][x] = OTON*(oNEURON[y][x]-MAGNI/2) + (N + S + W + E) + MAGNI/2 ; /* 周囲の電荷移動により電圧が変動するモデル */
            if ( step != 2*STEPS-1 ) {
              if (nNEURON[y][x] < 0     ) nNEURON[y][x] = 0;
              if (nNEURON[y][x] > MAGNI ) nNEURON[y][x] = MAGNI;
            }
            else {
              if (nNEURON[y][x] <= (MAGNI/2))     nNEURON[y][x] = 0;
              if (nNEURON[y][x] > (MAGNI/2))    nNEURON[y][x] = MAGNI;
            }

          }
        }
        memcpy(oNEURON, nNEURON, sizeof(nNEURON));
        /* recognized output */
        //        printf("Recog(%d):", number);
        //        for (y=0; y<OUTY; y++) {
        //          for (x=0; x<OUTX; x++) {
        //            printf(" O(%d)=%04.4d", (y*OUTX+x), OUT(y, x));
        //          }
        //        }
        
        for (y=0; y<HT; y+=HT/(NWIDTH-1)) { /* 240 / 16 = 15 */
          for (x=40; x<WD-40; x+=HT/(NWIDTH-1)) { /* 240 / 16 = 15 */
            /*  n - n - n - */
            /*  |   |   |   */
            /*  n - I - n - */
            /*  |   |   |   */
            /*  n - n - O - */
            /*  |   |   |   */
            /*  n - I - n - */
            /*  |   |   |   */
            for (i=0; i<8; i++) {
              for (j=0; j<8; j++)
                W[(y+i)*WD+(x+j)] = oNEURON[y/15][(x-40)/15]<<16; /* GREEN */
            }
            for (i=3; i<7; i++) {
              for (j=8; j<16; j++)
                W[(y+i)*WD+(x+j)] = HLINK[y/15][(x-40)/15]<<24;
            }
            for (i=8; i<16; i++) {
              for (j=3; j<7; j++)
                W[(y+i)*WD+(x+j)] = VLINK[y/15][(x-40)/15]<<24;
            }
          }
        }
        copy_X(8+number, W);
        x11_update();
      }
#if 1
      i = -1;
      j = -1;
      //      for (y=0; y<OUTY; y++) {
      //        for (x=0; x<OUTX; x++) {
      //          if (y*OUTX+x <= MAXNUMBER && i < OUT(y, x)) {
      //            i = OUT(y, x);
      //            j = y*OUTX+x;
      //          }
      //        }
      //      }
      printf("Result=%d\n", j);
#endif
    }
  }
#else
  /**************************/
  /* NNET real chip here    */
  /**************************/
  {
    /* +-----------------+ 【NNETの場合の例】                                                     */
    /* | * * * * * * * * |  aH,aL の合計64bitで 8x8の2値画像を与える                              */
    /* | * * * * * * * * |  bH,bL の合計64bitで 8x8の何か，またはパラメタを与える                 */
    /* | * * * * * * * * |  ASICからNNCHIPへは，1対1に接続するための64ないし128本の配線           */
    /* | * * * * * * * * |                                                                        */
    /* | * * * * * * * * |  出力は32bitのうち16bit使用 例えば0-9A-Fに対し，各1bit使用可能         */
    /* | * * * * * * * * |  NNCHIPからASICへは，1対1に接続するための32本の配線                    */
    /* | * * * * * * * * |                                                                        */
    /* | * * * * * * * * |                                                                        */
    /* +-----------------+                                                                        */
    soft_bar2[DATAOUT0].ful  = 0x00000000;
    soft_bar2[DATAOUT1].ful  = 0x00000000;
    soft_bar2[DATAOUT2].ful  = 0x00000000;
    soft_bar2[DATAOUT3].ful  = 0x00000000;
    soft_bar2[DATAOUT4].ful  = 0x00000000;
    soft_bar2[DATAMSK0].ful  = 0x00000000;
    soft_bar2[DATAMSK1].ful  = 0x00000000;
    soft_bar2[DATAMSK2].ful  = 0x00000000;
    soft_bar2[DATAMSK3].ful  = 0x00000000;
    soft_bar2[DATAMSK4].ful  = 0x00000000;
    soft_bar2[DATACTRL0].ful = 0x00000000;
    soft_bar2[DATACTRL1].ful = 0x00000000;
    soft_bar2[DATACTRL2].ful = 0x00000000;
    soft_bar2[DATACTRL3].ful = 0x00000000;
    hard_bar2sync();

    /** FILM書き込み **/
    soft_bar2[WRCOUNT].ful  = 0x00008000;
    hard_bar2w(WRCOUNT, soft_bar2[WRCOUNT].ful);
    hard_bar2sync();

    /** 読み出し **/
    while ((soft_bar2[WRCOUNT].ful = hard_bar2r(WRCOUNT)) != 0) { /* ★SOFT←HARD★ */
      printf("soft_bar2[WRCOUNT]=%08.8x din[4:0]=%08.8x_%08.8x_%08.8x_%08.8x_%08.8x\n",
	     soft_bar2[WRCOUNT].ful, hard_bar2r(DATAIN4), hard_bar2r(DATAIN3), hard_bar2r(DATAIN2), hard_bar2r(DATAIN1), hard_bar2r(DATAIN0));
    }
  }
#endif
  return (0);
}

char *
version()
{
  char *i;

  for (i=RcsHeader; *i && *i!=' '; i++);
  for (           ; *i && *i==' '; i++);
  for (           ; *i && *i!=' '; i++);
  for (           ; *i && *i==' '; i++);

  return (i);
}

void
onintr_exit(x) int x;
{
  char command[80];
  int i, pid;

  if (x == 0) {
    printf("==== Normal end. Type any in ImageWin ====\n");
    while (x11_checkevent());
#if 0
    printf("stop_x11>");
    fgets(command, 80, stdin);
#endif
  }
  else
    printf("==== Interrupt end. ====\n");

#ifdef GP600M
  gp600m_close();
#endif
  exit(0);
}

/**********************************************************************************/
/* Filters */
/**********************************************************************************/

#define PIXMAX                          255
#define EDGEDET                          64
#define MASK                     0xffffff00

#define ad(a,b)   ((a)<(b)?(b)-(a):(a)-(b))
#define ss(a,b)   ((a)<(b)?   0   :(a)-(b))

int
meminit()
{
  posix_memalign((void**)&L,      1048576, sizeof(int)*BITMAP);
  posix_memalign((void**)&W,      1048576, sizeof(int)*BITMAP);
  posix_memalign((void**)&D,      1048576, sizeof(int)*BITMAP);
  posix_memalign((void**)&X,      1048576, BITMAP*3*12);
  posix_memalign((void**)&lut,    1048576, 256*3);
  posix_memalign((void**)&SAD1,   1048576, sizeof(struct SAD1));
  posix_memalign((void**)&Xl,     1048576, sizeof(struct Xl));
  posix_memalign((void**)&Bl,     1048576, sizeof(int)*BITMAP);
  posix_memalign((void**)&El,     1048576, sizeof(struct El));
  posix_memalign((void**)&Fl,     1048576, sizeof(struct Fl));

  printf("L     : %08.8x\n", (int)L);
  printf("W     : %08.8x\n", (int)W);
  printf("D     : %08.8x\n", (int)D);
  printf("X     : %08.8x\n", (int)X);
  printf("lut   : %08.8x\n", (int)lut);
  printf("SAD1  : %08.8x\n", (int)(SAD1->SAD1));
  printf("Xl    : %08.8x\n", (int)(Xl->Xl));
  printf("Bl    : %08.8x\n", (int)Bl);
  printf("El    : %08.8x\n", (int)(El->El));
  printf("Fl    : %08.8x\n", (int)(Fl->Fl));

  return (0);
}

int
msll(s1, s2)
     unsigned int s1, s2;
{
  return ((s1&0xffff0000) << s2)|((s1 << s2)&0x0000ffff); /* immediate */
}
int
msrl(s1, s2)
     unsigned int s1, s2;
{
  return ((s1 >> s2)&0xffff0000)|((s1&0x0000ffff) >> s2); /* immediate */
}
int
msra(s1, s2)
     unsigned int s1, s2;
{
  return (((int)s1 >> s2)&0xffff0000)|(((int)(s1<<16)>>(16+s2))&0x0000ffff); /* immediate */
}
int
b2h(s1, s2) /* BYTE->HALF s2==0: 0x00001122 -> 0x00110022, s2==1: 0x11220000 -> 0x00110022 */
     unsigned int s1, s2;
{
  return s2==0 ? ((s1<<8) & 0x00ff0000) | ( s1      & 0x000000ff):
                 ((s1>>8) & 0x00ff0000) | ((s1>>16) & 0x000000ff);
}
int
h2b(s1, s2) /* HALF->BYTE s2==0: 0x11112222 -> 0x00001122, s2==1: 0x11112222 -> 0x11220000 */
     unsigned int s1, s2;
{
  return s2==0 ? (((s1>>16   )<0x100 ? (s1>>16   )&0xff : 255)<< 8)
                |(((s1&0xffff)<0x100 ? (s1&0xffff)&0xff : 255)    )
               : (((s1>>16   )<0x100 ? (s1>>16   )&0xff : 255)<<24)
                |(((s1&0xffff)<0x100 ? (s1&0xffff)&0xff : 255)<<16);
}
int
madd(s1, s2) /* ADD (16bit+16bit)[2] -> 16bit[2] */
     unsigned int s1, s2;
{
  unsigned int t1, t2;
  t1 = ( s1     >>16)+( s2     >>16);
  if (t1 > 0x0000ffff) t1 = 0xffff;
  t2 = ((s1<<16)>>16)+((s2<<16)>>16);
  if (t2 > 0x0000ffff) t2 = 0xffff;
  return (t1<<16)|t2;
}
int
msub(s1, s2) /* SUB (16bit-16bit)[2] -> 16bit[2] */
     unsigned int s1, s2;
{
  unsigned int t1, t2;
  t1 = ( s1     >>16)-( s2     >>16);
  if (t1 > 0x0000ffff) t1 = 0x0000;
  t2 = ((s1<<16)>>16)-((s2<<16)>>16);
  if (t2 > 0x0000ffff) t2 = 0x0000;
  return (t1<<16)|t2;
}
int
mmul(s1, s2) /* MUL (10bit*9bit)[2] -> 16bit[2] */
     unsigned int s1, s2;
{
  unsigned int t1, t2;
  t1 = (( s1     >>16)&0x3ff)*(s2&0x1ff);
  if (t1 > 0x0000ffff) t1 = 0xffff;
  t2 = (((s1<<16)>>16)&0x3ff)*(s2&0x1ff);
  if (t2 > 0x0000ffff) t2 = 0xffff;
  return (t1<<16)|t2;
}
int
pmin3(x, y, z)
     unsigned int x, y, z;
{
  unsigned char r[3], g[3], b[3];
  unsigned char t;
  r[0]=x>>24&0xff;  r[1]=y>>24&0xff;  r[2]=z>>24&0xff;
  g[0]=x>>16&0xff;  g[1]=y>>16&0xff;  g[2]=z>>16&0xff;
  b[0]=x>> 8&0xff;  b[1]=y>> 8&0xff;  b[2]=z>> 8&0xff;
  if (r[0] < r[1]) {t = r[1]; r[1]=r[0]; r[0]=t;}
  if (g[0] < g[1]) {t = g[1]; g[1]=g[0]; g[0]=t;}
  if (b[0] < b[1]) {t = b[1]; b[1]=b[0]; b[0]=t;}
  if (r[1] < r[2]) {t = r[2]; r[2]=r[1]; r[1]=t;}
  if (g[1] < g[2]) {t = g[2]; g[2]=g[1]; g[1]=t;}
  if (b[1] < b[2]) {t = b[2]; b[2]=b[1]; b[1]=t;}
  return (r[2]<<24)|(g[2]<<16)|(b[2]<<8);
}
int
pmid3(x, y, z)
     unsigned int x, y, z;
{
  unsigned char r[3], g[3], b[3];
  unsigned char t;
  r[0]=x>>24&0xff;  r[1]=y>>24&0xff;  r[2]=z>>24&0xff;
  g[0]=x>>16&0xff;  g[1]=y>>16&0xff;  g[2]=z>>16&0xff;
  b[0]=x>> 8&0xff;  b[1]=y>> 8&0xff;  b[2]=z>> 8&0xff;
  if (r[0] > r[1]) {t = r[1]; r[1]=r[0]; r[0]=t;}
  if (g[0] > g[1]) {t = g[1]; g[1]=g[0]; g[0]=t;}
  if (b[0] > b[1]) {t = b[1]; b[1]=b[0]; b[0]=t;}
  if (r[1] > r[2]) {t = r[2]; r[2]=r[1]; r[1]=t;}
  if (g[1] > g[2]) {t = g[2]; g[2]=g[1]; g[1]=t;}
  if (b[1] > b[2]) {t = b[2]; b[2]=b[1]; b[1]=t;}
  if (r[0] > r[1]) {t = r[1]; r[1]=r[0]; r[0]=t;}
  if (g[0] > g[1]) {t = g[1]; g[1]=g[0]; g[0]=t;}
  if (b[0] > b[1]) {t = b[1]; b[1]=b[0]; b[0]=t;}
  return (r[1]<<24)|(g[1]<<16)|(b[1]<<8);
}
int
pmax3(x, y, z)
     unsigned int x, y, z;
{
  unsigned char r[3], g[3], b[3];
  unsigned char t;
  r[0]=x>>24&0xff;  r[1]=y>>24&0xff;  r[2]=z>>24&0xff;
  g[0]=x>>16&0xff;  g[1]=y>>16&0xff;  g[2]=z>>16&0xff;
  b[0]=x>> 8&0xff;  b[1]=y>> 8&0xff;  b[2]=z>> 8&0xff;
  if (r[0] > r[1]) {t = r[1]; r[1]=r[0]; r[0]=t;}
  if (g[0] > g[1]) {t = g[1]; g[1]=g[0]; g[0]=t;}
  if (b[0] > b[1]) {t = b[1]; b[1]=b[0]; b[0]=t;}
  if (r[1] > r[2]) {t = r[2]; r[2]=r[1]; r[1]=t;}
  if (g[1] > g[2]) {t = g[2]; g[2]=g[1]; g[1]=t;}
  if (b[1] > b[2]) {t = b[2]; b[2]=b[1]; b[1]=t;}
  return (r[2]<<24)|(g[2]<<16)|(b[2]<<8);
}
int
pmin2(x, y)
     unsigned int x, y;
{
  unsigned char r[2], g[2], b[2];
  unsigned char t;
  r[0]=x>>24&0xff;  r[1]=y>>24&0xff;
  g[0]=x>>16&0xff;  g[1]=y>>16&0xff;
  b[0]=x>> 8&0xff;  b[1]=y>> 8&0xff;
  if (r[0] < r[1]) {t = r[1]; r[1]=r[0]; r[0]=t;}
  if (g[0] < g[1]) {t = g[1]; g[1]=g[0]; g[0]=t;}
  if (b[0] < b[1]) {t = b[1]; b[1]=b[0]; b[0]=t;}
  return (r[1]<<24)|(g[1]<<16)|(b[1]<<8);
}
int
pmax2(x, y)
     unsigned int x, y;
{
  unsigned char r[2], g[2], b[2];
  unsigned char t;
  r[0]=x>>24&0xff;  r[1]=y>>24&0xff;
  g[0]=x>>16&0xff;  g[1]=y>>16&0xff;
  b[0]=x>> 8&0xff;  b[1]=y>> 8&0xff;
  if (r[0] > r[1]) {t = r[1]; r[1]=r[0]; r[0]=t;}
  if (g[0] > g[1]) {t = g[1]; g[1]=g[0]; g[0]=t;}
  if (b[0] > b[1]) {t = b[1]; b[1]=b[0]; b[0]=t;}
  return (r[1]<<24)|(g[1]<<16)|(b[1]<<8);
}
int
df(l, r)
     unsigned int l, r;
{
  return(ad(l>>24&0xff,r>>24&0xff)+ad(l>>16&0xff,r>>16&0xff)+ad(l>>8&0xff,r>>8&0xff));
}

void
tone_curve(r, d, t)
     unsigned int *r, *d;
     unsigned char *t;
{
  int j;
  for (j=0; j<WD; j++) {
    *d = ((t)[*r>>24])<<24 | (t[256+((*r>>16)&255)])<<16 | (t[512+((*r>>8)&255)])<<8;
    r++; d++;
  }
}

void
hokan1(c, p, s)
     unsigned int *c, *p;
     unsigned short *s; /*[WD/4][8];*/
     /*hokan1(&W[i*WD], &R[(i+j)*WD], &SAD1[i/4][j+4]);*/
{
  int j;
  for (j=0; j<WD; j++) {
    int j2 = j/4*4;
    int k = j%4*2;                                                                                         /* j2+k:0,2,4,6; 4,6,8,10; 8,10,12,14; 12,14,16,18; */
    * s    += df(c[j2],p[j2+k-4]) + df(c[j2+1],p[j2+k-3]) + df(c[j2+2],p[j2+k-2]) + df(c[j2+3],p[j2+k-1]); /* p[-4],p[-3],p[-2],p[-1] -> p[-2],p[-1],p[0],p[1] */
    *(s+1) += df(c[j2],p[j2+k-3]) + df(c[j2+1],p[j2+k-2]) + df(c[j2+2],p[j2+k-1]) + df(c[j2+3],p[j2+k  ]); /* p[-3],p[-2],p[-1],p[ 0] -> p[-1],p[ 0],p[1],p[2] */
    s += 2;
  }
}

void
hokan2(s, sminxy, k)
     unsigned short *s; /*[WD/4][8];*/
     unsigned int *sminxy;
     int k;
{
  int j;
  for (j=0; j<WD; j++) { /* j%4==0の時のみsminxy[j]に有効値．他はゴミ */
    int l1 = ((-2)<<24)|k|*(s  );
    int l2 = ((-1)<<24)|k|*(s+1);
    int l3 = ((-1)<<24)|k|*(s+2);
    int l4 = (( 0)<<24)|k|*(s+3);
    int l5 = (( 0)<<24)|k|*(s+4);
    int l6 = (( 0)<<24)|k|*(s+5);
    int l7 = (( 1)<<24)|k|*(s+6);
    int l8 = (( 1)<<24)|k|*(s+7);
    if ((sminxy[j]&0xffff) > *(s  )) sminxy[j] = l1;
    if ((sminxy[j]&0xffff) > *(s+1)) sminxy[j] = l2;
    if ((sminxy[j]&0xffff) > *(s+2)) sminxy[j] = l3;
    if ((sminxy[j]&0xffff) > *(s+3)) sminxy[j] = l4;
    if ((sminxy[j]&0xffff) > *(s+4)) sminxy[j] = l5;
    if ((sminxy[j]&0xffff) > *(s+5)) sminxy[j] = l6;
    if ((sminxy[j]&0xffff) > *(s+6)) sminxy[j] = l7;
    if ((sminxy[j]&0xffff) > *(s+7)) sminxy[j] = l8;
    s += 2;
  }
}

void
hokan3(sminxy, r, d, k)
     unsigned int *sminxy;
     unsigned int *r, *d;
     int k;
{
  int j;
  for (j=0; j<WD; j++) {
    int x = (int) sminxy[j/4*4]>>24;
    int y = (int)(sminxy[j/4*4]<<8)>>24;
    if (y == k) d[j] = r[j+x];
  }
}

void
expand4k(p, r, kad, sk1, sk2)
     unsigned int *p, *r;
     int kad, sk1, sk2;
{
  /*    ┌─┬─┬─┐              */
  /*    │  │k-1   │ p[k][l:320]  */
  /*    ├─┼─┼─┤ r[i][j:1024] */
  /*     l-1│kl│l+1  i:1-767      */
  /*    ├─┼─┼─┤              */
  /*    │  │l+1   │              */
  /*    └─┴─┴─┘              */

  /*  ┌──┬─────────────┐    */
  /*  │┌─│───┐　　　　          │    */
  /*  ││  │　　　│　　　　          │k-1 */
  /*  ├──┼─────────────┤    */
  /*  ││  │★　　│　　　　         0│    */
  /*  │└─│───┘　　　　          │    */
  /*  │    │(((i*HT)<<4)/768)&15 : 8  │k   */
  /*  │    │                          │    */
  /*  │    │                        15│    */
  /*  ├──┼─────────────┤    */
  /*  │    │　　　　　　　　          │k+1 */
  /*  └──┴─────────────┘    */
  /*  ★を中心とする正方形が２×２領域の個々と重なる面積比をkfraqとlfraqで表現する */

  int j;
  unsigned int ph, pl, x;

  for (j=0; j<1024; j++) { /* 本当は4095まで */
    int p1 = j*WD/1024;
    int lfraq = (((j*WD)<<4)/1024)&15; /* 4bit */
    int lad = 16-ad(lfraq,8);
    int sl1 = ss(lfraq,8);
    int sl2 = ss(8,lfraq);
    int r1 = kad*lad; /* 4bit*4bit */
    int r3 = kad*sl1; /* 4bit*4bit */
    int r2 = kad*sl2; /* 4bit*4bit */
    int r5 = sk1*lad; /* 4bit*4bit */
    int r9 = sk1*sl1; /* 4bit*4bit */
    int r8 = sk1*sl2; /* 4bit*4bit */
    int r4 = sk2*lad; /* 4bit*4bit */
    int r7 = sk2*sl1; /* 4bit*4bit */
    int r6 = sk2*sl2; /* 4bit*4bit */
#if 0
    printf(" %d %d %d",   r6,r4,r7);
    printf(" %d %d %d",   r2,r1,r3);
    printf(" %d %d %d",   r8,r5,r9);
    printf(" %d\n",       r1+r2+r3+r4+r5+r6+r7+r8+r9); /* 合計は必ず256になるはず */
#endif
#if 0
    *r = (unsigned int)((p[p1]>>24&0xff)*r1
          +  (p[p1   -1]>>24&0xff)*r2 + (p[p1   +1]>>24&0xff)*r3 + (p[p1-WD  ]>>24&0xff)*r4 + (p[p1+WD  ]>>24&0xff)*r5
          +  (p[p1-WD-1]>>24&0xff)*r6 + (p[p1-WD+1]>>24&0xff)*r7 + (p[p1+WD-1]>>24&0xff)*r8 + (p[p1+WD+1]>>24&0xff)*r9)/256<<24
          | (unsigned int)((p[p1]>>16&0xff)*r1
          +  (p[p1   -1]>>16&0xff)*r2 + (p[p1   +1]>>16&0xff)*r3 + (p[p1-WD  ]>>16&0xff)*r4 + (p[p1+WD  ]>>16&0xff)*r5
          +  (p[p1-WD-1]>>16&0xff)*r6 + (p[p1-WD+1]>>16&0xff)*r7 + (p[p1+WD-1]>>16&0xff)*r8 + (p[p1+WD+1]>>16&0xff)*r9)/256<<16
          | (unsigned int)((p[p1]>> 8&0xff)*r1
          +  (p[p1   -1]>> 8&0xff)*r2 + (p[p1   +1]>> 8&0xff)*r3 + (p[p1-WD  ]>> 8&0xff)*r4 + (p[p1+WD  ]>> 8&0xff)*r5
          +  (p[p1-WD-1]>> 8&0xff)*r6 + (p[p1-WD+1]>> 8&0xff)*r7 + (p[p1+WD-1]>> 8&0xff)*r8 + (p[p1+WD+1]>> 8&0xff)*r9)/256<<8;
#else
    ph = madd(mmul(b2h(p[p1     ], 1), r1), mmul(b2h(p[p1-1], 1), r2));
    ph = madd(mmul(b2h(p[p1   +1], 1), r3), ph);
    ph = madd(mmul(b2h(p[p1-WD  ], 1), r4), ph);
    ph = madd(mmul(b2h(p[p1+WD  ], 1), r5), ph);
    ph = madd(mmul(b2h(p[p1-WD-1], 1), r6), ph);
    ph = madd(mmul(b2h(p[p1-WD+1], 1), r7), ph);
    ph = madd(mmul(b2h(p[p1+WD-1], 1), r8), ph);
    ph = madd(mmul(b2h(p[p1+WD+1], 1), r9), ph);
    pl = madd(mmul(b2h(p[p1     ], 0), r1), mmul(b2h(p[p1-1], 0), r2));
    pl = madd(mmul(b2h(p[p1   +1], 0), r3), pl);
    pl = madd(mmul(b2h(p[p1-WD  ], 0), r4), pl);
    pl = madd(mmul(b2h(p[p1+WD  ], 0), r5), pl);
    pl = madd(mmul(b2h(p[p1-WD-1], 0), r6), pl);
    pl = madd(mmul(b2h(p[p1-WD+1], 0), r7), pl);
    pl = madd(mmul(b2h(p[p1+WD-1], 0), r8), pl);
    pl = madd(mmul(b2h(p[p1+WD+1], 0), r9), pl);
    *r = h2b(msrl(ph, 8), 1) | h2b(msrl(pl, 8), 0);
#endif
    r++;
  }
}

inline unsigned char
limitRGB(int c) {
  if (c<0x00) return 0x00;
  if (c>0xff) return 0xff;
  return c;
}

void
unsharp(p, r) 
     unsigned char *p;
     unsigned char *r;
{
  int t0,t1,t2;
  int j, k;
  int p0 = ((0  )*WD+(1  ))*4;  // p1 p5 p2
  int p1 = ((0-1)*WD+(1-1))*4;  // p6 p0 p7
  int p2 = ((0-1)*WD+(1+1))*4;  // p3 p8 p4 
  int p3 = ((0+1)*WD+(1-1))*4;
  int p4 = ((0+1)*WD+(1+1))*4;
  int p5 = ((0-1)*WD+(1  ))*4;
  int p6 = ((0  )*WD+(1-1))*4;
  int p7 = ((0  )*WD+(1+1))*4;
  int p8 = ((0+1)*WD+(1  ))*4;
  for (j=0; j<WD; j++) {
    r[p0+0] = 0;

    t0 = p[p0+1];
    t1 = p[p1+1] + p[p2+1] + p[p3+1] + p[p4+1];
    t2 = p[p5+1] + p[p6+1] + p[p7+1] + p[p8+1];
    r[p0+1] = limitRGB(( t0 * 239 - t1 * 13 - t2 * 15 - t2/4) >> 7);

    t0 = p[p0+2];
    t1 = p[p1+2] + p[p2+2] + p[p3+2] + p[p4+2];
    t2 = p[p5+2] + p[p6+2] + p[p7+2] + p[p8+2];
    r[p0+2] = limitRGB(( t0 * 239 - t1 * 13 - t2 * 15 - t2/4) >> 7);

    t0 = p[p0+3];
    t1 = p[p1+3] + p[p2+3] + p[p3+3] + p[p4+3];
    t2 = p[p5+3] + p[p6+3] + p[p7+3] + p[p8+3];
    r[p0+3] = limitRGB(( t0 * 239 - t1 * 13 - t2 * 15 - t2/4) >> 7);

    p0+=4; p1+=4; p2+=4; p3+=4; p4+=4; p5+=4; p6+=4; p7+=4; p8+=4;
  }
}

void
blur(p, r)
     unsigned int *p, *r;
{
  int j, k, l;

  int p0 = (0  )*WD  ;
  int p1 = (0  )*WD  ;
  int p2 = (0  )*WD-1;
  int p3 = (0  )*WD+1;
  int p4 = (0-1)*WD  ;
  int p5 = (0+1)*WD  ;
  int p6 = (0-1)*WD-1;
  int p7 = (0-1)*WD+1;
  int p8 = (0+1)*WD-1;
  int p9 = (0+1)*WD+1;
  for (j=0; j<WD; j++) {
#if 0
    r[p0] = (unsigned int)((p[p1]>>24&0xff)*20
           +  (p[p2]>>24&0xff)*12 + (p[p3]>>24&0xff)*12 + (p[p4]>>24&0xff)*12 + (p[p5]>>24&0xff)*12
           +  (p[p6]>>24&0xff)* 8 + (p[p7]>>24&0xff)* 8 + (p[p8]>>24&0xff)* 8 + (p[p9]>>24&0xff)* 8)/100<<24
           | (unsigned int)((p[p1]>>16&0xff)*20
           +  (p[p2]>>16&0xff)*12 + (p[p3]>>16&0xff)*12 + (p[p4]>>16&0xff)*12 + (p[p5]>>16&0xff)*12
           +  (p[p6]>>16&0xff)* 8 + (p[p7]>>16&0xff)* 8 + (p[p8]>>16&0xff)* 8 + (p[p9]>>16&0xff)* 8)/100<<16
           | (unsigned int)((p[p1]>> 8&0xff)*20
           +  (p[p2]>> 8&0xff)*12 + (p[p3]>> 8&0xff)*12 + (p[p4]>> 8&0xff)*12 + (p[p5]>> 8&0xff)*12
           +  (p[p6]>> 8&0xff)* 8 + (p[p7]>> 8&0xff)* 8 + (p[p8]>> 8&0xff)* 8 + (p[p9]>> 8&0xff)* 8)/100<<8;
#elif 0
    unsigned char s[9], t;
    s[0]=p[p1]>>24;s[1]=p[p2]>>24;s[2]=p[p3]>>24;s[3]=p[p4]>>24;s[4]=p[p5]>>24;s[5]=p[p6]>>24;s[6]=p[p7]>>24;s[7]=p[p8]>>24;s[8]=p[p9]>>24;
    for (k=8; k>=4; k--) for (l=0; l<k; l++) if (s[l]>s[l+1]) {t=s[l]; s[l]=s[l+1]; s[l+1]=t;}
    r[p0]  = s[4]<<24;
    s[0]=p[p1]>>16;s[1]=p[p2]>>16;s[2]=p[p3]>>16;s[3]=p[p4]>>16;s[4]=p[p5]>>16;s[5]=p[p6]>>16;s[6]=p[p7]>>16;s[7]=p[p8]>>16;s[8]=p[p9]>>16;
    for (k=8; k>=4; k--) for (l=0; l<k; l++) if (s[l]>s[l+1]) {t=s[l]; s[l]=s[l+1]; s[l+1]=t;}
    r[p0] |= s[4]<<16;
    s[0]=p[p1]>> 8;s[1]=p[p2]>> 8;s[2]=p[p3]>> 8;s[3]=p[p4]>> 8;s[4]=p[p5]>> 8;s[5]=p[p6]>> 8;s[6]=p[p7]>> 8;s[7]=p[p8]>> 8;s[8]=p[p9]>> 8;
    for (k=8; k>=4; k--) for (l=0; l<k; l++) if (s[l]>s[l+1]) {t=s[l]; s[l]=s[l+1]; s[l+1]=t;}
    r[p0] |= s[4]<< 8;
#else
    unsigned int s0,s1,s2,s3,s4,s5,s6,s7,s8;
    unsigned int t0,t1,t2;
    s0=p[p1];s1=p[p2];s2=p[p3];s3=p[p4];s4=p[p5];s5=p[p6];s6=p[p7];s7=p[p8];s8=p[p9];
    /*┌─┬─┬─┐  ┌─┬─┬─┐  ┌─┬─┬─┐  ┌─┬─┬─┐  ┌─┬─┬─┐  ┌─┬─┬─┐  ┌─┐
      │５│３│６│  │５＜３＜★│  │５│３│２│  │５＜３＜★│  │５│  │３│  │５＜  ＜★│  │５│
      ├∨┼∨┼∨┤  ├─┼─┼─┤  ├∨┼∨┼∨┤  ├─┼─┼─┤  ├∨┼─┼∨┤  ├─┼─┼─┤  ├∨┤
      │１│０│２│  │１＜０＜２│  │−│０│−│  │    ０    │  │  │  │０│  │  │  │０│  │０│中間値確定
      ├∨┼∨┼∨┤  ├─┼─┼─┤  ├∨┼∨┼∨┤  ├─┼─┼─┤  ├∨┼─┼∨┤  ├─┼─┼─┤  ├∨┤
      │７│４│８│  │★＜４＜８│  │１│４│８│  │★＜４＜８│  │４│  │８│  │★＜  ＜８│  │８│
      └─┴─┴─┘  └─┴─┴─┘  └─┴─┴─┘  └─┴─┴─┘  └─┴─┴─┘  └─┴─┴─┘  └─┘*/
    t0 = pmax3(s5,s1,s7); t1 = pmid3(s5,s1,s7); t2 = pmin3(s5,s1,s7);      s5 = t0; s1 = t1; s7 = t2;
    t0 = pmax3(s3,s0,s4); t1 = pmid3(s3,s0,s4); t2 = pmin3(s3,s0,s4);      s3 = t0; s0 = t1; s4 = t2;
    t0 = pmax3(s6,s2,s8); t1 = pmid3(s6,s2,s8); t2 = pmin3(s6,s2,s8);      s6 = t0; s2 = t1; s8 = t2;

    t0 = pmin3(s5,s3,s6); t1 = pmid3(s5,s3,s6);                            s5 = t0; s3 = t1;
    t0 = pmin3(s1,s0,s2); t1 = pmid3(s1,s0,s2); t2 = pmax3(s1,s0,s2);      s1 = t0; s0 = t1; s2 = t2;
    t0 = pmid3(s7,s4,s8); t1 = pmax3(s7,s4,s8);                            s4 = t0; s8 = t1;

    t0 = pmax2(s5,s1);    t1 = pmin2(s5,s1);                               s5 = t0; s1 = t1;
    t0 = pmax3(s3,s0,s4); t1 = pmid3(s3,s0,s4); t2 = pmin3(s3,s0,s4);      s3 = t0; s0 = t1; s4 = t2;
    t0 = pmax2(s2,s8);    t1 = pmin2(s2,s8);                               s2 = t0; s8 = t1;

    t0 = pmin3(s5,s3,s2); t1 = pmid3(s5,s3,s2);                            s5 = t0; s3 = t1;
    t0 = pmid3(s1,s4,s8); t1 = pmax3(s1,s4,s8);                            s4 = t0; s8 = t1;

    t0 = pmax2(s5,s4);    t1 = pmin2(s5,s4);                               s5 = t0; s4 = t1;
    t0 = pmax3(s3,s0,s8); t1 = pmid3(s3,s0,s8); t2 = pmin3(s3,s0,s8);      s3 = t0; s0 = t1; s8 = t2;

    s5 = pmin2(s5,s3);    s8 = pmax2(s4,s8);

    r[p0] = pmid3(s5,s0,s8);
#endif
    p0++; p1++; p2++; p3++; p4++; p5++; p6++; p7++; p8++; p9++;
  }
}

void
edge(p, r)
     unsigned int *p;
     unsigned char *r;
{
  int j, k;

  int p0 = (0  )*WD  ;
  int p1 = (0-1)*WD-1;
  int p2 = (0+1)*WD+1;
  int p3 = (0-1)*WD  ;
  int p4 = (0+1)*WD  ;
  int p5 = (0-1)*WD+1;
  int p6 = (0+1)*WD-1;
  int p7 = (0  )*WD-1;
  int p8 = (0  )*WD+1;
  for (j=0; j<WD; j++) {
    int d1 = df(p[p1]&MASK,p[p2]&MASK)
           + df(p[p3]&MASK,p[p4]&MASK)
           + df(p[p5]&MASK,p[p6]&MASK)
           + df(p[p7]&MASK,p[p8]&MASK);
    /* 0 < d1(42) < 256*2*4 */
    r[p0] = d1 < EDGEDET ? 0 : PIXMAX;
    p0++; p1++; p2++; p3++; p4++; p5++; p6++; p7++; p8++;
  }
}

void
bblur(p, r)
     unsigned char *p, *r;
{
  int j, k, l, d1, d2, d3, d4;

  int p1 = (0-1)*WD-1;
  int p2 = (0  )*WD-1;
  int p3 = (0+1)*WD-1;
  int p4 = (0-1)*WD  ;
  int p5 = (0  )*WD  ;
  int p6 = (0+1)*WD  ;
  int p7 = (0-1)*WD+1;
  int p8 = (0  )*WD+1;
  int p9 = (0+1)*WD+1;
  int pa = (0-1)*WD+2;
  int pb = (0  )*WD+2;
  int pc = (0+1)*WD+2;
  int pd = (0-1)*WD+3;
  int pe = (0  )*WD+3;
  int pf = (0+1)*WD+3;
  int pg = (0-1)*WD+4;
  int ph = (0  )*WD+4;
  int pi = (0+1)*WD+4;
  for (j=0; j<WD; j+=4) {
    d1 = p[p1] + p[p2] + p[p3] + p[p4] + p[p5] + p[p6] + p[p7] + p[p8] + p[p9];
    if (d1 < 255*5) r[p5] = 0; else r[p5] = 255;
    d2 = p[p4] + p[p5] + p[p6] + p[p7] + p[p8] + p[p9] + p[pa] + p[pb] + p[pc];
    if (d2 < 255*5) r[p8] = 0; else r[p8] = 255;
    d3 = p[p7] + p[p8] + p[p9] + p[pa] + p[pb] + p[pc] + p[pd] + p[pe] + p[pf];
    if (d3 < 255*5) r[pb] = 0; else r[pb] = 255;
    d4 = p[pa] + p[pb] + p[pc] + p[pd] + p[pe] + p[pf] + p[pg] + p[ph] + p[pi];
    if (d4 < 255*5) r[pe] = 0; else r[pe] = 255;
    p1+=4; p2+=4; p3+=4; p4+=4; p5+=4; p6+=4; p7+=4; p8+=4; p9+=4;
    pa+=4; pb+=4; pc+=4; pd+=4; pe+=4; pf+=4; pg+=4; ph+=4; pi+=4;
  }
}

int
procimage(image) Uint *image;
{
  int i, j, k, l, dx, dy;

  for(i=0; i<256; i++) {
    lut[i+  0] = 0xff-i;
    lut[i+256] = 0xff-i;
    lut[i+512] = 0xff-i;
  }

  copy_X(0, image);

#if 0
  /*****************************************************/
  /* gamma */
  puts("tone-start");
  for(i=0; i<HT; i++)
    tone_curve( &image[i*WD], &D[i*WD], lut );
  copy_X(1, D);
  x11_update();

  /*****************************************************/
  /* shift */
  puts("shift-start");
  for (i=0; i<HT; i++) { /* scan-lines */
    int p0 = i*WD;
    for (j=0; j<WD; j++) {
      W[p0] = image[p0];
      p0++;
    }
  }
  for (i=120; i<200; i++) { /* scan-lines */
    for (j=120; j<200; j++) {
      W[i*WD+j+4] = image[i*WD+j];
    }
  }
  for (i=20; i<100; i++) { /* scan-lines */
    for (j=20; j<100; j++) {
      W[(i+4)*WD+j+4] = image[i*WD+j];
    }
  }
  for (i=20; i<100; i++) { /* scan-lines */
    for (j=220; j<300; j++) {
      W[(i+4)*WD+j] = image[i*WD+j];
    }
  }
  copy_X(2, W);
  x11_update();

  /*****************************************************/
  /* hokan1 SAD計算 */
  for (i=0; i<sizeof(struct SAD1)/4; i++) { /* scan-lines */
    *((int*)(SAD1->SAD1)+i) = 0;
  }
  puts("hokan1-start");
  for (i=4; i<HT-4; i++) { /* scan-lines */
    for (k=-4; k<4; k++)
      hokan1(&W[i*WD], &image[(i+k)*WD], SAD1->SAD1[i/4][k+4]);
  }
  for (i=4; i<HT-4; i++) { /* scan-lines */
    int p0 = i*WD;
    for (j=0; j<WD; j++) {
      D[p0] = (int)(SAD1->SAD1[i/4][i%4*2][j/4][j%4*2]/32)<<16;
      p0++;
    }
  }
  copy_X(3, D);
  x11_update();

  /***************************************************/
  /* hokan2 SAD最小値に対応するXYを計算              */
  /* for (i=0; i<HT; i+=4) {                         */
  /*   for (j=0; j<WD; j+=4) {                       */
  /*     int sadmin = 0xffff;                        */
  /*     int x = 0, y = 0;                           */
  /*     for (k=-4; k<4; k++) {                      */
  /*       for (l=-4; l<4; l++) {                    */
  /*         if (sadmin > SAD1[i/4][k+4][j/4][l+4]) { */
  /*           sadmin = SAD1[i/4][k+4][j/4][l+4];     */
  /*           x = l; y = k;                         */
  /*         }                                       */
  /*       }                                         */
  /*     }                                           */
  /*     W[i*WD+j] = (x/2<<16)|((y/2)&0xffff);       */
  /*   }                                             */
  /* }                                               */
  /***************************************************/
  for (i=0; i<HT; i+=4) { /* scan-lines */
    for (j=0; j<WD; j++)
      W[i*WD+j] = 0x0000ffff; /* x,y,sadmin */
  }
  puts("hokan2-start");
  for (i=4; i<HT-4; i+=4) { /* scan-lines */
    for (k=-4; k<4; k++)
      hokan2(SAD1->SAD1[i/4][k+4], &W[i*WD], (((k/2)&0xff)<<16)); /* 8回走査してSAD最小位置を求める */
  }
  for (i=4; i<HT-4; i++) { /* scan-lines */
    for (j=0; j<WD; j++) {
      int x = (int) W[(i/4*4)*WD+(j/4*4)]>>24;
      int y = (int)(W[(i/4*4)*WD+(j/4*4)]<<8)>>24;
      D[i*WD+j] = (ad(x,0)<<30)|(ad(y,0)<<22);
    }
  }
  copy_X(4, D);
  x11_update();

  /*****************************************************/
  /* hokan3 XYを元に, T1計算                           */
  /* for (i=0; i<HT; i+=4) {                           */
  /*   for (j=0; j<WD; j+=4) {                         */
  /*     int x = (int) W[i*WD+j]>>16;                  */
  /*     int y = (int)(W[i*WD+j]<<16)>>16;             */
  /*     for (k=0; k<4; k++) {                         */
  /*	   for (l=0; l<4; l++) {                       */
  /*	     D[(i+k)*WD+(j+l)] = R[(i+k+y)*WD+(j+l+x)];*/
  /*	   }                                           */
  /*     }                                             */
  /*   }                                               */
  /* }                                                 */
  /*****************************************************/
  puts("hokan3-start");
  for (i=0; i<HT; i++) { /* scan-lines */
    for (k=-2; k<2; k++)
      hokan3(&W[(i/4*4)*WD], &image[(i+k)*WD], &D[i*WD], k);
  }
  copy_X(5, D);
  x11_update();

  /*****************************************************/
  /* expand 3x3 */
  puts("expand4k-start");
  for (i=1; i<HT-1; i++) { /* scan-lines */
    int k = i*HT/768;
    int kfraq = (((i*HT)<<4)/768)&15; /* 4bit */
    int kad = 16-ad(kfraq,8);
    int sk1 = ss(kfraq,8);
    int sk2 = ss(8,kfraq);
    expand4k(&image[k*WD], &(Xl->Xl[i][0]), kad, sk1, sk2);
  }
  for (i=0; i<HT; i++) { /* scan-lines */
    int p0 = i*WD;
    for (j=0; j<WD; j++) {
      W[p0] = Xl->Xl[i][j];
      p0++;
    }
  }
  copy_X(6, W);
  x11_update();

  /*****************************************************/
  /* unsharp 3x3 */
  puts("unsharp-start");
  for (i=1; i<HT-1; i++) { /* scan-lines */
    unsharp(&image[i*WD], &D[i*WD]);
  }
  copy_X(7, D);
  x11_update();

  /*****************************************************/
  /* blur 3x3 */
  puts("blur-start");
  for (i=1; i<HT-1; i++) { /* scan-lines */
    blur(&image[i*WD], &Bl[i*WD]);
  }
  for (i=0; i<BITMAP; i++)
    W[i] = Bl[i]; /* Bl */
  copy_X(8, W);
  x11_update();

  /*****************************************************/
  /* edge detection */
  puts("edge-start");
  for (i=1; i<HT-1; i++) { /* scan-lines */
    edge(&Bl[i*WD], &(El->El[i][0]));
  }
  for (i=0; i<HT; i++) { /* scan-lines */
    int p0 = i*WD;
    for (j=0; j<WD; j++) {
      W[p0] = (El->El[i][j])<<24;
      p0++;
    }
  }
  copy_X(9, W);
  x11_update();
#endif

  /*****************************************************/
  /* BW */
  puts("bw-start");
  for (i=0; i<HT; i++) { /* scan-lines */
    for (j=0; j<WD; j++) {
      Uint pix = image[i*WD+j];
      Uchar bw = ((pix>>24)*3 + ((pix>>16)&255)*4 + ((pix>>8)&255))/8;
      W[i*WD+j] = (bw<<24)|(bw<<16)|(bw<<8);
    }
  }
  /* copy_X(10, W); */
  x11_update();

  /*****************************************************/
  /* 8x8 BW */
  puts("8x8-start");
  for (i=15; i<HT-15+1; i+=HT/INSQRT) { /* scan-lines */
    for (j=55; j<WD-55+1; j+=HT/INSQRT) {
      Uint sum = 0;
      Uint thr = 100*30*30;
      for (k=-15; k<15; k++) {
	for (l=-15; l<15; l++) {
	  Uint bw = W[(i+k)*WD+(j+l)]>>24;
	  sum += bw;
	}
      }
      for (k=-15; k<15; k++) {
	for (l=-15; l<15; l++) {
	  if (sum > thr)
	    D[(i+k)*WD+(j+l)] = 0;
	  else
	    D[(i+k)*WD+(j+l)] = (255<<24)|(255<<16)|(255<<8);
	}
      }
    }
  }
  copy_X(1, D);
  x11_update();

  return (0);
}

/**********************************************************************************/
/* for File */
/**********************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/mman.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/cursorfont.h>

#define PPMHEADER   15

char magic[PPMHEADER] = {
  0x50, 0x36, 0x0A,        /* P6  */
  0x33, 0x32, 0x30, 0x20,  /* 320 */
  0x32, 0x34, 0x30, 0x0A,  /* 240 */
  0x32, 0x35, 0x35, 0x0A,  /* 255 */
};

int
ppm_capt(fr0, image) char *fr0; int *image;
{
  read_ppm(fr0, image);
  return (0);
}

int
read_ppm(file, ppm)
     char *file;
     unsigned int  *ppm;
{
  FILE  *fp;
  unsigned char buf[BITMAP*3];
  int i, j;

  if (!(fp = fopen(file, "r"))) {
    printf("Can't open %s\n", file);
    exit(1);
  }
  
  if (fread(buf, 1, PPMHEADER, fp) !=  PPMHEADER){
    printf("Can't read ppm header from %s\n", file);
    exit(1);
  }

  if (memcmp(buf, magic, PPMHEADER)) {
    printf("Can't match ppm header from %s\n", file);
    exit(1);
  }
  
  if (fread(buf, 1, BITMAP*3, fp) != BITMAP*3) {
    printf("Can't read ppm body from %s\n", file);
    exit(1);
  }

  for (i=0; i<HT; i++) {
    for (j=0; j<WD; j++) {
      ppm[i*WD+j] = buf[(i*WD+j)*3]<<24|buf[(i*WD+j)*3+1]<<16|buf[(i*WD+j)*3+2]<<8;
    }
  }

  fclose(fp);
  return (0);
}

int
write_ppm(file, ppm)
     char *file;
     unsigned int  *ppm;
{
  FILE  *fp;
  char buf[BITMAP*3];
  int i, j;
  
  if (!(fp = fopen(file, "w"))) {
    printf("Can't open %s\n", file);
    exit(1);
  }
  
  if (fwrite(magic, 1, PPMHEADER, fp) !=  PPMHEADER){
    printf("Can't write ppm header to %s\n", file);
    exit(1);
  }

  for (i=0; i<HT; i++) {
    for (j=0; j<WD; j++) {
      buf[(i*WD+j)*3  ] = ppm[i*WD+j]>>24;
      buf[(i*WD+j)*3+1] = ppm[i*WD+j]>>16;
      buf[(i*WD+j)*3+2] = ppm[i*WD+j]>> 8;
    }
  }

  if (fwrite(buf, 1, BITMAP*3, fp) != BITMAP*3) {
    printf("Can't write ppm body to %s\n", file);
    exit(1);
  }

  fclose(fp);
  return (0);
}

/**********************************************************************************/
/* for CAM */
/**********************************************************************************/

#ifndef NOV4L2
#include <linux/videodev2.h>
#include <libv4l2.h>

#define CLEAR(x) memset(&(x), 0, sizeof(x))

struct buffer {
  void   *start;
  size_t length;
};

static void
xioctl(int fh, int request, void *arg)
{
  int r;
  
  do {
    r = v4l2_ioctl(fh, request, arg);
  } while (r == -1 && ((errno == EINTR) || (errno == EAGAIN)));
  
  if (r == -1) {
    fprintf(stderr, "error %d, %s\n", errno, strerror(errno));
    exit(EXIT_FAILURE);
  }
}

  struct v4l2_format              fmt;
  struct v4l2_buffer              buf;
  struct v4l2_requestbuffers      req;
  enum v4l2_buf_type              type;
  fd_set                          fds;
  struct timeval                  tv;
  int                             r, fd = -1;
  unsigned int                    i, n_buffers;
  char                            *dev_name = "/dev/video0";
  char                            out_name[256];
  FILE                            *fout;
  struct buffer                   *buffers;

int
cam_open() {
  fd = v4l2_open(dev_name, O_RDWR | O_NONBLOCK, 0);
  if (fd < 0) {
    perror("Cannot open device");
    exit(EXIT_FAILURE);
  }
  
  CLEAR(fmt);
  fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
  fmt.fmt.pix.width       = 320;
  fmt.fmt.pix.height      = 240;
  fmt.fmt.pix.pixelformat = V4L2_PIX_FMT_RGB24;
  fmt.fmt.pix.field       = V4L2_FIELD_INTERLACED;
  xioctl(fd, VIDIOC_S_FMT, &fmt);
  if (fmt.fmt.pix.pixelformat != V4L2_PIX_FMT_RGB24) {
    printf("Libv4l didn't accept RGB24 format. Can't proceed.\n");
    exit(EXIT_FAILURE);
  }
  if ((fmt.fmt.pix.width != 320) || (fmt.fmt.pix.height != 240))
    printf("Warning: driver is sending image at %dx%d\n",
	   fmt.fmt.pix.width, fmt.fmt.pix.height);
  
  CLEAR(req);
  req.count = 2;
  req.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
  req.memory = V4L2_MEMORY_MMAP;
  xioctl(fd, VIDIOC_REQBUFS, &req);
  
  buffers = calloc(req.count, sizeof(*buffers));
  for (n_buffers = 0; n_buffers < req.count; ++n_buffers) {
    CLEAR(buf);
    
    buf.type        = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    buf.memory      = V4L2_MEMORY_MMAP;
    buf.index       = n_buffers;
    
    xioctl(fd, VIDIOC_QUERYBUF, &buf);
    
    buffers[n_buffers].length = buf.length;
    buffers[n_buffers].start = v4l2_mmap(NULL, buf.length,
					 PROT_READ | PROT_WRITE, MAP_SHARED,
					 fd, buf.m.offset);
    
    if (MAP_FAILED == buffers[n_buffers].start) {
      perror("mmap");
      exit(EXIT_FAILURE);
    }
  }
  
  for (i = 0; i < n_buffers; ++i) {
    CLEAR(buf);
    buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    buf.memory = V4L2_MEMORY_MMAP;
    buf.index = i;
    xioctl(fd, VIDIOC_QBUF, &buf);
  }
  type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
  
  xioctl(fd, VIDIOC_STREAMON, &type);

  return (0);
}

int
cam_capt(image) int *image;
{
  unsigned char *ppm;
  do {
    FD_ZERO(&fds);
    FD_SET(fd, &fds);
    
    /* Timeout. */
    tv.tv_sec = 2;
    tv.tv_usec = 0;
    
    r = select(fd + 1, &fds, NULL, NULL, &tv);
  } while ((r == -1 && (errno = EINTR)));
  if (r == -1) {
    perror("select");
    return errno;
  }
  
  CLEAR(buf);
  buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
  buf.memory = V4L2_MEMORY_MMAP;
  xioctl(fd, VIDIOC_DQBUF, &buf);
  
  ppm = buffers[buf.index].start;
  for (i=0; i<BITMAP; i++, ppm+=3)
    image[i] = (*ppm<<24)|(*(ppm+1)<<16)|(*(ppm+2)<<8);
  
  xioctl(fd, VIDIOC_QBUF, &buf);
  return (0);
}

int
cam_close() {
  type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
  xioctl(fd, VIDIOC_STREAMOFF, &type);
  for (i = 0; i < n_buffers; ++i)
    v4l2_munmap(buffers[i].start, buffers[i].length);
  v4l2_close(fd);
  return (0);
}
#endif

/**********************************************************************************/
/* for X11 */
/**********************************************************************************/

Display              *disp;          /* display we're sending to */
int                  scrn;           /* screen we're sending to */

typedef struct {
  unsigned int  width;  /* width of image in pixels */
  unsigned int  height; /* height of image in pixels */
  unsigned char *data;  /* data rounded to full byte for each row */
} Image;

typedef struct {
  Display  *disp;       /* destination display */
  int       scrn;       /* destination screen */
  int       depth;      /* depth of drawable we want/have */
  int       dpixlen;    /* bitsPerPixelAtDepth */
  Drawable  drawable;   /* drawable to send image to */
  Colormap  cmap;       /* colormap used for image */
  GC        gc;         /* cached gc for sending image */
  XImage   *ximage;     /* ximage structure */
} XImageInfo;

union {
  XEvent              event;
  XAnyEvent           any;
  XButtonEvent        button;
  XExposeEvent        expose;
  XMotionEvent        motion;
  XResizeRequestEvent resize;
  XClientMessageEvent message;
} event;

unsigned int          redvalue[256], greenvalue[256], bluevalue[256];
XImageInfo            ximageinfo;
Image                 imageinfo;  /* image that will be sent to the display */
unsigned int          doMemToVal(unsigned char *p, unsigned int len);
unsigned int          doValToMem(unsigned int val, unsigned char *p, unsigned int len);
unsigned int          bitsPerPixelAtDepth();

#define TRUE_RED(PIXVAL)      (((PIXVAL) & 0xff0000) >> 16)
#define TRUE_GREEN(PIXVAL)    (((PIXVAL) &   0xff00) >>  8)
#define TRUE_BLUE(PIXVAL)     (((PIXVAL) &     0xff)      )
#define memToVal(PTR,LEN)     ((LEN) == 1 ? (unsigned int)(*(PTR)) : doMemToVal(PTR,LEN))
#define valToMem(VAL,PTR,LEN) ((LEN) == 1 ? (unsigned int)(*(PTR) = (unsigned char)(VAL)) : doValToMem(VAL,PTR,LEN))

int
x11_open() {
  if (!(disp = XOpenDisplay(NULL))) {
    printf("%s: Cannot open display\n", XDisplayName(NULL));
    onintr_exit(1);
  }
  scrn = DefaultScreen(disp);
  imageinfo.width = WD*4;
  imageinfo.height= HT*3;
  imageinfo.data  = X;
  imageInWindow(&ximageinfo, disp, scrn, &imageinfo);
  return (0);
}

int
x11_update() {
  unsigned int  x, y;
  unsigned int  pixval, newpixval;
  unsigned char *destptr, *srcptr;

  destptr = (Uchar*)(ximageinfo.ximage->data);
  srcptr  = imageinfo.data;
  for (y= 0; y < imageinfo.height; y++) {
    for (x= 0; x < imageinfo.width; x++) {
      pixval= memToVal(srcptr, 3);
      newpixval= redvalue[TRUE_RED(pixval)] | greenvalue[TRUE_GREEN(pixval)] | bluevalue[TRUE_BLUE(pixval)];
      valToMem(newpixval, destptr, ximageinfo.dpixlen);
      srcptr += 3;
      destptr += ximageinfo.dpixlen;
    }
  }
  XPutImage(ximageinfo.disp, ximageinfo.drawable, ximageinfo.gc,
	    ximageinfo.ximage, 0, 0, 0, 0, imageinfo.width, imageinfo.height);
  return (0);
}

int
x11_checkevent() {
  XNextEvent(disp, &event.event);
  switch (event.any.type) {
  case KeyPress:
    return (0);
  default:
    x11_update();
    return (1);
  }
}

int
x11_close() {
  XCloseDisplay(disp);
  return (0);
}

int
imageInWindow(ximageinfo, disp, scrn, image)
     XImageInfo   *ximageinfo;
     Display      *disp;
     int           scrn;
     Image        *image;
{ 
  Window                ViewportWin;
  Visual               *visual;
  unsigned int          depth;
  unsigned int          dpixlen;
  XSetWindowAttributes  swa_view;
  XSizeHints            sh;
  unsigned int pixval;
  unsigned int redcolors, greencolors, bluecolors;
  unsigned int redstep, greenstep, bluestep;
  unsigned int redbottom, greenbottom, bluebottom;
  unsigned int redtop, greentop, bluetop;
  XColor        xcolor;
  unsigned int  a, b, newmap, x, y;
  XGCValues gcv;
  int bestVisual();
  Visual *bestVisualOfClassAndDepth();

  bestVisual(disp, scrn, &visual, &depth);
  dpixlen = (bitsPerPixelAtDepth(disp, depth) + 7) / 8;

  ximageinfo->disp    = disp;
  ximageinfo->scrn    = scrn;
  ximageinfo->depth   = depth;
  ximageinfo->dpixlen = dpixlen;
  ximageinfo->drawable= None;
  ximageinfo->gc      = NULL;
  ximageinfo->ximage  = XCreateImage(disp, visual, depth, ZPixmap, 0,
				     NULL, image->width, image->height,
				     8, 0);
  ximageinfo->ximage->data= (char*)malloc(image->width * image->height * dpixlen);
  ximageinfo->ximage->byte_order= MSBFirst; /* trust me, i know what
					     * i'm talking about */

  if (visual == DefaultVisual(disp, scrn))
    ximageinfo->cmap= DefaultColormap(disp, scrn);
  else
    ximageinfo->cmap= XCreateColormap(disp, RootWindow(disp, scrn), visual, AllocNone);
    
  redcolors= greencolors= bluecolors= 1;
  for (pixval= 1; pixval; pixval <<= 1) {
    if (pixval & visual->red_mask)
      redcolors <<= 1;
    if (pixval & visual->green_mask)
      greencolors <<= 1;
    if (pixval & visual->blue_mask)
      bluecolors <<= 1;
  }
    
  redstep= 256 / redcolors;
  greenstep= 256 / greencolors;
  bluestep= 256 / bluecolors;
  redbottom= greenbottom= bluebottom= 0;
  for (a= 0; a < visual->map_entries; a++) {
    if (redbottom < 256)
      redtop= redbottom + redstep;
    if (greenbottom < 256)
      greentop= greenbottom + greenstep;
    if (bluebottom < 256)
      bluetop= bluebottom + bluestep;
    
    xcolor.flags= DoRed | DoGreen | DoBlue;
    xcolor.red  = (redtop - 1) << 8;
    xcolor.green= (greentop - 1) << 8;
    xcolor.blue = (bluetop - 1) << 8;
    XAllocColor(disp, ximageinfo->cmap, &xcolor);
    
    while ((redbottom < 256) && (redbottom < redtop))
      redvalue[redbottom++]= xcolor.pixel & visual->red_mask;
    while ((greenbottom < 256) && (greenbottom < greentop))
      greenvalue[greenbottom++]= xcolor.pixel & visual->green_mask;
    while ((bluebottom < 256) && (bluebottom < bluetop))
      bluevalue[bluebottom++]= xcolor.pixel & visual->blue_mask;
  }

  swa_view.background_pixel= WhitePixel(disp,scrn);
  swa_view.backing_store= WhenMapped;
  swa_view.cursor= XCreateFontCursor(disp, XC_watch);
  swa_view.event_mask= ButtonPressMask | Button1MotionMask | KeyPressMask |
    StructureNotifyMask | EnterWindowMask | LeaveWindowMask | ExposureMask;
  swa_view.save_under= False;
  swa_view.bit_gravity= NorthWestGravity;
  swa_view.save_under= False;
  swa_view.colormap= ximageinfo->cmap;
  swa_view.border_pixel= 0;
  ViewportWin= XCreateWindow(disp, RootWindow(disp, scrn), 0, 0,
			     image->width, image->height, 0,
			     DefaultDepth(disp, scrn), InputOutput,
			     DefaultVisual(disp, scrn),
			     CWBackingStore | CWBackPixel |
			     CWEventMask | CWSaveUnder,
			     &swa_view);
  ximageinfo->drawable= ViewportWin;

  gcv.function= GXcopy;
  ximageinfo->gc= XCreateGC(ximageinfo->disp, ximageinfo->drawable, GCFunction, &gcv);

  sh.width= image->width;
  sh.height= image->height;
  sh.min_width= image->width;
  sh.min_height= image->height;
  sh.max_width= image->width;
  sh.max_height= image->height;
  sh.width_inc= 1;
  sh.height_inc= 1;
  sh.flags= PMinSize | PMaxSize | PResizeInc | PSize;
  XSetNormalHints(disp, ViewportWin, &sh);

  XStoreName(disp, ViewportWin, "ppmdepth");
  XMapWindow(disp, ViewportWin);
  XSync(disp,False);
  return (0);
}

Visual *
bestVisualOfClassAndDepth(disp, scrn, class, depth)
     Display      *disp;
     int           scrn;
     int           class;
     unsigned int  depth;
{
  Visual *best= NULL;
  XVisualInfo template, *info;
  int nvisuals;

  template.screen= scrn;
  template.class= class;
  template.depth= depth;
  if (! (info= XGetVisualInfo(disp, VisualScreenMask | VisualClassMask |
			      VisualDepthMask, &template, &nvisuals)))
    return(NULL); /* no visuals of this depth */

  best= info->visual;
  XFree((char *)info);
  return(best);
}

int
bestVisual(disp, scrn, rvisual, rdepth)
     Display       *disp;
     int            scrn;
     Visual       **rvisual;
     unsigned int  *rdepth;
{ 
  unsigned int  depth, a;
  Screen       *screen;
  Visual       *visual;

  /* figure out the best depth the server supports.  note that some servers
   * (such as the HP 11.3 server) actually say they support some depths but
   * have no visuals that support that depth.  seems silly to me....
   */

  depth= 0;
  screen= ScreenOfDisplay(disp, scrn);
  for (a= 0; a < screen->ndepths; a++) {
    if (screen->depths[a].nvisuals &&
	((!depth ||
	  ((depth < 24) && (screen->depths[a].depth > depth)) ||
	  ((screen->depths[a].depth >= 24) &&
	   (screen->depths[a].depth < depth)))))
      depth= screen->depths[a].depth;
  }

  visual= bestVisualOfClassAndDepth(disp, scrn, TrueColor, depth);

  *rvisual= visual;
  *rdepth= depth;
  return (0);
}

unsigned int
bitsPerPixelAtDepth(disp, depth)
     Display      *disp;
     unsigned int  depth;
{
  XPixmapFormatValues *xf;
  unsigned int nxf, a;

  xf = XListPixmapFormats(disp, (int *)&nxf);
  for (a = 0; a < nxf; a++)
    if (xf[a].depth == depth)
      return(xf[a].bits_per_pixel);

  fprintf(stderr, "bitsPerPixelAtDepth: Can't find pixmap depth info!\n");
  exit(1);
}     

unsigned int
doMemToVal(p, len)
     unsigned char *p;
     unsigned int  len;
{
  unsigned int a;
  unsigned int i;

  i= 0;
  for (a= 0; a < len; a++)
    i= (i << 8) + *(p++);
  return(i);
}

unsigned int
doValToMem(val, p, len)
     unsigned int  val;
     unsigned char *p;
     unsigned int  len;
{
  int a;

  for (a= len - 1; a >= 0; a--) {
    *(p + a)= val & 0xff;
    val >>= 8;
  }
  return(val);
}

int
copy_X(id, from) 
     int id; /* 0 .. 11 */
     unsigned int *from;
{
  int i, j;
  unsigned char *to = X;

  switch (id) {
  case 0:                           break;
  case 1:  to += WD*3;              break;
  case 2:  to += WD*3*2;            break;
  case 3:  to += WD*3*3;            break;
  case 4:  to += BITMAP*3*4;        break;
  case 5:  to += BITMAP*3*4+WD*3;   break;
  case 6:  to += BITMAP*3*4+WD*3*2; break;
  case 7:  to += BITMAP*3*4+WD*3*3; break;
  case 8:  to += BITMAP*3*8;        break;
  case 9:  to += BITMAP*3*8+WD*3;   break;
  case 10: to += BITMAP*3*8+WD*3*2; break;
  case 11: to += BITMAP*3*8+WD*3*3; break;
  }
  for (i=0; i<HT; i++, to+=WD*3*3) {
    for (j=0; j<WD; j++, from++) {
      *to++ = *from>>24;
      *to++ = *from>>16;
      *to++ = *from>> 8;
    }
  }
  return (0);
}
