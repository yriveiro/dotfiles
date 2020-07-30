#!/bin/bash

set -euo pipefail

DEBUG=${DEBUG:-0}

. ./lib/log.sh

if [ "${DEBUG}" = "1" ];then
    set -x
fi


case "$(uname -s)" in
    Darwin)
        info 'Install Homebrew'
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

        cat brew.list | xargs brew install
        cat cask.list | xargs brew cask install
        ;;
esac


info "Create development, dotfiles and vimfiles dirs"
mkdir -p ~/Development/github/

info "Clone dotfiles and vimfiles projects"
git clone --recursive https://github.com/yriveiro/dotfiles.git ~/Development/github/dotfiles
git clone --recursive https://github.com/yriveiro/vimfiles.git ~/Development/github/vimfiles

info "Create symlinks"
ln -sf ~/Development/github/dotfiles/zshrc ~/.zshrc
ln -sf ~/Development/github/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/Development/github/vimfiles/vim ~/.vim
ln -sf ~/Development/github/vimfiles/vimrc ~/.vimrc
ln -sf ~/Development/github/vimfiles/zsh_plugins.txt ~/.zsh_plugins.txt

info "Install antibody zsh plugin manager"
chsh -s /bin/zsh
sudo curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
