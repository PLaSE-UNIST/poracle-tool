FROM ubuntu:20.04
RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -y install git
RUN apt-get -y install build-essential 
RUN apt-get -y install openjdk-11-jdk
RUN apt -y install gnutls-bin
RUN apt-get -y install cpanminus
RUN apt-get -y install maven ctags git subversion curl wget unzip global rsync rsyslog
RUN apt-get -y install locales
RUN bash -c 'locale-gen en_US.UTF-8'
RUN apt-get -y install python3-pip
RUN git config --global http.postBuffer 2M
RUN bash -c 'git clone --recursive https://github.com/PLaSE-UNIST/poracle-tool'
# RUN echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
WORKDIR /poracle-tool/
COPY FakeAnnotatedTypeFactory.java modules/junit-quickcheck/core/src/main/java/com/pholser/junit/quickcheck/internal
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
RUN make
WORKDIR /poracle-tool/modules/JQF
# CMD /bin/bash activate
