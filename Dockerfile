FROM       ubuntu:14.04
FROM       python:3

MAINTAINER Troy De Souza "https://github.com/troyde”

ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/


#RUN apt-get update
#RUN pip install django
#RUN pip install dj-database-url
#RUN apt-get install -y openssh-server
# RUN mkdir /var/run/sshd
#RUN echo 'root:Esoteric$' | chpasswd
#RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
#ENV NOTVISIBLE "in users profile"
#RUN echo "export VISIBLE=now" >> /etc/profile
#Running Django directories
#RUN mkdir -p /hello
#RUN chown newuser /newfolder
#USER newuser
#WORKDIR /newfolder
#RUN django-admin startproject helloapp
#WORKDIR "/helloapp"
#RUN  /helloapp/manage.py startapp howdy
#Adding custom settings.py
#ADD settings.py /helloapp/helloapp/
#EXPOSE 8000
#CMD    ["/usr/sbin/sshd", "-D"]

