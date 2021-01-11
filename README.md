# MyEnv

## Setup myenv

```shell
# Install baisc binary
curl https://raw.githubusercontent.com/lonsdale8734/myenv/master/.myenv/init.sh | sudo bash -s bin

# Setup config
curl https://raw.githubusercontent.com/lonsdale8734/myenv/master/.myenv/init.sh | sudo bash
```

## Create myenv repo

```shell
git init --bare $HOME/github/myenv/
git --git-dir=$HOME/github/myenv/ --work-tree=$HOME config --local status.showUntrackedFiles no
```

