# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Initialize Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize Zoxide (https://github.com/ajeetdsouza/zoxide)
eval "$(zoxide init zsh)"

# Initialize FNM
eval "$(fnm env)"

# Bazel environment
source "$HOME/.bazelenv"


# ZSH aliases and functions
source "$HOME/.zshrc-aliases"
source "$HOME/.zshrc-functions"

export PATH="$PATH:$HOME/.local/bin"

# # Ruby / RVM
# eval "$(rbenv init - zsh)"
# export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin

# # Python / Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

# Go
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# JAVA
# have openjdk@11 first in your PATH
export JAVA_HOME="/opt/homebrew/opt/openjdk@11"
export PATH="$JAVA_HOME/bin:$PATH"
#For compilers to find openjdk@11 you may need to set:
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"


# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions kubectl)
source $ZSH/oh-my-zsh.sh

# Fix slowness of pastes with zsh-syntax-highlighting.zsh
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
