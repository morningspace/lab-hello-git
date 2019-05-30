FROM ubuntu:bionic

LABEL maintainer="morningspace@yahoo.com"

COPY ./docker/git-local/entrypoint.sh ./docker/git-local/WELCOME /

RUN \
# install packages
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
    git openssh-client vim pigz git-flow && \
    rm -rf /var/lib/apt/lists/* && \
# chmod
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]