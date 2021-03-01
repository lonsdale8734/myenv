# Load plugin
export MYENV="$HOME/.myenv"
source "$MYENV/antigen.sh"
source "$MYENV/pyenv.sh"
source "$MYENV/go.sh"

# User configuration
alias myenv='/usr/bin/git --git-dir=$HOME/github/myenv/ --work-tree=$HOME'
alias vi="vim"
