# Load plugin
export MYENV="$HOME/.myenv"
source "$MYENV/antigen.sh"
source "$MYENV/pyenv.sh"
source "$MYENV/go.sh"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# User configuration
alias myenv='/usr/bin/git --git-dir=$HOME/github/myenv/ --work-tree=$HOME'
alias vi="vim"
