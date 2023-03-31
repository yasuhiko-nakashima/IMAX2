
## NNET platform                       ##
##         Copyright (C) 2015 by NAIST ##
##         Primary writer: Y.Nakashima ##
##                nakashim@is.naist.jp ##

OPTION	      = 
PROGRAM       = nsim
CC            = gcc
CFLAGS        = -I. -I/usr/local/include -O2 $(OPTION)
ASFLAGS       = 
LDFLAGS       = 
LIBFLAGS      = -L/usr/local/lib -lm -lX11 -lv4l2
DESTDIR	      = $(HOME)/bin

OBJS	      =	nsim.o

SRCS	      =	nsim.c

all:		$(PROGRAM)

$(PROGRAM):     $(OBJS)
		$(CC) $(LDFLAGS) $(OBJS) -o $(PROGRAM) $(LIBFLAGS)

run:;		./$(PROGRAM) -c

clean:;		rm -f $(OBJS) core *~

###

nsim.o:		gp600m.h

###
