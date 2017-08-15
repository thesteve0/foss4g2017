FROM centos

ADD nginx.repo /etc/yum.repos.d/

RUN yum update -y && yum install -y nginx

RUN mkdir -p /nginx
ADD nginx.sh /nginx/
RUN chmod 777 -R /nginx

EXPOSE 8080
WORKDIR /nginx

VOLUME ["/nginx/html"]
VOLUME ["/nginx/logs"]

CMD ["./nginx.sh"]
