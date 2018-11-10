FROM jenkins/jenkins:lts
MAINTAINER miiro@getintodevops.com
USER root

# Install the latest Docker CE binaries
# mirror replaced # xkx
RUN sed -i 's/deb.debian.org/ftp.cn.debian.org/g' /etc/apt/sources.list && \
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
   apt-get -y install docker-ce

