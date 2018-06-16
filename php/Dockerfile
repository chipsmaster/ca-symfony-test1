FROM debian:stretch-slim
ARG WEB_USER_ID
ARG WEB_USER_GROUP_ID

# Base package install first so that it's in cache for next actions.
RUN apt update && apt install -y \
	php7.0 php7.0-fpm \
	php-xdebug \
        php7.0-gd \
        php7.0-mysql \
        php7.0-mcrypt \
        php7.0-bcmath \
        php7.0-curl \
        php7.0-mbstring \
        php7.0-xsl \
        php7.0-intl \
        php7.0-soap \
        php7.0-zip \
	mysql-client \
        less vim iputils-ping curl wget \
        && curl -sS https://getcomposer.org/installer | php \
        && mv composer.phar /usr/local/bin/composer

# Other installations
RUN wget 'https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64' -O /usr/local/bin/mhsendmail
RUN chmod a+x /usr/local/bin/mhsendmail

# Additional packages
# ...

# Create a user with uid and gid as provided
RUN groupadd --gid $WEB_USER_GROUP_ID web \
	&& useradd --uid $WEB_USER_ID --gid $WEB_USER_GROUP_ID --create-home web \
	&& mkdir /home/web/.composer && chown web.web /home/web/.composer

# PHP/FPM conf
RUN true \
	&& ln -s /etc/php/7.0/conf.d/additional-php.ini /etc/php/7.0/cli/conf.d/50-additional.ini \
	&& ln -s /etc/php/7.0/conf.d/additional-php.ini /etc/php/7.0/fpm/conf.d/50-additional.ini

COPY conf.additional /etc/php/7.0/fpm/
COPY additional-php.ini /etc/php/7.0/conf.d/


CMD [ "php-fpm7.0", "--fpm-config", "/etc/php/7.0/fpm/php-fpm.conf", "--nodaemonize" ]

