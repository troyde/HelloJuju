FROM       ubuntu:14.04
FROM       python:3

MAINTAINER Troy De Souza "https://github.com/troyde”
RUN apt-get update
RUN pip install django
RUN pip install nano
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:Esoteric$' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

#Running Django directories
#RUN mkdir -p /hello
#RUN chown newuser /newfolder
#USER newuser
#WORKDIR /newfolder

RUN django-admin startproject helloapp

WORKDIR "/helloapp"

RUN  /helloapp/manage.py startapp testapp


#Adding custom settings.py

ADD settings.py /helloapp/helloapp/

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
