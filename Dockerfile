FROM ubuntu:latest
ARG USER
ARG UID
ARG GID

# install bazel
RUN apt-get update && \
    apt-get install -y gnupg && \
    apt-get install -y curl && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add - && \
    echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    apt-get update && \
    apt-get install -y bazel

# install vim
RUN apt-get update && \
    apt-get install -y vim

# install ag
RUN apt-get update && \
    apt-get install -y silversearcher-ag

# install sudo
RUN apt-get update && \
    apt-get install -y sudo

# install python3 
RUN apt-get update && \
    apt-get install -y python3
# misc
USER ${UID}:${GID}
WORKDIR /home/${USER}
