#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting kubectl)

source $ZSH/oh-my-zsh.sh

# Initialize autojump (https://github.com/wting/autojump)
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Initialize FNM
eval "$(fnm env)"

##### BAZEL #####
source /Users/$USER/.bazelenv

# RVM 
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
# Uncomment if working with chef-repo a lot
# rvm default

source "$HOME/.zshrc-aliases"
source "$HOME/.zshrc-functions"

export PATH="$PATH:$HOME/.local/bin"
source "$HOME/.bazelenv"

# Fix slowness of pastes with zsh-syntax-highlighting.zsh
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Ruby / RVM
source $HOME/.rvm/scripts/rvm
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin

# Python / Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
