FROM	ubuntu:xenial

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz /tmp/

RUN	tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
	apt update && \
	apt dist-upgrade -y && \
	apt install -y \
		apache2 \
		curl \
		echoping \
		libapache2-mod-fcgid \
		msmtp-mta \
		netbase \
		smokeping

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config /data

# Override these environment variables
ENV SLAVE_SECRET=1234567
ENV MASTER_URL=http://smokeping-master:80/smokeping/smokeping.cgi
ENV MODE=MASTER

ENTRYPOINT	["/init"]
