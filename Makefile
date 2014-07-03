
SRCDIR=src/libev-4.15

LIB_FILES=$(SRCDIR)/libev-ios.a \
    $(SRCDIR)/libev-osx.a

INCLUDE_FILES=$(SRCDIR)/ev++.h  \
    $(SRCDIR)/ev.h  \
    $(SRCDIR)/ev_vars.h  \
    $(SRCDIR)/ev_wrap.h  \
    $(SRCDIR)/event.h 


.PHONY: all clean libev distclean

all: libev

libev:
	cd $(SRCDIR) && $(CURDIR)/compile.py && cd $(CURDIR)
	-mkdir lib
	cp $(LIB_FILES) lib
	-mkdir include
	-cp $(INCLUDE_FILES) include

clean:
	-$(MAKE) -C $(SRCDIR) distclean
	-rm -f $(LIB_FILES)

distclean: clean
	-rm -rf lib
	-rm -rf include
	
export
test:
	env
	