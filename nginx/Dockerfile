FROM nginx:stable-alpine-slim

COPY default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx","-g","daemon off;"]