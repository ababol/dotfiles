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
brew tap caskroom/cask
brew cask install alfred --appdir="/Applications"
brew cask install sublime-text3 --appdir="/Applications"
brew cask install google-chrome --appdir="/Applications"
brew cask install xtrafinder --appdir="/Applications"
brew cask install iterm2-beta --appdir="/Applications"
brew cask install spotify --appdir="/Applications"
brew cask install cumulus --appdir="/Applications"
brew cask install bitbar --appdir="/Applications"
brew cask install skype --appdir="/Applications"
brew cask install dropbox --appdir="/Applications"
brew cask install franz --appdir="/Applications"
brew cask install sequel-pro --appdir="/Applications"
brew cask alfred link
brew install thefuck
brew install z

exit 0
