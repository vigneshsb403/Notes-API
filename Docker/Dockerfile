FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /var/API-Dev
RUN apt update
RUN apt upgrade -y
RUN apt install -y apache2
RUN apt install -y php libapache2-mod-php php-mysql
RUN apt install -y nano git net-tools
RUN rm -rf /var/www/html
COPY ./data/ .
RUN chmod +x /var/API-Dev/main.sh
VOLUME ["/var/www/html"]
CMD /var/API-Dev/main.sh