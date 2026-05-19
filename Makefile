CC = gcc
CFLAGS = -Wall -Werror -Wextra -O3 -Iinclude -D_XOPEN_SOURCE_EXTENDED=1
TARGET_LINUX = build/chess

WIN_CC = x86_64-w64-mingw32-gcc
TARGET_WINDOWS = build/chess.exe

PDC_DIR = ./PDCurses
PDC_WINCON = $(PDC_DIR)/wincon

LIBS_LINUX = -lncursesw
LIBS_WINDOWS = -L$(PDC_WINCON) -l:pdcurses.a

SRCS = src/main.c src/game.c

linux: | build_dir
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET_LINUX) $(LIBS_LINUX)

windows: | build_dir
	$(WIN_CC) $(CFLAGS) -I$(PDC_DIR) $(SRCS) -o $(TARGET_WINDOWS) $(LIBS_WINDOWS)

build_dir:
	@mkdir -p build

setup:
	bash windows_setup.sh

clean:
	rm -f $(TARGET_LINUX) $(TARGET_WINDOWS)

purge: clean
	rm -rf PDCurses
