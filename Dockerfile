FROM debian:unstable

RUN apt-get update && apt-get upgrade
RUN apt-get install asciidoctor
