#!/bin/sh


if [ -z "${REPOSITORY_URL}" ]; then
    echo "REPOSITORY_URL is not set, exiting..."
    exit
fi


if [ -z "${REPOSITORY_TOKEN}" ]; then
    echo "REPOSITORY_TOKEN is not set, exiting..."
    exit
fi

if [ ! -f ".runner" ]; then
    ./config.sh --unattended \
                --url "${REPOSITORY_URL}" \
                --token "${REPOSITORY_TOKEN}" \
                --name "${RUNNER_NAME}"
fi

./run.sh