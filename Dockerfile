FROM debian:unstable

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install asciidoctor -y
RUN apt-get install \
	ruby-dev \
	pkgconf \
	zlib1g-dev \
	libxml2-dev \
	libxslt-dev \
	diction \
	pdftk \
	spell \
	default-jre \
	wget \
	unzip \
	-y
