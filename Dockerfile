FROM debian:bookworm-slim

ARG RELEASE_TAG
ARG RELEASE_HASH

RUN mkdir /runner && cd /runner

WORKDIR /runner

RUN apt-get update && apt-get install --yes curl libdigest-sha-perl tini

RUN curl -o actions-runner-linux-x64-${RELEASE_TAG}.tar.gz \
    -L https://github.com/actions/runner/releases/download/v${RELEASE_TAG}/actions-runner-linux-x64-${RELEASE_TAG}.tar.gz

RUN echo "${RELEASE_HASH}  actions-runner-linux-x64-${RELEASE_TAG}.tar.gz" | shasum -a 256 -c

RUN tar xzf ./actions-runner-linux-x64-${RELEASE_TAG}.tar.gz

RUN rm actions-runner-linux-x64-${RELEASE_TAG}.tar.gz

RUN ./bin/installdependencies.sh

ADD entry.sh entry.sh

RUN chmod +x entry.sh

RUN useradd ghrunner

RUN chown ghrunner:ghrunner .

USER ghrunner

ENTRYPOINT ["tini", "-v", "--", "/runner/entry.sh"]
