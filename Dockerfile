FROM debian:unstable

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get upgrade -y # && \
	# apt-get install asciidoctor -y
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
RUN mkdir /var/lib/gems/2.7.0/plugins && chmod 777 /var/lib/gems/2.7.0/plugins && gem install --no-document text-hyphen && gem install --no-document asciidoctor-pdf && NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install --no-document asciidoctor-epub3 --pre && gem install --no-document asciidoctor-latex --pre
