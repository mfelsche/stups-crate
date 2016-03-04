FROM zalando/openjdk:8u66-b17-1-3
#FROM iron/java:1.8
#FROM java:8-jre

MAINTAINER Matthias Wahl <matthiaswahl@m7w3.de>

EXPOSE 4200 4300

# environment vars
ENV DEBIAN_FRONTEND=noninteractive \
    CRATE_VERSION=0.54.6 \
    PATH=/crate/bin:$PATH

# install wget
RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt
# download crate release
RUN mkdir /crate && \
    wget -nv -O - "https://cdn.crate.io/downloads/releases/crate-$CRATE_VERSION.tar.gz" \
    | tar -xzC /crate --strip-components=1

VOLUME ["/data"]

WORKDIR /data

ADD config/crate.yml /crate/config/crate.yml
ADD config/logging.yml /crate/config/logging.yml

ADD start-crate.sh /crate/bin/start-crate.sh
RUN chmod 0755 /crate/bin/start-crate.sh
ADD scm-source.json /scm-source.json

# we need a separate script to apply some defaults via environment
# variables that are local to the docker run call, so we can't set them here
ENTRYPOINT ["/crate/bin/start-crate.sh"]
