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

RUN cp /var/www/html/default.conf /etc/nginx/conf.d/
RUN add-apt-repository --yes ppa:deadsnakes/ppa
RUN apt-get -y update
RUN apt-get upgrade -y
RUN apt-get install -y python3.8 python3-pip virtualenv

EXPOSE 3306
EXPOSE 80
EXPOSE 443

WORKDIR /var/www/html
RUN python3.8 -m venv myenv
RUN source myenv/bin/activate
RUN pip3 install -r requirements.txt

ENTRYPOINT /etc/init.d/mariadb start && python manage.py runserver 0.0.0.0:8000 && /etc/ini.d/nginx start && bin/bash
