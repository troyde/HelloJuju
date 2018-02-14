FROM       ubuntu:14.04
FROM       python:3

MAINTAINER Troy De Souza "https://github.com/troyde”
RUN apt-get update
RUN pip install django
RUN pip install dj-database-url

#Running Django directories
#RUN mkdir -p /hello
#RUN chown newuser /newfolder√
#USER newuser
#WORKDIR /newfolder

RUN django-admin startproject helloapp

WORKDIR "/helloapp"

RUN  /helloapp/manage.py startapp testapp


#Adding custom settings.py

ADD settings.py /helloapp/helloapp/

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
