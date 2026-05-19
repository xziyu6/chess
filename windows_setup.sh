#!/bin/bash
# Stop the script if any command fails
set -e 

echo "Setting up external dependencies..."
if [ ! -d "PDCurses" ]; then
    git clone --depth 1 https://github.com/wmcbrine/PDCurses.git PDCurses
fi

echo "Pre-compiling Windows binaries..."
cd PDCurses/wincon
make CC=x86_64-w64-mingw32-gcc LINK=x86_64-w64-mingw32-gcc WIDE=Y UTF8=Y
