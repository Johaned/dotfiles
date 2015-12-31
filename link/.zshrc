# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler colorized brew zeus gem rails ruby npm node nano nanoc history-substring-search zsh-syntax-highlighting)

# User configuration
# take inti account that PATH is set on the fly while the whole loading process (inside
# the dot files) is completed
export DOTFILES=~/.dotfiles
# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# Add binaries into the path
export PATH="$DOTFILES/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/oh-my-zsh.sh

# Source all files in "source"
function src() {
  local file
  if [[ "$1" ]]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

# Sources all "run commands" defined in $DOTFILES/source
# - dotfiles logic
# - editor
# - file improvements
# - history improvements
# - locale settings
# - ubuntu misc
# - node
# - ruby
# - net
# - git shorcuts
src

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# https://github.com/boxen/phantomenv
# export PATH="$HOME/.phantomenv/bin:$PATH"
# eval "$(phantomenv init -)"

# Rails Spring, disable it
echo "Disabling Spring... DISABLE_SPRING=true"
export DISABLE_SPRING=true

#### hub alias (git=hub) https://github.com/github/hub
# eval "$(hub alias -s)"
