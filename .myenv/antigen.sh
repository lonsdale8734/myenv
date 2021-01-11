export FZF_BASE="$MYENV/fzf"
export ANTIGEN_DEFAULT_REPO_URL="https://github.com/ohmyzsh/ohmyzsh.git"

export _Z_DATA="$MYENV/cache/z"
export ADOTDIR="$MYENV/cache/antigen"

source $MYENV/antigen/bin/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# zsh-users/zsh-autosuggestions
antigen bundles <<EOBUNDLES
zsh-users/zsh-completions
zsh-users/zsh-syntax-highlighting

magic-enter
colored-man-pages
command-not-found

vi-mode

z
fzf
git
tmux
docker
ssh-agent
EOBUNDLES

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
