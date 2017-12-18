FROM resin/rpi-raspbian:wheezy-20171129
RUN apt-get update
RUN apt-get install hplip cups
#RUN usermod -a -G lpadmin pi
RUN sed -i 's/Listen localhost:631/Port 631/' /etc/cups/cupsd.conf
COPY . /app
ENV INITSYSTEM on
CMD ["bash", "/app/start.sh"]
