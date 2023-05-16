FROM docker:23.0-dind AS docker

RUN cp /usr/local/bin/docker /usr/bin/docker

FROM 0xc9c3/github_actions_runner:latest

COPY --from=docker /usr/bin/docker /usr/bin/docker

ENV RUNNER_ALLOW_RUNASROOT=1

USER root

RUN apt-get update && apt-get install --yes jq \
    && rm -rf /var/lib/apt/lists/*