FROM stilliard/pure-ftpd

ENV FTP_TLS 2

RUN apt-get -y install inotify-tools

# create empty file to not stop the watcher on non existence
RUN touch /etc/pure-ftpd/pureftpd.passwd

# add pure-ftp startup script
COPY ./pure-ftp.startup.sh /root/pure-ftp.startup.sh
RUN chmod +x /root/pure-ftp.startup.sh

# create dummy certificate
RUN openssl req -subj '/CN=domain.com/O=My Company Name LTD./C=US' -x509 -nodes -days 7300 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

CMD /root/pure-ftp.startup.sh &\
    /usr/sbin/pure-ftpd -l puredb:/etc/pure-ftpd/pureftpd.pdb -Y "$FTP_TLS" -x -E -j -R
