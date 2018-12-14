FROM jenkins/jenkins:alpine
MAINTAINER xkx.zju@gmail.com
USER root

# Install the latest Docker CE binaries
# mirror replaced # xkx
# add jenkins user to docker's group
RUN echo "starting ..." && \
    apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce && \
   gpasswd -a jenkins docker && \
   newgrp - docker

