FROM python:3.9

RUN apt-get -y update
RUN apt-get install -y mariadb-server nginx

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
RUN pip3 install -r requirements.txt
RUN pip3 install --upgrade pip
RUN chmod +x /var/www/html/script

ENTRYPOINT /etc/init.d/mariadb start && /etc/init.d/nginx start && /bin/bash