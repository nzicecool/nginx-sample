FROM nginxinc/nginx-unprivileged:stable-alpine-slim

COPY ./html /usr/share/nginx/html
COPY ./css /usr/share/nginx/html/css

RUN chown -R choreo:choreo /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
