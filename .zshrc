# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey '^y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='lsd --group-dirs first'
alias l='lsd --group-dirs first -la'
alias vim=nvim
alias diff=colordiff
alias fastfetch="fastfetch -c ~/.config/fastfetch/config.jsonc"
alias ssh="TERM=xterm-256color ssh"

# Used for dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Fix gpg signed commits for git
GPG_TTY=$(tty)
export GPG_TTY

# Get pyenv python in path
export PATH="$HOME/.pyenv/shims:$PATH"

# Add to $PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$PATH:/Users/conner/.local/bin"

# Add dafny to path
export PATH="/Users/conner/dafny/:$PATH"

set -o vi
# Thank you jake
bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

# Shell integrations
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

# bun completions
[ -s "/Users/conner/.bun/_bun" ] && source "/Users/conner/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# boost for eecs482 p4
export CPLUS_INCLUDE_PATH="/usr/local/boost/include:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="/usr/local/boost/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/boost/lib:$LD_LIBRARY_PATH"
export LDFLAGS="-L$(brew --prefix openssl@3)/lib"
export CPPFLAGS="-I$(brew --prefix openssl@3)/include"
export PKG_CONFIG_PATH="$(brew --prefix openssl@3)/lib/pkgconfig"

# lfcd stuff
LFCD="$GOPATH/src/github.com/gokcehan/lf/etc/lfcd.sh"  # source
LFCD="/path/to/lfcd.sh"                                #  pre-built binary, make sure to use absolute path
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

export EDITOR=nvim

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/conner/.opam/opam-init/init.zsh' ]] || source '/Users/conner/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
