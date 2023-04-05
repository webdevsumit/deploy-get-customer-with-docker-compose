
server {
    listen ${LISTEN_PORT};

    location /static {
        alias /vol/static;
    }

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        uwsgi_pass              ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    300M;
    }
}

# server {
#     listen 443 ssl;
#     ssl on;
# 
#     server_name backend.getcustomer.live;
#     ssl_certificate /etc/letsencrypt/live/backend.getcustomer.live/fullchain.pem;
#     ssl_certificate_key /etc/letsencrypt/live/backend.getcustomer.live/privkey.pem;
# 
#     location /static {
#         alias /vol/static;
#     }
# 
#     location /.well-known/acme-challenge/ {
#         root /var/www/certbot;
#     }
#     
#     location / {
#         uwsgi_pass              ${APP_HOST}:${APP_PORT};
#         include                 /etc/nginx/uwsgi_params;
#         client_max_body_size    300M;
#     }
# }
# 