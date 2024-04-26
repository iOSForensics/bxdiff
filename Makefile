CC = clang
SDK = macosx
ARCH := $(shell uname -m)
ifeq ($(ARCH),x86_64)
	ARCH_FLAGS = -arch x86_64
else ifeq ($(ARCH),arm64)
	ARCH_FLAGS = -arch arm64
endif

INCLUDES = -I/opt/homebrew/include
LIBS = -L/opt/homebrew/lib -llzma -lcrypto
CFLAGS = $(ARCH_FLAGS) $(INCLUDES) -Wall
LDFLAGS = $(LIBS)

# Default target
all: bxpatch bxdiff

bxpatch:
	xcrun -sdk $(SDK) $(CC) $(CFLAGS) bxpatch.c -o bxpatch $(LDFLAGS)

bxdiff:
	xcrun -sdk $(SDK) $(CC) $(CFLAGS) bxdiff.c lzmaio.c -o bxdiff $(LDFLAGS)

clean:
	rm -f bxpatch bxdiff

