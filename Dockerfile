FROM nginx:1.17.1-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY /dist/angular-14-crud-example /usr/share/nginx/html

EXPOSE 80
