# Use the official Ubuntu 20.04 base image
FROM ubuntu:20.04

# Update package lists and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* $$\
    rm -rf /var/www/html/*

# Copy HTML files to Nginx default web root directory
COPY . /var/www/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx and keep the process running in the foreground
CMD ["nginx", "-g", "daemon off;"]
