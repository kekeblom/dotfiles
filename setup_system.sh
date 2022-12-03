#!/bin/bash

set -e

ln -s .vimrc $HOME/.vimrc
ln -s .gitignore_global $HOME/.gitignore_global
ln -s .tmux.conf $HOME/.tmux.conf
ln -s .gitconfig $HOME/.gitconfig

mkdir -p $HOME/.config/nvim
ln -s init.vim $HOME/.config/nvim/init.vim


