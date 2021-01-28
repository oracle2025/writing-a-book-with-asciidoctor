FROM debian:unstable

RUN apt-get update && apt-get upgrade -y && apt-get install -y && \
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
	unzip \
	&& rm -rf /var/lib/apt/lists/*
