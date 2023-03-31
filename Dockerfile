FROM python:3.9

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y git mariadb-server nginx

RUN rm /var/www/html/index.nginx-debian.html
RUN rm -rf /etc/nginx/sites-available/*
RUN rm -rf /etc/nginx/conf.d/*

RUN git clone https://github.com/ankitpipalia/Explore-Gujarat-Django.git /var/www/html
RUN rm /etc/nginx/sites-enabled/default
RUN cp /var/www/html/default.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default

EXPOSE 3306
EXPOSE 80
EXPOSE 443

WORKDIR /var/www/html
RUN pip3 install django
RUN pip3 install mysql-connector
RUN pip3 install asgiref
RUN pip3 install backports.zoneinfo
RUN pip3 install --upgrade pip

ENTRYPOINT /etc/init.d/mariadb start && python3 manage.py runserver localhost:8000 && /etc/init.d/nginx start && 
/bin/bash
