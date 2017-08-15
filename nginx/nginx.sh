#!/bin/bash

cat <<EOF > /nginx/nginx.conf
worker_processes  10;
worker_rlimit_nofile 10240;
pid /nginx/nginx.pid;
daemon off;
error_log /nginx/logs/error.log;

events {
    worker_connections 1024;
    multi_accept on;
    use epoll;
}
http {
    default_type application/octet-stream;
    tcp_nopush on;
    tcp_nodelay off;
    keepalive_timeout 5;
    reset_timedout_connection on;
    client_body_timeout 5;
    client_header_timeout 5;
    send_timeout 5;
    client_body_temp_path /nginx/client_temp;
    proxy_temp_path /nginx/proxy_temp;
    fastcgi_temp_path /nginx/fastcgi_temp;
    uwsgi_temp_path /nginx/uwsgi_temp;
    scgi_temp_path /nginx/scgi_temp;
    server {
        listen 8080;
        access_log /nginx/logs/http.access.log;
        root /nginx/html;
    }
}
EOF

nginx -c /nginx/nginx.conf -p /nginx
