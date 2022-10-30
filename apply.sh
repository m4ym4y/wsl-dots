#!/bin/bash

echo 'Applying git config'
cp gitconfig ~/.gitconfig

echo 'Applying neovim config'
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

echo 'Applying bashrc'
mkdir -p ~/go/bin
mkdir -p ~/npm/bin
mkdir -p ~/.local/bin
cp bashrc ~/.bashrc
