#### Available Shortcuts ####
# x - extract any type of extension
# cat - colorized cat
# cpv - copy with progress bar


# Export PATH
PATH="$HOME/.node/bin:$HOME/go/bin:$HOME/.local/bin:$PATH"
NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
MANPATH="$HOME/.node/share/man:$MANPATH"
GOPATH="$HOME/go"
export PATH
export NODE_PATH
export MANPATH
export GOPATH

# Preferred theme for ssh connection and local
if [[ -n $SSH_CONNECTION ]]; then
    ZSH_THEME="gentoo"
else
    ZSH_THEME="typewritten"
    # ZSH_THEME="networks_lab"
fi

# Typewritten theme settings
export TYPEWRITTEN_PROMPT_LAYOUT="singleline_verbose"
export TYPEWRITTEN_RELATIVE_PATH="git"

DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use Auto Suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Path to your oh-my-zsh installation.
export ZSH="/home/bee/.oh-my-zsh"

plugins=(git cp extract z)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# mcfly - faster shell history search
eval "$(mcfly init zsh)"
export MCFLY_DISABLE_MENU=TRUE
export MCFLY_KEY_SCHEME=vim

# Set default editor as Vim
export EDITOR='vim'

if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi
#export TERM=xterm-256color

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Aliases
alias ls='lsd'
alias ll='ls -lah'
alias la='ls -ah'
alias cat='bat -p'
alias cp='cpv'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gcalme='gcalcli --config-folder ~/.gcal/personal'
alias gcalclg='gcalcli --config-folder ~/.gcal/college'
alias fromscratch='vim ~/.fromscratch/content.txt'
alias spotify='LD_PRELOAD=/usr/lib/spotify-adblock.so spotify'
alias vim='nvim'
