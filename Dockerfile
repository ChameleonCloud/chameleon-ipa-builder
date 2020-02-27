FROM centos:7

RUN yum install -y epel-release \
  && yum install -y python3-pip qemu-img sudo \
  && pip3 install -U pip \
  && pip3 install tox

RUN mkdir /work
WORKDIR /work

COPY tox.ini ./tox.ini
COPY requirements.txt ./requirements.txt

