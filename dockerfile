FROM ubuntu:20.04

ARG ROOT_PASSWORD=changeme

RUN apt-get update && apt-get install -y openssh-server && mkdir /var/run/sshd

RUN echo "root:${ROOT_PASSWORD}" | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]