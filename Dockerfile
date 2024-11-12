FROM nginx:alpine

RUN apk --no-cache add openssl

RUN mkdir -p /etc/ssl/private /etc/ssl/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt \
    -subj "/C=US/ST=Test/L=Test/O=Test/CN=localhost"

EXPOSE 8441

CMD ["nginx", "-g", "daemon off;"]
