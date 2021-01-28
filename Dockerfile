FROM debian:unstable

RUN apt-get update && apt-get upgrade -y
RUN apt-get install asciidoctor -y
