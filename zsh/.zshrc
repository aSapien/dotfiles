#!/bin/zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Github hub
eval "$(hub alias -s)"

# Activate `zsh-completions`
fpath=(/usr/local/share/zsh-completions $fpath)

# Initialize autojump (https://github.com/wting/autojump)
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Initialize ZShell syntax highlighting (https://github.com/Homebrew/homebrew-core/blob/master/Formula/zsh-syntax-highlighting.rb)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zsh completions for Google Cloud SDK (installed with brew cask)
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Prezto: Load
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Prezto: Disable Correction suggestions
unsetopt CORRECT

# NVM config and start
    export NVM_DIR="$HOME/.nvm"
    # This loads nvm
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  
    # This loads nvm bash_completion
    [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  


# Load NIX environment
[ -s "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && . "$HOME/.nix-profile/etc/profile.d/nix.sh"

# Load BazelBuild environment
[ -s "$HOME/.bazelenv" ] && . "$HOME/.bazelenv"
