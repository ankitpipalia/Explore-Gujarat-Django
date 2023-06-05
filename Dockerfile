FROM python:3.8-alpine
WORKDIR /gujarat
COPY . .
RUN apk add --no-cache build-base
RUN pip3 install -r requirements.txt

CMD python3 manage.py runserver 0.0.0.0:8000