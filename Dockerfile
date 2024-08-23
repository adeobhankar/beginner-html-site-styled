# Use an official Nginx image as a base
FROM nginx:alpine

# Copy website files to the container
COPY . /usr/share/nginx/html
