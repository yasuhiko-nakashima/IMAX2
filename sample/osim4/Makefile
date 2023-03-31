
## NNET platform                       ##
##         Copyright (C) 2015 by NAIST ##
##         Primary writer: Y.Nakashima ##
##                nakashim@is.naist.jp ##

OPTION	      = -fcommon -DGP6X760 -DNOV4L2
PROGRAM       = osim4
CC            = gcc
CFLAGS        = -I. -O1 -m32 -I/usr/local/include $(OPTION)
ASFLAGS       = --32
LDFLAGS       = -m32
LIBFLAGS      = -L/usr/local/lib -lm -lX11
DESTDIR	      = $(HOME)/bin

OBJS	      =	osim4.o gp6x760.o

SRCS	      =	osim4.c gp6x760.c

all:		$(PROGRAM)

$(PROGRAM):     $(OBJS)
		$(CC) $(LDFLAGS) $(OBJS) -o $(PROGRAM) $(LIBFLAGS)

run:;		./$(PROGRAM) -f black.ppm

clean:;		rm -f $(OBJS) core *~

###

osim4.o:	gp6x760.h
gp6x760.o:	gp6x760.h

###
