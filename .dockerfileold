FROM ubuntu

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y git mariadb-server nginx software-properties-common

RUN rm /var/www/html/index.nginx-debian.html
RUN rm -rf /etc/nginx/sites-available/*
RUN rm -rf /etc/nginx/conf.d/*

RUN git clone https://github.com/ankitpipalia/Explore-Gujarat-Django.git /var/www/html

ENV MYSQL_ROOT_PASSWORD=root1234
ENV MYSQL_DATABASE=gujarat

RUN cp /var/www/html/default.conf /etc/nginx/sites-available/
RUN add-apt-repository --yes ppa:deadsnakes/ppa
RUN apt-get -y update
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3.9
RUN apt-get install -y python3-pip python3.9-dev

EXPOSE 3306
EXPOSE 80
EXPOSE 443

WORKDIR /var/www/html
RUN pip3 install django
RUN pip3 install mysql-connector

ENTRYPOINT /etc/init.d/mariadb start && python3 /var/www/html/manage.py runserver localhost:8000 && service nginx start && /bin/bash
