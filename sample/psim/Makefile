
## NNET platform                       ##
##         Copyright (C) 2015 by NAIST ##
##         Primary writer: Y.Nakashima ##
##                nakashim@is.naist.jp ##

OPTION	      = -DGP600M -DNOV4L2
PROGRAM       = psim
CC            = gcc
CFLAGS        = -I. -I/usr/local/include -O2 $(OPTION)
ASFLAGS       = 
LDFLAGS       = 
LIBFLAGS      = -L/usr/local/lib -lm -lX11
DESTDIR	      = $(HOME)/bin

OBJS	      =	psim.o \
		gp600m.o

SRCS	      =	psim.c \
		gp600m.c

all:		$(PROGRAM)

$(PROGRAM):     $(OBJS)
		$(CC) $(LDFLAGS) $(OBJS) -o $(PROGRAM) $(LIBFLAGS)

gp600m.o:	gp600m.c
		$(CC) -I. $(OPTION) -c $<

run:;		./$(PROGRAM) -f black.ppm

clean:;		rm -f $(OBJS) core *~

###

psim.o:		gp600m.h
gp600m.o:	gp600m.h

###
