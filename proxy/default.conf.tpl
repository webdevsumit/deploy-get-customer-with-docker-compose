
server {
    listen ${LISTEN_PORT};

    location /static {
        alias /vol/static;
    }

    location / {
        uwsgi_pass              ${APP_HOST}:${APP_PORT};
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    300M;
    }
}

# server {
#     listen 443 ssl http2;
#     listen [::]:443 ssl http2;
#     server_name backend.getcustomer.live;
# 
#     server_tokens off;
# 
#     ssl_certificate /etc/letsencrypt/live/backend.getcustomer.live/fullchain.pem;
#     ssl_certificate_key /etc/letsencrypt/live/backend.getcustomer.live/privkey.pem;
# 
#     ssl_buffer_size 8k;
# 
#     ssl_dhparam /etc/ssl/certs/dhparam-2048.pem;
# 
#     ssl_protocols TLSv1.2 TLSv1.1 TLSv1;
#     ssl_prefer_server_ciphers on;
# 
#     ssl_ciphers ECDH+AESGCM:ECDH+AES256:ECDH+AES128:DH+3DES:!ADH:!AECDH:!MD5;
# 
#     ssl_ecdh_curve secp384r1;
#     ssl_session_tickets off;
# 
#     # OCSP stapling
#     ssl_stapling on;
#     ssl_stapling_verify on;
#     resolver 8.8.8.8;
# 
#     return 301 https://backend.getcustomer.live$request_uri;
# }
# 
# 