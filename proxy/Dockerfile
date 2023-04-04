FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="getcustomer.live"


COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh

ENV LISTEN_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000
# ENV REQUESTS_CA_BUNDLE=/etc/nginx/certs/

USER root

RUN mkdir -p /vol/static && \
    chmod 755 /vol/static && \
    mkdir -p /etc/letsencrypt/live/backend.getcustomer.live && \
    chmod 755 /etc/letsencrypt/live/backend.getcustomer.live && \
    touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

VOLUME /vol/static
VOLUME /etc/letsencrypt/live/backend.getcustomer.live/fullchain.pem
VOLUME /etc/letsencrypt/live/backend.getcustomer.live/privkey.pem

USER nginx

CMD ["/run.sh"]