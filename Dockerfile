FROM ubuntu:trusty
MAINTAINER Jeff Allen <docker@trestletech.com>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update
RUN apt-get build-dep -y r-base
RUN apt-get install -y build-essential subversion ccache texlive texlive-fonts-extra texlive-latex-extra docker.io wget

ENV R_2 2.15.0 2.15.1 2.15.2 2.15.3
ENV R_3 3.0.0 3.0.1 3.0.2 3.0.3 3.1.0 3.1.1 3.1.2 3.1.3 3.2.0 3.2.1 3.2.2

COPY installR.sh /usr/local/bin/installR

RUN for word in $R_2; do /usr/local/bin/installR 2 $word; done;
RUN for word in $R_3; do /usr/local/bin/installR 3 $word; done;
