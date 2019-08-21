FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV SITE_FLEXLM_DIR "/path/to/FLEXLM"
ENV SITE_VERSION="11.7"

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install python-simplejson debconf-utils cdebconf ssl-cert \
		rsyslog lsb-core

WORKDIR /usr
RUN ln -s /tmp
RUN mkdir -p /usr/tmp

ENV PATH="${SITE_FLEXLM_DIR}/FLEXlm/${SITE_VERSION}:$PATH"

EXPOSE 33878 27001 51125

WORKDIR ${SITE_FLEXLM_DIR}

CMD ["/path/to/FLEXlm/${SITE_VERSION}/lmgrd","-z","-c","/path/to/license.lic"]
