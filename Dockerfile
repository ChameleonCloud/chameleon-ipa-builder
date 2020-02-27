FROM centos:7

RUN yum install -y epel-release \
  && yum install -y python3-pip \
  && pip3 install -U pip \
  && pip3 install bindep tox

RUN mkdir /work
WORKDIR /work

COPY bindep.txt ./bindep.txt
RUN bindep --list_all newline --file bindep.txt | xargs yum install -y

COPY tox.ini ./tox.ini
COPY requirements.txt ./requirements.txt
