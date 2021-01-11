FROM ubuntu:20.04

COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y software-properties-common apt-transport-https ca-certificates
RUN apt-get install -y apt-utils build-essential software-properties-common
RUN apt-get install -y sudo zsh wget curl openssh-server rsync busybox git vim tmux htop
RUN apt-get install -y autoconf libtool pkg-config automake make unzip cmake ccache gdb gdbserver
RUN apt-get install -y tig shellcheck glances fd-find ripgrep


COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

