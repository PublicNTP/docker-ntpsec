FROM ubuntu:18.04
LABEL maintainer "PublicNTP"

ENV NTPSEC_VERSION "1.1.3"
ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y upgrade
RUN mkdir -p /usr/local/src/ntpsec-${NTPSEC_VERSION}/
COPY src/ntpsec-${NTPSEC_VERSION}/ /usr/local/src/ntpsec-${NTPSEC_VERSION}/
WORKDIR /usr/local/src/ntpsec-${NTPSEC_VERSION}
RUN ./buildprep
RUN ./waf configure
RUN ./waf build
RUN ./waf install

