# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="archcraft"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
plugins=(
  git 
  zsh-syntax-highlighting
  vi-mode
)

source $ZSH/oh-my-zsh.sh
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

# custom
alias c="clear"
alias tat="tmux attach -t"

# omz
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git aliases
alias ginit="git init ."
alias gadd="git add ."
alias gc="git commit -m"
alias gp="git pull"
alias gpu="git push"
alias gf="git fetch"
alias grh="git reset --hard"
alias gadog="git log --all --decorate --oneline --graph"
alias gco="git checkout"
alias gcl="git clone"

# NPM
alias ns="npm start"
alias nrd="npm run dev"
alias ni="npm install"

# YARN
alias y="yarn"
alias yd="yarn dev"
alias ys="yarn start"
