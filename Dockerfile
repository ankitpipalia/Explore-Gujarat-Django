FROM python:3.4

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y git mariadb-server nginx

RUN rm /var/www/html/index.nginx-debian.html
RUN rm -rf /etc/nginx/sites-available/*
RUN rm -rf /etc/nginx/conf.d/*

RUN git clone https://github.com/ankitpipalia/Explore-Gujarat-Django.git /var/www/html
RUN cp /var/www/html/default.conf /etc/nginx/sites-available/

ENV MYSQL_ROOT_PASSWORD=root1234
ENV MYSQL_DATABASE=gujarat

EXPOSE 3306
EXPOSE 80
EXPOSE 443

WORKDIR /var/www/html
RUN pip3 install django
RUN pip3 install mysql-connector

ENTRYPOINT /etc/init.d/mariadb start && python3 /var/www/html/manage.py runserver localhost:8000 && service nginx start && /bin/bash
