FROM ikuai/ubuntu_cst_18.04

MAINTAINER Jgguo <jgguo2596@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get install -y software-properties-common \
	&& add-apt-repository ppa:adiscon/v8-stable \
	&& apt-get update \
	&& apt-get install -y rsyslog \
	&& apt-get install -y rsyslog-kafka rsyslog-imptcp rsyslog-elasticsearch\
	# clean
	&& apt-get purge -y --auto-remove software-properties-common \
	&& apt-get autoremove -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 514 514/udp

ENTRYPOINT [ "rsyslogd", "-n" ]