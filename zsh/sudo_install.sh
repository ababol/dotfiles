if [[  ! -L "/bin/zsh" && ! -f "/bin/zsh" ]] ; then
  ln -s /usr/local/bin/zsh /bin/zsh
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] zsh linked\n"
fi
