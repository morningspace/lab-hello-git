FROM ubuntu:bionic

LABEL maintainer="morningspace@yahoo.com"

COPY ./conf ./docker/git-remote/entrypoint.sh ./docker/git-remote/WELCOME /tmp/

RUN \
# install packages
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
    openssh-server apache2 git gitweb highlight vim && \
    rm -rf /var/lib/apt/lists/* && \
# SSH settings
    mkdir -p /var/run/sshd && \
    echo 'root:passw0rd' | chpasswd && \
    sed -i 's/#\s*PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
# SSH login fix. Otherwise user is kicked off after login
    sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd && \
# apache2 settings
    cp -r /tmp/gitweb/apache2/* /etc/apache2/ && \
    echo "ServerName localhost" | tee /etc/apache2/conf-available/servername.conf && \
    a2enconf servername && \
    a2enmod cgi && \
# add git user
    useradd -m git && \
# gitweb settings
    cp /tmp/gitweb/gitweb.conf /etc/

USER git

RUN \
# git settings
    cd && \
    mkdir .ssh && chmod 755 .ssh && touch .ssh/authorized_keys && \
    mkdir git-shell-commands && chmod 755 git-shell-commands && \
# init sample git repository
    git init --bare hello-git.git && \
    echo Say hello to git! > hello-git.git/description

USER root

RUN \
# change shell for git user
    chsh git -s $(which git-shell) && \
# copy default git shell commands
    cp -r /tmp/git-shell-commands/* /home/git/git-shell-commands/ && \
# change owner to git
    find /home/git/git-shell-commands -type f -exec chmod 700 {} \; -exec chown git:git {} \; && \
# cp stuff
    cp /tmp/entrypoint.sh / && \
    cp /tmp/WELCOME / && \
# chmod
    chmod +x /entrypoint.sh && \
# clean up
    rm -r /tmp/*

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 22 80

CMD ["/bin/bash"]