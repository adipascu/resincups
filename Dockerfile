FROM resin/rpi-raspbian:wheezy-20171129
RUN apt-get update
RUN apt-get install hplip cups xinetd
#RUN usermod -a -G lpadmin pi
RUN sed -i 's/Listen localhost:631/Port 631/' /etc/cups/cupsd.conf
#RUN sed -i '/ Order allow,deny/a  \  Allow @local' /etc/cups/cupsd.conf
RUN sed -i '/ Order allow,deny/a  \  Allow all' /etc/cups/cupsd.conf
RUN useradd -p `openssl passwd -crypt BlaBla` printadmin
RUN usermod -a -G lpadmin printadmin
#RUN mkdir /run/udev && chmod 777 /run/udev
COPY . /app
ADD cups-lpd /etc/xinetd.d/cups-lpd
ENV INITSYSTEM on
CMD ["bash", "/app/start.sh"]
