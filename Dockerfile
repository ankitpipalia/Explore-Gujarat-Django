FROM python:3.9

WORKDIR /Explore-Gujarat-Django
COPY . /Explore-Gujarat-Django
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade wheel
RUN pip3 install -r requirements.txt

EXPOSE 8000