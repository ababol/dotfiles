#!/bin/bash
FONT_DIRECTORY=$HOME/Library/Fonts
DOTFILES=$HOME/.dotfiles

if [ ! -d "${FONT_DIRECTORY}" ] ; then
  mkdir $FONT_DIRECTORY
fi

# if it's not a symlink -> do the shits
if [ ! -L "${FONT_DIRECTORY}" ] ; then
  # backup fonts
  cp -R $FONT_DIRECTORY/* $DOTFILES/fonts/Fonts
  rm -r $FONT_DIRECTORY
  ln  -s  $DOTFILES/fonts/Fonts ~/Library
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] Fonts linked\n"
else
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] Fonts already linked\n"
fi
