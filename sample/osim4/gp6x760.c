/*
 * Copyright (c) 2003-2010 Y.Nakashima
 *
 * GP6X760 PCI user driver for FreeBSD-7.2R.
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
#include <sys/mman.h>
#include <termios.h>
#include "gp6x760.h"

#define GP6X760_DEV0 "/dev/usb_gp6v7600"
#define GP6X760_DEV1 "/dev/usb_gp6v7601"

static int fd0, fd1;
static int usb0id, usb1id;

/* pwritev(int d, const struct iovec *iov, int iovcnt, off_t offset); */

int gp6x760_open()
{
  Uint pid, sub;
  char *hard_pcimap0;
  char *hard_pcimap1;

  if ((fd0=open(GP6X760_DEV0,O_RDWR)) == -1) {
    printf("gp6x760.c: ERROR can not open %s\n", GP6X760_DEV0);
    return (-1);
  }

  /* reset USB0 */
  usb_space_reg[USB_SPACE_RESET_STATUS].reset_status.grst = 1;
  usb_space_reg_write(0, &usb_space_reg[USB_SPACE_RESET_STATUS], USB_SPACE_RESET_STATUS);
  do {
    usb_space_reg_read(0, &usb_space_reg[USB_SPACE_RESET_STATUS], USB_SPACE_RESET_STATUS);
  } while (usb_space_reg[USB_SPACE_RESET_STATUS].reset_status.grst);

  if ((fd1=open(GP6X760_DEV1,O_RDWR)) == -1) {
    printf("gp6x760.c: ERROR can not open %s\n", GP6X760_DEV1);
    return (1);
  }

  /* reset USB1 */
  usb_space_reg[USB_SPACE_RESET_STATUS].reset_status.grst = 1;
  usb_space_reg_write(1, &usb_space_reg[USB_SPACE_RESET_STATUS], USB_SPACE_RESET_STATUS);
  do {
    usb_space_reg_read(1, &usb_space_reg[USB_SPACE_RESET_STATUS], USB_SPACE_RESET_STATUS);
  } while (usb_space_reg[USB_SPACE_RESET_STATUS].reset_status.grst);

  /* reassign usb0->fd0, usb1->fd1 */
  usb_space_reg_read(0, &usb_space_reg[USB_SPACE_USB_CHID], USB_SPACE_USB_CHID);
  usb0id = usb_space_reg[USB_SPACE_USB_CHID].usb_chid.id;
  usb_space_reg_read(1, &usb_space_reg[USB_SPACE_USB_CHID], USB_SPACE_USB_CHID);
  usb1id = usb_space_reg[USB_SPACE_USB_CHID].usb_chid.id;
  if (usb0id == 1 && usb1id == 0) {
    usb0id = fd0;
    usb1id = fd1;
    fd0  = usb1id;
    fd1  = usb0id;
  }
  if ((usb0id == 0 && usb1id == 0) || (usb0id == 1 && usb1id == 1)) {
    printf("gp6x760.c: ERROR can not identify usb0/1\n");
    return (-1);
  }

  return (2);
}

int gp6x760_close()
{
  close(fd0);
  close(fd1);
  return (0);
}

usb_space_reg_write(usb, p, regno) Uint usb; union usb_space_reg *p; Uint regno;
{
  struct iovec iov;
  iov.iov_base = p;
  iov.iov_len = sizeof(Uint);
    
  switch (usb) {
  case 0:
    pwritev(fd0, &iov, 1, sizeof(Uint)*regno);
    break;
  case 1:
    pwritev(fd1, &iov, 1, sizeof(Uint)*regno);
    break;
  }
}

usb_space_reg_read(usb, p, regno) Uint usb; union usb_space_reg *p; Uint regno;
{
  struct iovec iov;
  iov.iov_base = p;
  iov.iov_len = sizeof(Uint);
    
  switch (usb) {
  case 0:
    preadv(fd0, &iov, 1, sizeof(Uint)*regno);
    break;
  case 1:
    preadv(fd1, &iov, 1, sizeof(Uint)*regno);
    break;
  }
}

usb_space_mem_write(usb, p, len, a) Uint usb; Uchar *p; Uint len, a;
{
  struct iovec iov;
  iov.iov_base = p;
  iov.iov_len = len;
    
  switch (usb) {
  case 0:
    pwritev(fd0, &iov, 1, a);
    break;
  case 1:
    pwritev(fd1, &iov, 1, a);
    break;
  }
}

usb_space_mem_read(usb, p, len, a) Uint usb; Uchar *p; Uint len, a;
{
  struct iovec iov;
  iov.iov_base = p;
  iov.iov_len = len;

  switch (usb) {
  case 0:
    preadv(fd0, &iov, 1, a);
    break;
  case 1:
    preadv(fd1, &iov, 1, a);
    break;
  }
}

usb_space_mem_writev(usb, iov, iovcnt, a) Uint usb; struct iovec *iov; Uint iovcnt, a;
{
  switch (usb) {
  case 0:
    pwritev(fd0, iov, iovcnt, a);
    break;
  case 1:
    pwritev(fd1, iov, iovcnt, a);
    break;
  }
}

usb_space_mem_readv(usb, iov, iovcnt, a) Uint usb; struct iovec *iov; Uint iovcnt, a;
{
  switch (usb) {
  case 0:
    preadv(fd0, iov, iovcnt, a);
    break;
  case 1:
    preadv(fd1, iov, iovcnt, a);
    break;
  }
}
