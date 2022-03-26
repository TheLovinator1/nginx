# TODO: Add logrotate

FROM ubuntu:devel

# To run nginx as a non-root user, you need to add/change 'user nginx;' in your /etc/nginx/nginx.conf:
RUN apt-get update && apt-get install -y nginx && \
useradd --system --home /var/www --shell /bin/nologin lovinator

# Config files are stored in /etc/nginx/
# Logs are stored in /var/log/nginx
# Default location for documents is /var/www
VOLUME ["/var/log/nginx", "/etc/nginx/", "/var/www"]
WORKDIR /var/www

# 80/tcp    HTTP
# 443/tcp   HTTPS
EXPOSE 80/tcp 443/tcp

CMD ["nginx", "-g", "daemon off;"]
