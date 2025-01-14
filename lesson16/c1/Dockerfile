FROM alpine:latest
LABEL developed_by='@LeoAlecksey'
RUN mkdir /opt/www
RUN apk update
WORKDIR /opt/www
COPY ./nginx.sh .
RUN chmod 777 ./nginx.sh
RUN ./nginx.sh
COPY ./index.html .
COPY ./alex.conf .
RUN rm /etc/nginx/http.d/default.conf 
RUN mv /opt/www/alex.conf /etc/nginx/http.d/alex.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]