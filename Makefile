#  Makefile                                                      -*-makefile-*-
#  ----------------------------------------------------------------------------
#   Copyright (C) 2023 Dietmar Kuehl http://www.dietmar-kuehl.de
#  ----------------------------------------------------------------------------

LIBEVENT_VERSION = 2.1.12
RM       = rm -f

.PHONY: default build distclean clean

default: build

stdexec:
	echo getting stdexec
	git clone https://github.com/NVIDIA/stdexec

libevent-$(LIBEVENT_VERSION)-stable.tar.gz:
	wget https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)-stable/libevent-$(LIBEVENT_VERSION)-stable.tar.gz

libevent: libevent-$(LIBEVENT_VERSION)-stable.tar.gz
	tar xf libevent-$(LIBEVENT_VERSION)-stable.tar.gz
	mv libevent-$(LIBEVENT_VERSION)-stable libevent

build:  stdexec libevent
	@mkdir -p build
	cd build; cmake ..
	cmake --build build

clean:
	$(RM) mkerr olderr *~

distclean: clean
	$(RM) -r build
	$(RM) -r stdexec libevent libevent-$(LIBEVENT_VERSION)-stable.tar.gz
