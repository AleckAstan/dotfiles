# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#neofetch
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/antsajudicael/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.1.0/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
# source /opt/homebrew/opt/spaceship/spaceship.zsh
# SPACESHIP_TIME_SHOW=true
# SPACESHIP_USER_SHOW=true
# SPACESHIP_NODE_SHOW=true
# SPACESHIP_GIT_SHOW=always
# SPACESHIP_BATTERY_SHOW=always

# pnpm
export PNPM_HOME="/Users/antsajudicael/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init - )"
#starship
eval "$(starship init zsh)"
#Zoxide 
eval "$(zoxide init zsh)"
alias gm='git merge origin/'
alias ta='tmux attach'
alias td='tmux detach'
alias v='nvim'
alias lg='lazygit'
alias gcp='git cherry-pick'
alias clearall='clear && printf "\e[3J"'
# tmuxifier end
export EDITOR=nvim
export NODE_OPTIONS="--max-old-space-size=8192"
# . "$HOME/.cargo/env" 
# Created by `pipx` on 2025-03-28 19:23:55
export PATH="$PATH:/Users/antsajudicae/.local/bin"
