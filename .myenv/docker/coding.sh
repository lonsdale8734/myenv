#!/bin/bash
set -e

DIR_SCRIPT="$(cd "$(dirname ${BASH_SOURCE[0]})" >/dev/null 2>&1 && pwd)"
DIR_ROOT="$DIR_SCRIPT"
DIR_DOCKER="$DIR_SCRIPT"

USER_ID="$(id -u)"
USER_NAME="$(id -un)"
GROUP_ID="$(id -g)"
GROUP_NAME="$(id -gn)"

IMAGE_NAME="coding:ubuntu-20.04"
CONTAINER_NAME="coding"

OPTIONS=

run_container() {
    # -v "$DIR_ROOT:$DIR_ROOT" \
    docker run \
        --network host \
        $OPTIONS \
        -v "$HOME:/home/$USER_NAME" \
        -w "/home/$USER_NAME" \
        -e USER_NAME="$USER_NAME" \
        -e USER_ID="$USER_ID" \
        -e GROUP_NAME="$GROUP_NAME" \
        -e GROUP_ID="$GROUP_ID" \
        --name "$CONTAINER_NAME" \
        "$IMAGE_NAME" "$@"
}

run_daemon() {
    if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
        if [ "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
            # cleanup
            docker rm "$CONTAINER_NAME"
        fi

        run_container
    fi
}

case "$1" in
    "build")
        docker build -t "$IMAGE_NAME" "$DIR_DOCKER"
        ;;
    "exec")
        OPTIONS="-d"
        run_daemon
        sleep 5  # waiting container ready
        docker exec -it -u "$USER_ID" -w "$DIR_ROOT" "$CONTAINER_NAME" bash
        ;;
    "dev")
        OPTIONS="-it --rm"
        run_container bash
        ;;
    *)
        cat <<EOF
Host Usage:
    $0 [action]

    build - build image
    dev - enter dev environment
EOF
esac

