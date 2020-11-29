FROM mlaxwong/php-stack:7.4.0-xdebug

# Envs
ENV APP_DIR=app/
ENV PUBLIC_DIR=public/

# App
WORKDIR /${APP_DIR}${PUBLIC_DIR}

RUN rm -rf /var/www/html
RUN ln -s /${APP_DIR}${PUBLIC_DIR} /var/www/html

# Permission
RUN chmod 755 /var/www/html