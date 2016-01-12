git submodule init
git submodule update

# bitbar-plugins
ln -s $DOTFILES/bitbar/spotify.10s.sh $DOTFILES/_bitbar-plugins/Enabled
chmod +x $DOTFILES/bitbar/spotify.10s.sh
ln -s $DOTFILES/bitbar/hacker_news.rb $DOTFILES/_bitbar-plugins/Enabled
chmod +x $DOTFILES/bitbar/hacker_news.rb
# ln -s $DOTFILES/_bitbar-plugins/Dev/Docker/docker-status.1m.sh $DOTFILES/_bitbar-plugins/Enabled
# chmod +x $DOTFILES/_bitbar-plugins/Dev/Docker/docker-status.1m.sh
