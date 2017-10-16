FROM ubuntu:zesty
MAINTAINER Julien ANCELIN

ENV LANG C.UTF-8

RUN echo "deb http://qgis.org/ubuntugis-nightly zesty main" >> /etc/apt/sources.list
RUN wget -O - http://qgis.org/downloads/qgis-2017.gpg.key | gpg --import
RUN gpg --export --armor CAEB3DC3BDF7FB45 | apt-key add -
RUN apt-get update 
#RUN apt-get build-dep -y  qgis 
RUN apt-get install -y  qgis python-qgis qgis-plugin-grass \
    locales locales-all && \
    rm -rf /var/lib/apt/lists/*
#--no-install-recommends

#locales
ENV LC_ALL fr_FR.UTF-8
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8

# Called when the Docker image is started in the container
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

CMD /start.sh
