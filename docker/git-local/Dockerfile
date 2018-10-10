FROM ubuntu:bionic

LABEL maintainer="morningspace@yahoo.com"

COPY ./docker/git-local/entrypoint.sh ./docker/git-local/WELCOME /

RUN \
# install packages
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
    git openssh-client vim && \
    rm -rf /var/lib/apt/lists/* && \
# sample git config 
    git config --global user.name "dev" && \
    git config --global user.email "dev@example.com" && \
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -C 'dev@example.com' -N '' && \
# chmod
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]