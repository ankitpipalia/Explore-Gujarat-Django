FROM python:3.9-alpine

WORKDIR /Explore-Gujarat-Django
COPY . /Explore-Gujarat-Django
RUN apk add --no-cache build-base
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

EXPOSE 8000