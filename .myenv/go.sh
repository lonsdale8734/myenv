if [ -d "$HOME/.local/go/bin" ] ; then
    PATH="$HOME/.local/go/bin:$PATH"
    export GOPATH="$HOME/.local/go"
fi
