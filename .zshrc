# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


f() {
    local dir
    dir=$(find * -type d -not -path '*/node_modules/*' -not -path '*/.git/*' -not -path '*/\.*' 2>/dev/null | fzf --preview 'tree -C {}' --reverse)
    if [ -n "$dir" ]; then
        builtin cd "$dir"
    fi
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=( 
    # other plugins...
    zsh-vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# CUSTOM
alias polaris="tmux new-session -c ~/Developer/SINARMAS/web-polaris-ts -s POLARIS 'nvim' \; new-window 'npm run dev'"

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

# BUN
alias b="bun"
alias bi="bun install"
alias bu="bun update"
alias brd="bun run dev"

# RUST
alias cr="cargo run"
alias ct="cargo test"
alias cb="cargo build"

# ETC
alias c="clear"
alias nvc="nvim ~/.config/nvim/lua/user/init.lua"
alias d="cd ~/Developer/"
alias dp="cd ~/Developer/PERSONAL/"
alias ds="cd ~/Developer/SELEGO/"
alias l='exa -lh'
alias ll='exa -lah'
alias la='exa -A'
alias lm='exa -m'
alias lr='exa -R'
alias lg='exa -l --group-directories-first'
alias disable-sleep='sudo pmset disablesleep 1'
alias enable-sleep='sudo pmset disablesleep 0'
alias tat="tmux attach -t"
alias cat="bat"
alias cd="z"

# GO
alias g="go"
alias gr="go run"
alias grm="go run main.go"

# VSCODE
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# RUBY
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export OPENAI_API_KEY="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"

export PATH=/opt/homebrew/bin:$PATH
export REACT_EDITOR=code
eval "$(rbenv init - zsh)"

# DENO
export DENO_INSTALL="/Users/wiscaksono/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/wiscaksono/.bun/_bun" ] && source "/Users/wiscaksono/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

[[ "$TERM_PROGRAM" == "CodeEditApp_Terminal" ]] && . "/Applications/CodeEdit.app/Contents/Resources/codeedit_shell_integration.zsh"

# pnpm
export PNPM_HOME="/Users/wiscaksono/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval $(thefuck --alias)
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
unset ZSH_AUTOSUGGEST_USE_ASYNC

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
