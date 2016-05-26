FROM 1and1internet/ubuntu-16-nginx-1.10.0-php-7.0:unstable
MAINTAINER james.eckersall@fasthosts.co.uk
ARG DEBIAN_FRONTEND=noninteractive

RUN \
  curl --location https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz | tar xzf - && \
  mv phpMyAdmin*/* /var/www/html/ && \
  rm -rf /var/www/html/js/jquery/src/ /var/www/html/examples /var/www/html/po/

COPY files/ /

ENV PHP_UPLOAD_MAX_FILESIZE=64M \
    PHP_MAX_INPUT_VARS=2000     \
    PMA_ARBITRARY=1             \
    PMA_HOST=""                 \
    PMA_PORT=3306               \
    PMA_HOSTS=""                \
    PMA_ABSOLUTE_URI=""

# variables explained:
#   PMA_ARBITRARY - when set to 1 connection to the arbitrary server will be allowed
#   PMA_HOST - define address/host name of the MySQL server
#   PMA_PORT - define port of the MySQL server
#   PMA_HOSTS - define comma separated list of address/host names of the MySQL servers
#   PMA_ABSOLUTE_URI - define user-facing URI
#   PHP_UPLOAD_MAX_FILESIZE - define upload_max_filesize and post_max_size PHP settings
#   PHP_MAX_INPUT_VARS - define max_input_vars PHP setting

EXPOSE 8080
#USER 27

