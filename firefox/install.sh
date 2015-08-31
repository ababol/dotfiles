#!/bin/bash
brew cask install caskroom/versions/firefoxdeveloperedition --appdir="/Applications"
open /Applications/FirefoxDeveloperEdition.app

# Css Customisation
DOTFILES=$HOME/.dotfiles
FIREFOX_INSTALL="$HOME/Library/Application Support/Firefox"

FIREFOX_PROFILE=$(grep Path "$FIREFOX_INSTALL/profiles.ini" | tail -1 | sed s/Path=//)
FIREFOX_PROFILE_FULL_PATH="$FIREFOX_INSTALL/$FIREFOX_PROFILE"

printf "  [ \033[00;34m..\033[0m ] $FIREFOX_PROFILE detected\n"

# if it's not a symlink -> do the shits
if [[  -d "$FIREFOX_PROFILE_FULL_PATH" && ! -L "${FIREFOX_PROFILE_FULL_PATH}/chrome" ]] ; then
  ln  -s  $DOTFILES/firefox/chrome "$FIREFOX_PROFILE_FULL_PATH"
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $FIREFOX_PROFILE css applied\n"
else
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $FIREFOX_PROFILE css already applied\n"
fi
