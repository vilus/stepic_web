proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;

upstream backend {
    server 127.0.0.1:8080;
}

location /hello/ {
    proxy_pass http://backend;
}
