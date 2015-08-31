brew cask install atom --appdir="/Applications"

# Install atom packages
apm stars --user ababol --install

# Background Color
sed -i -- 's/#263238/#192125/g' $HOME/.atom/packages/material-monokai-syntax/styles/syntax-variables.less
# Comments color
# sed -i -- 's/#506E79/#506E79/g' $HOME/.atom/packages/material-monokai-syntax/styles/syntax-variales.less
