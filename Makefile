
SRCDIR=src/libev-4.15

LIBS=$(SRCDIR)/libev-ios.a \
    $(SRCDIR)/libev-osx.a

INCLUDES=$(SRCDIR)/ev++.h  \
    $(SRCDIR)/ev.h  \
    $(SRCDIR)/ev_vars.h  \
    $(SRCDIR)/ev_wrap.h  \
    $(SRCDIR)/event.h 


.PHONY: all clean libev

all: libev

libev:
	pushd $(SRCDIR) && ../../compile.py && popd
	-mkdir lib
	cp $(LIBS) lib
	-mkdir include
	-cp $(INCLUDES) include

clean:
	-make -C $(SRCDIR) distclean
	-rm -f $(LIBS)
	
export
test:
	env
	