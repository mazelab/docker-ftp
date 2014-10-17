docker-ftp
==========

FTP + TLS support for maze nodes based on stilliard/pure-ftpd


The container runs default in FTP over TLS only. You can overwrite the dummy certificate with -v myCert.pem:/etc/ssl/private/pure-ftpd.pem . You can also change the TLS behavior with the environment variable FTP_TLS.

Run the container with mounted storage, overwrite pure-ftp passwd config and use a custom certificate:

    sudo docker run -p 21:21 -d --name ftp --volumes-from mystorage -v myPureftpd.passwd:/etc/pure-ftpd/pureftpd.passwd -v myCert.pem:/etc/ssl/private/pure-ftpd.pem mazelabs/ftp

Changes in the mounted pureftpd.passwd file will refresh the pureftpd db file.
