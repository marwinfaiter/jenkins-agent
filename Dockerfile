FROM jenkins/ssh-agent:jdk21
USER root

RUN apt-get update && apt-get install --no-install-recommends -y lsb-release curl ca-certificates && rm -rf /var/lib/apt/lists/*
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN curl -sSf https://atlasgo.sh | sh

RUN apt-get update && apt-get install --no-install-recommends -y docker-ce-cli docker-buildx-plugin && rm -rf /var/lib/apt/lists/*
RUN groupadd docker -g 64000
RUN usermod -aG docker jenkins
