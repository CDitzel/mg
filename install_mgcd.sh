#!/bin/bash

# delleadwhite and trailwhtie bind to keys

CURRENT_DIR=$(dirname "$(realpath "$0")")
REMOTE_URL="git-av.nvidia.com"

# packages
#sudo apt update -y && sudo apt upgrade -y
#install_packages=(autoconf tmux git libncurses-dev clang-format)
#sudo apt install "${install_packages[@]}" -y
#sudo apt autoremove -y

# editor
#sudo make uninstall
./autogen.sh
#clang-format -i -style=LLVM src/*.c src/*.h
make clean
./configure --with-startup="$(pwd)"/.mg --disable-compile --disable-ctags --disable-togglenl --enable-size-optimizations --without-tutorial --without-docs --enable-silent-rules --disable-dependency-tracking #--without-curses
make -j$(nproc)
#sudo make install

# git-av 
grep -i $REMOTE_URL .netrc || echo -e "machine $REMOTE_URL \n\t login carsten.ditzel@mercedes-benz.com \n\t password " > ~/.netrc
echo "git clone "https://carsten.ditzel%40mercedes-benz.com@git-av.nvidia.com/r/a/ndas" && (cd "ndas" && mkdir -p .git/hooks && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://carsten.ditzel%40mercedes-benz.com@git-av.nvidia.com/r/tools/hooks/commit-msg; chmod +x `git rev-parse --git-dir`/hooks/commit-msg)"

ln -svf $CURRENT_DIR/.bashrc ~/.bashrc
ln -svf $CURRENT_DIR/.Xresources ~/.Xresources
ln -svf $CURRENT_DIR/.gitconfig ~/.gitconfig
ln -svf $CURRENT_DIR/restore_mg.sh ~/.restore_mg.sh
ln -svf $CURRENT_DIR/.dazelrc ~/.dazelrc
ln -svf $CURRENT_DIR/user.bazelrc ~/git-ndas/ndas/user.bazelrc
ln -svf $CURRENT_DIR/.netrc ~/.netrc


mkdir -p ${HOME}/.local/bin
ln -svf $CURRENT_DIR/src/mg ~/.local/bin/mg
source ~/.bashrc



# terminal
cp -v /etc/inputrc ~/.inputrc
echo -e '"\C-p": history-search-backward \n"\C-n": history-search-forward \nset show-all-if-ambiguous on \nset completion-ignore-case on' >> ~/.inputrc

echo "INSTALLATION COMPLETE"
