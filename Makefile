CC=gcc
MY_APXS=/usr/sbin/apxs

MY_LDFLAGS=-lcurl -lyajl

# Note that gcc flags are passed through apxs, so preface with -Wc
MY_CFLAGS=-Wc,-I. -Wc,-Wall

.SUFFIXES: .c .o .la
.c.la:
	$(MY_APXS) $(MY_LDFLAGS) $(MY_CFLAGS) -c $< 
.c.o:
	$(CC) -c $<

all:  mod_auth_browserid.la 

install: mod_auth_browserid.la 
	@echo "-"$*"-" "-"$?"-" "-"$%"-" "-"$@"-" "-"$<"-"
	$(MY_APXS) -i $?

clean:
	-rm -f *.o *.lo *.la *.slo 
	-rm -rf .libs

