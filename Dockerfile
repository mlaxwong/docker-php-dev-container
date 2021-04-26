FROM mlaxwong/php-stack:7.4.0-xdebug

# App
WORKDIR /app

# Permission
RUN chmod 755 /var/www/html

# VSCode as Git editor 
RUN git config --global core.editor "code --wait"