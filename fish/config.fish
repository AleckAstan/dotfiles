# GENERAL
fish_vi_key_bindings
set -gx EDITOR nvim
set -gx NODE_OPTIONS "--max-old-space-size=8192"
set -gx PATH $PATH "$HOME/.local/bin"
set -gx PATH /opt/homebrew/bin $PATH

# STARSHIP PROMPT
starship init fish | source
# config from https://github.com/smithumble/starship-cockpit
export STARSHIP_COCKPIT_MEMORY_USAGE_ENABLED=true

# ZOXIDE
zoxide init fish | source

# PNPM
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- "$PNPM_HOME" $PATH
    set -gx PATH $PNPM_HOME $PATH
end

# ANDROID SDK
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
set -gx PATH $PATH $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools

# RUBY
set -gx PATH /usr/local/opt/ruby/bin /usr/local/lib/ruby/gems/3.1.0/bin $PATH
set -gx PATH /opt/homebrew/opt/ruby/bin $PATH

# NVM
set --global nvm_data ~/.nvm
set --universal nvm_default_version v22.13.0

# Tmuxifier
# set -gx PATH $HOME/.tmuxifier/bin $PATH
# tmuxifier init - | source


# ALIASES
alias ta='tmux attach'
alias td='tmux detach'
alias v='nvim'
alias lg='lazygit'
alias g="git"
alias gcp='git cherry-pick'
alias ca='clear; printf "\e[3J"'
alias c='clear'
alias gfa='git fetch --all'
alias y='yabai --restart-service'

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
