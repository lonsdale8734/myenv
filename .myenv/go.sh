if [ -d "$HOME/.local/go/bin" ] ; then
    PATH="$HOME/.local/go/bin:$PATH"
    export GOPATH="$HOME/.local/go"
    export GO111MODULE=on
    export GOPROXY="https://goproxy.io,direct"
fi
