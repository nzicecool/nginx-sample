FROM nginx:alpine  # Use the lightweight Alpine-based Nginx image

COPY ./html /usr/share/nginx/html  # Copy your HTML files to the default Nginx document root
COPY ./css /usr/share/nginx/html/css  # Copy your CSS files to the CSS directory within the document root

EXPOSE 80  # Expose port 80 for HTTP traffic

CMD ["nginx", "-g", "daemon off;"]  # Start Nginx in the foreground
