#!/bin/sh

set -e

if [ -z "${REPOSITORY_URL}" ]; then
    echo "REPOSITORY_URL is not set, exiting..."
    exit
fi


if [ -z "${REPOSITORY_TOKEN}" ]; then
    echo "REPOSITORY_TOKEN is not set, exiting..."
    exit
fi

if [ ! -f ".credentials" ]; then
    ./config.sh --unattended \
                --url "${REPOSITORY_URL}" \
                --token "${REPOSITORY_TOKEN}" \
                --name "${RUNNER_NAME}" \
                --work /runner/work
    # move credential files to /credentials and symlink
    ls -la /runner/config
    mv /runner/.credentials /runner/config/.credentials
    mv /runner/.credentials_rsaparams /runner/config/.credentials_rsaparams
    mv /runner/.runner /runner/config/.runner
    ln -s /runner/config/.credentials /runner/.credentials
    ln -s /runner/config/.credentials_rsaparams /runner/.credentials_rsaparams
    ln -s /runner/config/.runner /runner/.runner
fi

./run.sh