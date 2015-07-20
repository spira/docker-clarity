FROM spira/docker-base

MAINTAINER "Zak Henry" <zak.henry@gmail.com>

WORKDIR /tmp

# Install Clarity deps
RUN apt-get update -y && \
    apt-get install -y ruby ruby-dev make g++ ruby-eventmachine ruby-json

# Install clarity
RUN gem install clarity

# Uninstall build deps
RUN apt-get -y remove ruby-dev make g++ && \
    apt-get -y autoremove && \
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

# Clarity startup script
ADD config/clarity-start.sh /opt/bin/clarity-start.sh
RUN chmod u=rwx /opt/bin/clarity-start.sh

RUN mkdir -p ${LOG_ROOT:-/data/logs}

# PORTS
EXPOSE 8989

WORKDIR /opt/bin
ENTRYPOINT ["/opt/bin/clarity-start.sh"]
