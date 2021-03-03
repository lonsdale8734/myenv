#!/bin/bash
set -e

SELF="$0"
OPTIONS="$*"

use_root() {
    if [ "$(id -u)" != "0" ]; then
        if command -v sudo >/dev/null 2>&1; then
            # $OPTIONS cannot be wrapped with quote
            exec sudo "$SELF" $OPTIONS
        else
            echo "Please run as root."
            exit 1
        fi
    fi
}

install_bin() {
    apt-get update && apt-get -y upgrade
    apt-get install -y software-properties-common apt-transport-https
    apt-get install -y apt-utils build-essential software-properties-common
    apt-get install -y zsh wget curl openssh-server rsync busybox git vim tmux htop
    apt-get install -y autoconf libtool pkg-config automake make unzip cmake ccache gdb gdbserver
    apt-get install -y tig shellcheck glances fd-find ripgrep
    apt-get install -y libbz2-dev libreadline-dev libsqlite3-dev
    # apt-get install -y ca-certificates
}

use_zsh() {
    if ! grep "$USER" /etc/passwd | grep "/zsh$" >/dev/null 2>&1; then
        chsh -s "$(which zsh)"
    fi
}

setup_myenv() {
    mkdir -p "$HOME/github/"
    git clone --bare https://github.com/lonsdale8734/myenv.git "$HOME/github/myenv/"
    myenv="/usr/bin/git --git-dir=$HOME/github/myenv/ --work-tree=$HOME"
    $myenv config --local status.showUntrackedFiles no
    $myenv checkout
    $myenv submodule update --init

    echo "Download fzf binary..."
    curl -fL https://github.com/junegunn/fzf/releases/download/0.25.0/fzf-0.25.0-linux_amd64.tar.gz | tar xz -C "$HOME/.myenv/fzf/bin"
}

case "$1" in
    "bin")
        use_root
        install_bin
        ;;
    *)
        setup_myenv
        echo 'source "$HOME/.myenv/myenv.sh"' >> "$HOME/.zshrc"
        use_zsh
esac

