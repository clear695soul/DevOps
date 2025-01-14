FROM alpine:latest
LABEL developed_by='@LeoAlecksey'
VOLUME /etc/nginx/http.d
RUN mkdir /opt/www
RUN apk update
WORKDIR /root
RUN apk add curl
RUN apk add nginx
COPY ./nginx.conf /etc/nginx/http.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]