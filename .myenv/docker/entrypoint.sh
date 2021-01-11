#!/bin/bash
set -e

[ "$(id -u)" == "0" ] || {
  echo "Remove -u option from docker run"
  exit 1
}

echo "USER_ID=$USER_ID USER_NAME=$USER_NAME"
echo "GROUP_ID=$GROUP_ID GROUP_NAME=$GROUP_NAME"

if id -g "$GROUP_ID" &> /dev/null; then
    echo "Group $GROUP_ID exists"
else
    echo "Add group $GROUP_ID"
    groupadd -g "$GROUP_ID" "$GROUP_NAME"
fi

if id -u "$USER_ID" &> /dev/null; then
    echo "User $USER_ID exists"
else
    echo "Add user $USER_ID"
    useradd -s /usr/bin/zsh -m -u "$USER_ID" -g "$GROUP_NAME" -G sudo "$USER_NAME" &>/dev/null
    echo "$USER_NAME:code" | chpasswd
fi

echo "Welcome to dev container!"
realUserName="$(id -un "$USER_ID")"
exec sudo -u "$realUserName" -H zsh -c "$*"

