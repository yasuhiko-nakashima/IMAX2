
static char RcsHeader[] = "$Header: /usr/home/nakashim/proj-emax/sample/filter/xdisp.c,v 1.1 2012/09/27 00:04:03 nakashim Exp nakashim $";

/* Stereo image processor              */
/*   Copyright (C) 2002 by KYOTO UNIV. */
/*         Primary writer: Y.Nakashima */
/*         nakashim@econ.kyoto-u.ac.jp */

/* xdisp.c 2002/4/22 */ 

#include <stdio.h>
#include <sys/fcntl.h>
#include <sys/mman.h>
#ifndef LINUX
#include <machine/ioctl_meteor.h>
#endif
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/cursorfont.h>
#include "gp6x760.h"

int            	     bktr0, bktr1;
#ifndef LINUX
struct meteor_geomet geo;
#endif
int                  param;
unsigned char        *buf0, *buf1;
Display              *disp;          /* display we're sending to */
int                  scrn;           /* screen we're sending to */

/************/
/* for File */
/************/

#define PPMHEADER   15

char magic[PPMHEADER] = {
  0x50, 0x36, 0x0A,        /* P6  */
  0x33, 0x32, 0x30, 0x20,  /* 320 */
  0x32, 0x34, 0x30, 0x0A,  /* 240 */
  0x32, 0x35, 0x35, 0x0A,  /* 255 */
};

ppm_capt(fr0, fr1)
     unsigned char *fr0, *fr1;
{
  read_ppm(fr0, L);
  read_ppm(fr1, R);
}

read_ppm(file, ppm)
     unsigned char *file;
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
}

write_ppm(file, ppm)
     unsigned char *file;
     unsigned int  *ppm;
{
  FILE  *fp;
  unsigned char buf[BITMAP*3];
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
}

/***********/
/* for CAM */
/***********/

#ifndef LINUX
cam_open() {
  if ((bktr0 = open("/dev/bktr0", O_RDONLY)) < 0) {
    fprintf(stderr, "front: open failed /dev/bktr0\n") ;
    bktr0 = 0;
  }
  if ((bktr1 = open("/dev/bktr1", O_RDONLY)) < 0) {
    fprintf(stderr, "front: open failed /dev/bktr1\n") ;
    fprintf(stderr, "front: trying to work with single /dev/bktr0\n") ;
    bktr1 = 0;
  }
  if (bktr0)
    buf0 = (unsigned char*)mmap((caddr_t)0, BITMAP*4, PROT_READ, MAP_SHARED, bktr0, (off_t)0);
  if (bktr1)
    buf1 = (unsigned char*)mmap((caddr_t)0, BITMAP*4, PROT_READ, MAP_SHARED, bktr1, (off_t)0);
  
  geo.columns = WD;
  geo.rows    = HT;
  geo.frames  = 1;
  geo.oformat = METEOR_GEO_RGB24 | (((WD<=320)&&(HT<=240))?METEOR_GEO_EVEN_ONLY:0);
  if (bktr0)
    ioctl(bktr0, METEORSETGEO, &geo);
  if (bktr1)
    ioctl(bktr1, METEORSETGEO, &geo);
  
  param = METEOR_FMT_NTSC;
  if (bktr0)
    ioctl(bktr0, METEORSFMT, &param);
  if (bktr1)
    ioctl(bktr1, METEORSFMT, &param);
  
  param = METEOR_INPUT_DEV0;
  if (bktr0)
    ioctl(bktr0, METEORSINPUT, &param);
  if (bktr1)
    ioctl(bktr1, METEORSINPUT, &param);
}

cam_capt() {
  int i;

  if (bktr0)
    read_cap(bktr0, METEOR_INPUT_DEV0);
  if (!bktr1) {
    if (bktr0) {
      copy_cap(buf0, L);
      for (i=0; i<BITMAP; i++)
        W[i] = L[i];
      read_cap(bktr0, METEOR_INPUT_DEV_SVIDEO);
      copy_cap(buf0, R);
      for (i=0; i<BITMAP; i++)
        D[i] = R[i];
    }
  }
  else {
    read_cap(bktr1, METEOR_INPUT_DEV0);
    copy_cap(buf0, L);
    for (i=0; i<BITMAP; i++)
      W[i] = L[i];
    copy_cap(buf1, R);
    for (i=0; i<BITMAP; i++)
      D[i] = R[i];
  }
}

read_cap(bktr, dev)
     int bktr, dev;
{
  int param = METEOR_CAP_SINGLE;
  static int prev_dev;

  if (prev_dev != dev) {
    ioctl(bktr, METEORSINPUT, &dev);
    prev_dev = dev;
  }
  ioctl(bktr, METEORCAPTUR, &param);
}

copy_cap(buf, ppm)
     unsigned char *buf;
     unsigned int  *ppm;
{
  int i;

  for (i=0; i<BITMAP; i++, ppm++, buf+=4)
    *ppm = (*buf<<8)|(*(buf+1)<<16)|(*(buf+2)<<24);
}

cam_close() {
  close(bktr0);
  if (bktr1)
    close(bktr1);
}
#endif

/***********/
/* for X11 */
/***********/

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
unsigned long         doMemToVal(unsigned char *p, unsigned int len);
unsigned long         doValToMem(unsigned long val, unsigned char *p, unsigned int len);
unsigned int          bitsPerPixelAtDepth();

#define TRUE_RED(PIXVAL)      (((PIXVAL) & 0xff0000) >> 16)
#define TRUE_GREEN(PIXVAL)    (((PIXVAL) &   0xff00) >>  8)
#define TRUE_BLUE(PIXVAL)     (((PIXVAL) &     0xff)      )
#define memToVal(PTR,LEN)     ((LEN) == 1 ? (unsigned long)(*(PTR)) : doMemToVal(PTR,LEN))
#define valToMem(VAL,PTR,LEN) ((LEN) == 1 ? (unsigned long)(*(PTR) = (unsigned char)(VAL)) : doValToMem(VAL,PTR,LEN))

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
}

x11_update() {
  unsigned int  x, y;
  unsigned int  pixval, newpixval;
  unsigned char *destptr, *srcptr;

  destptr = ximageinfo.ximage->data;
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
}

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

x11_close() {
  XCloseDisplay(disp);
}

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
  ximageinfo->ximage->data= (unsigned char*)malloc(image->width * image->height * dpixlen);
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
}

Visual *bestVisualOfClassAndDepth(disp, scrn, class, depth)
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
}

unsigned int bitsPerPixelAtDepth(disp, depth)
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

unsigned long doMemToVal(p, len)
     unsigned char *p;
     unsigned int  len;
{
  unsigned int  a;
  unsigned long i;

  i= 0;
  for (a= 0; a < len; a++)
    i= (i << 8) + *(p++);
  return(i);
}

unsigned long doValToMem(val, p, len)
     unsigned long  val;
     unsigned char  *p;
     unsigned int   len;
{
  int a;

  for (a= len - 1; a >= 0; a--) {
    *(p + a)= val & 0xff;
    val >>= 8;
  }
  return(val);
}

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
}
