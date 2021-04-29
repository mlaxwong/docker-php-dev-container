FROM mlaxwong/php-dev-container:7.4.0.0

# ENV
ENV APP_ROOT=/app
ENV APACHE_DOCUMENT_ROOT=/app/public

# App
WORKDIR ${APP_ROOT}

# Change Apache Document Root
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Permission
RUN chmod -R 755 ${APP_ROOT}
RUN chown -R www-data:www-data ${APP_ROOT} \
    && a2enmod rewrite

# VSCode as Git editor 
RUN git config --global core.editor "code --wait"