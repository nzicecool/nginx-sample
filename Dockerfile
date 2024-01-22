FROM nginx:alpine

RUN addgroup -g 10014 nginx_user \
    && adduser -u 10014 -G nginx_user -s /bin/sh -D nginx_user

COPY ./html /usr/share/nginx/html
COPY ./css /usr/share/nginx/html/css

RUN chown -R nginx_user:nginx_user /usr/share/nginx/html

EXPOSE 80

USER nginx_user

CMD ["nginx", "-g", "daemon off;"]
