FROM nginxinc/nginx-unprivileged:stable-alpine-slim

COPY ./html /usr/share/nginx/html
COPY ./css /usr/share/nginx/html/css

EXPOSE 8080

USER 10014

CMD ["nginx", "-g", "daemon off;"]
