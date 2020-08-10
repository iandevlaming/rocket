FROM ubuntu:18.04
ARG USER
ARG UID
ARG GID

# unminimize
RUN yes | unminimize -y

# update
RUN apt-get update

# install bazel
RUN apt-get install -y gnupg && \
    apt-get install -y curl && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add - && \
    echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    apt-get update && \
    apt-get install -y bazel

# install vim
RUN apt-get install -y vim

# install ag
RUN apt-get install -y silversearcher-ag

# install gcc 10
RUN apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get install -y gcc-10 g++-10

# install python3 libraries
RUN apt-get install -y python3-numpy && \
    apt-get install -y python3-matplotlib

# install git
RUN apt-get install -y git

# install cmake + ninja
RUN apt-get install -y cmake ninja-build

# install some misc utilities
RUN apt-get install -y gnuplot doxygen graphviz

# misc
USER ${UID}:${GID}
WORKDIR /home/${USER}
COPY .rocketrc /home/${USER}/.bashrc
