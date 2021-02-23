FROM debian:unstable

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get upgrade -y
# RUN apt-get install asciidoctor -y
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
	rubygems \
	-y
RUN mkdir -p /var/lib/gems/2.7.0/plugins && chmod 777 /var/lib/gems/2.7.0/plugins && gem install --no-document text-hyphen && gem install --no-document asciidoctor-pdf && NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install --no-document asciidoctor-epub3 --pre && gem install --no-document asciidoctor-latex --pre
RUN cd /tmp && wget -q https://github.com/w3c/epubcheck/releases/download/v4.2.4/epubcheck-4.2.4.zip && unzip epubcheck-4.2.4.zip
