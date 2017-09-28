# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/sachin/.oh-my-zsh

ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

plugins=(git brew bundler chruby fancy-ctrl-z github gem history-substring-search last-working-dir node)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# MY SETTINGS
#
# Prefer homebrew vim over OSX default
alias vim="/usr/local/bin/vim"

# chruby for switching ruby versions
source '/usr/local/share/chruby/chruby.sh'
source '/usr/local/share/chruby/auto.sh'

# chnode for switching node versions
. "/usr/local/bin/chnode"

# .env + nodemon
alias nodemon='env $(cat .env | xargs) nodemon'
alias loadenv='env $(cat .env | xargs)'
