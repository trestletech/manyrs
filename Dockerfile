FROM ubuntu:trusty
MAINTAINER Jeff Allen <docker@trestletech.com>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update
RUN apt-get build-dep -y r-base
RUN apt-get install -y build-essential subversion ccache texlive texlive-fonts-extra texlive-latex-extra wget libcurl4-nss-dev

COPY installR.sh /usr/local/bin/installR

# R 2.x
RUN /usr/local/bin/installR 2 2.15.0
RUN /usr/local/bin/installR 2 2.15.1
RUN /usr/local/bin/installR 2 2.15.2
RUN /usr/local/bin/installR 2 2.15.3

# R 3.x
RUN /usr/local/bin/installR 3 3.0.0
RUN /usr/local/bin/installR 3 3.0.1
RUN /usr/local/bin/installR 3 3.0.2
RUN /usr/local/bin/installR 3 3.0.3
RUN /usr/local/bin/installR 3 3.1.0
RUN /usr/local/bin/installR 3 3.1.1
RUN /usr/local/bin/installR 3 3.1.2
RUN /usr/local/bin/installR 3 3.1.3
RUN /usr/local/bin/installR 3 3.2.0
RUN /usr/local/bin/installR 3 3.2.1
RUN /usr/local/bin/installR 3 3.2.2
RUN /usr/local/bin/installR 3 3.2.3
RUN /usr/local/bin/installR 3 3.2.4
RUN /usr/local/bin/installR 3 3.2.4-revised R-revised
RUN /usr/local/bin/installR 3 3.2.5
RUN /usr/local/bin/installR 3 3.3.0
RUN /usr/local/bin/installR 3 3.3.1

# We now have a bunch of Rs installed in /usr/local/lib
# Create a zip of all the Rs
RUN apt-get install -y p7zip-full
RUN 7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=100m -ms=on allRs.7z /usr/local/lib/R-*
