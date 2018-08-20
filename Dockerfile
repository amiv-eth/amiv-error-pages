FROM nginx:1.15-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy HTML files
COPY /*.html /var/www/
