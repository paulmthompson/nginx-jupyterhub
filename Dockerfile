
FROM nginx:stable

ARG NB_USER="jovyan"

ENV NB_USER=$NB_USER

COPY init.sh /usr/local/sbin
COPY default.conf /usr/local/etc/template_nginx.conf

CMD ["/usr/local/sbin/init.sh"]
