#!/bin/bash

set -e

if [ -z "$HOME" ]; then
    echo "HOME is not set"
    exit 1
fi

# Check if ln has already been run
if [ -L $HOME/.vimrc ]; then
    ln -s .vimrc $HOME/.vimrc
fi


if [ -L $HOME/.gitignore_global ]; then
    ln -s .gitignore_global $HOME/.gitignore_global
fi
if [ -L $HOME/.tmux.conf ]; then
    ln -s .tmux.conf $HOME/.tmux.conf
fi
if [ -L $HOME/.gitconfig]; then
    ln -s .gitconfig $HOME/.gitconfig
fi

mkdir -p $HOME/.config/nvim
if [ -L $HOME/.config/nvim/init.vim ]; then
    ln -s init.vim $HOME/.config/nvim/init.vim
fi

mkdir -p $HOME/.config/zed
if [ -L $HOME/.config/zed/settings.json ]; then
    ln -s config/zed/settings.json $HOME/.config/zed/settings.json
fi
if [ -L $HOME/.config/zed/keymap.json ]; then
    ln -s config/zed/keymap.json $HOME/.config/zed/keymap.json
fi
