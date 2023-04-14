FROM python:3.9-alpine

WORKDIR /Explore-Gujarat-Django
COPY . /Explore-Gujarat-Django
RUN pip3 install -r requirements.txt

EXPOSE 8000