FROM ubuntu:22.04
LABEL developed_by='@LeoAlecksey'
VOLUME /etc/apache2
WORKDIR /root
COPY ./script.sh .
RUN chmod 777 ./script.sh
RUN ./script.sh
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]