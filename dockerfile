#Sourde de la version Debian
FROM debian:bullseye

#execution update sur le serveur, installation NGINX
RUN apt-get update -yq \
   && apt-get install nginx -yq \
   && apt-get clean -y && apt-get install curl -y

#Ajout des fichiers dans l'image
ADD ./index/www /var/www/html

#Indique le répertoire de partage
VOLUME /var/www/html


RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

CMD ["/usr/sbin/nginx"]
