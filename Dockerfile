FROM python:3.9

RUN cd ~
RUN git clone https://github.com/ankitpipalia/Explore-Gujarat-Django.git
RUN apt update -y
RUN apt dist-upgrade -y
RUN apt install python3-dev -y
RUN apt-get install mariadb-server -y
RUN apt install openssl

WORKDIR Explore-Gujarat-Django

RUN pip install --upgrade pip
RUN pip install asgiref
RUN pip install backports.zoneinfo
RUN pip install django
RUN pip install mysql-connector
RUN pip install mysql-connector-python-rf

EXPOSE 8000
ENTRYPOINT python manage.py runserver 0.0.0.0:8000
