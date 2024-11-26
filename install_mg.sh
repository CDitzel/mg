#!/bin/bash
CURRENT_DIR=$(dirname "$(realpath "$0")")

./autogen.sh
make clean
./configure -q -n --with-startup="$(pwd)"/.mg --disable-togglenl --enable-size-optimizations --without-tutorial --enable-silent-rules --disable-dependency-tracking --without-docs #--without-curses
make -j$(nproc)
#sudo make install

mkdir -p ${HOME}/.local/bin
ln -svf $CURRENT_DIR/src/mg ~/.local/bin/mg
ln -svf $CURRENT_DIR/.bashrc ~/.bashrc
ln -svf $CURRENT_DIR/.Xresources ~/.Xresources

echo "---------------------"
echo "INSTALLATION COMPLETE"
