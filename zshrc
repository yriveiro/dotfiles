# Path to your oh-my-zsh installation.
export ZSH=/Users/yriveiro/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="gozilla"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git atom brew-cask brew go osx vagrant cp npm nvm)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export EDITOR='vim'

# source every .zsh in dotfiles rep
DOT_FILES=$HOME/Development/github/dotfiles
for config_file ($DOT_FILES/**/*.zsh) source $config_file

# Options
setopt autoparamslash # tab completing directory appends a slash

# Set node env
source $(brew --prefix nvm)/nvm.sh
nvm use default > /dev/null
