
SRC_DIR_C = C/Util/Lzma
SRC_DIR_CPP = CPP/7zip/Bundles/LzmaCon

PREFIX		?= /usr
BINDIR		?= $(PREFIX)/bin
INCLUDEDIR	?= $(PREFIX)/include
LIBDIR		?= $(PREFIX)/lib

C_INCS = \
    C/Types.h		\
    C/LzmaEnc.h		\
    C/LzmaEnc.c		\
    C/LzmaDec.h		\
    C/LzmaDec.c		\
    C/LzHash.h		\
    C/LzFind.h		\
    C/LzFind.c		\
    C/7zVersion.h	\
    C/7zCrc.h		\
    C/XzCrc64.h		\
    C/XzEnc.h		\
    C/Lzma2Enc.h	\

all:	util lzmacon install

util:
	$(MAKE) all -C $(SRC_DIR_C) -f makefile.gcc

lzmacon:
	$(MAKE) all -C $(SRC_DIR_CPP) -f makefile.gcc

clean:
	$(MAKE) clean -C $(SRC_DIR_C) -f makefile.gcc
	$(MAKE) clean -C $(SRC_DIR_CPP) -f makefile.gcc
	rm -f $(SRC_DIR_C)/*.o $(SRC_DIR_C)/*.a \
		$(SRC_DIR_CPP)/*.o $(SRC_DIR_CPP)/*.a

install:
	mkdir -p $(DESTDIR)/$(BINDIR) $(DESTDIR)/$(INCLUDEDIR) $(BINDIR)/$(LIBDIR)
	cp CPP/7zip/Bundles/LzmaCon/lzmp $(DESTDIR)/$(BINDIR)
	cp CPP/7zip/Bundles/LzmaCon/lzma_alone $(DESTDIR)/$(BINDIR)

