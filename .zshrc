#### Available Shortcuts ####
# x - extract any type of extension
# cat - colorized cat
# cpv - copy with progress bar

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Z for easier navigation
. /opt/z/z.sh

# Path to your oh-my-zsh installation.
export ZSH="/home/bee/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git colorize cp extract)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nano'
fi

if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Aliases
alias ll="ls -lah"
alias la="ls -ah"
alias cat="ccat"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

## Starship Prompt ##
eval "$(starship init zsh)"
