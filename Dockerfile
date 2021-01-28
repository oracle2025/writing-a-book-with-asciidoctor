FROM debian:unstable

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y && \
	asciidoctor \
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
	unzip
