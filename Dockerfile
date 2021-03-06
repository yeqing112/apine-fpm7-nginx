FROM alpine
LABEL author yeqing.run
RUN sed -i 's~dl-cdn.alpinelinux.org~mirrors.aliyun.com~' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache tzdata php7-intl php7-openssl php7-dba php7-sqlite3 php7-pear php7-tokenizer php7-phpdbg php7-pecl-imagick-dev  php7-litespeed  php7-gmp php7-pdo_mysql php7-pcntl php7-common php7-pecl-oauth php7-xsl php7 php7-fpm php7-pecl-mailparse php7-pecl-imagick php7-mysqlnd php7-enchant php7-pspell php7-pecl-redis php7-snmp php7-doc php7-fileinfo php7-mbstring php7-pecl-amqp php7-dev php7-xmlrpc php7-embed php7-xmlreader php7-pdo_sqlite php7-exif  php7-recode php7-opcache php7-ldap php7-posix php7-session php7-gd php7-pecl-xdebug php7-gettext  php7-json php7-xml php7-iconv php7-sysvshm php7-curl php7-shmop php7-odbc php7-phar php7-pdo_pgsql php7-imap php7-pecl-apcu php7-pdo_dblib php7-pgsql php7-pdo_odbc php7-zip php7-cgi php7-ctype php7-pecl-mcrypt php7-wddx php7-bcmath php7-calendar php7-tidy php7-dom php7-sockets php7-pecl-zmq php7-pecl-memcached php7-dbg php7-soap php7-sysvmsg php7-pecl-ssh2 php7-ftp php7-sysvsem php7-pdo php7-static php7-bz2 php7-mysqli php7-simplexml php7-xmlwriter nginx \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && mkdir /run/nginx \
    && apk del tzdata \
    && rm -rf /var/cache/apk/* \
    && rm -rf /root/.cache \
    && rm -rf /tmp/*
WORKDIR /
CMD php-fpm7 && nginx && sh && exit
