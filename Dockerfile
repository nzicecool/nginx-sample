FROM nginxinc/nginx-unprivileged:stable-alpine-slim

# Create a user with a known UID/GID within range 10000-20000.
# This is required by Choreo to run the container as a non-root user.
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    "choreo"

COPY ./html /usr/share/nginx/html
COPY ./css /usr/share/nginx/html/css

RUN chown -R choreo:choreo /usr/share/nginx/html

EXPOSE 80

USER 10014

CMD ["nginx", "-g", "daemon off;"]
