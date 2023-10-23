FROM ubuntu:18.04

RUN apt update && \
	apt install -y openvswitch-switch mininet iproute2 \
                curl inetutils-ping inetutils-traceroute \
                build-essential git nano screen python python-pip sudo && \
        pip install typing && \
        pip install mininet twisted ltprotocol

RUN apt install -y python3 python3-pip && \
        pip3 install -U pip && \
	pip3 install -U cryptography && \
        pip3 install mininet pexpect scapy

WORKDIR /

COPY project-base project-base
