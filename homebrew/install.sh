#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  fi

fi

# Install homebrew packages
brew install grc coreutils spark
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask install alfred --appdir="/Applications"
brew cask install sublime-text3 --appdir="/Applications"
brew cask install google-chrome --appdir="/Applications"
brew cask install xtrafinder --appdir="/Applications"
brew cask install iterm2 --appdir="/Applications"
brew cask install spotify --appdir="/Applications"
brew cask install cumulus --appdir="/Applications"
brew cask alfred link
brew install thefuck
brew install z

exit 0
