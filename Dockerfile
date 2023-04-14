FROM python:3.9-alpine

WORKDIR /Explore-Gujarat-Django
COPY . /Explore-Gujarat-Django

RUN apt-get update
RUN apt-get install build-essential
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade wheel
RUN pip3 install -r requirements.txt

EXPOSE 8000