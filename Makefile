#       $OpenBSD: Makefile,v 1.6 2001/09/02 18:45:41 jakob Exp $

PROG=	nc
SRCS=	netcat.c atomicio.c socks.c

LIBS=  -lresolv
OBJS=  $(SRCS:.c=.o)
CFLAGS=  -g -O2
LDFLAGS=  -Wl,--no-add-needed
CC=arm-linux-gcc
all: nc
nc: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o nc

$(OBJS): %.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) nc
