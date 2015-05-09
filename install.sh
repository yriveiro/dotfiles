#!/bin/sh

## BASE DEPENDENCIES
# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Cask
brew install caskroom/cask/brew-cask

# Install brew dependencies
cat brew.list | xargs brew install

# Install cask dependencies
cat cask.list | xargs brew cask install

# Install oh-my-zshell
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s /bin/zsh

# Create development, dotfiles and vimfiles dirs
mkdir -p ~/Development/github/
mkdir -p ~/.dsh

# Clone dotfiles and vimfiles projects
git clone https://github.com/eveiga/dotfiles.git ~/Development/github/dotfiles
git clone --recursive https://github.com/yriveiro/vimfiles.git ~/Development/github/vimfiles

# Create symlinks
ln -s ~/Development/github/dotfiles/zshrc ~/.zshrc
ln -s ~/Development/github/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Development/github/dotfiles/dsh.conf ~/.dsh/
ln -s ~/Development/github/vimfiles/vim ~/.vim
ln -s ~/Development/github/vimfiles/vimrc ~/.vimrc

