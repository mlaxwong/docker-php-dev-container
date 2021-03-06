FROM mlaxwong/php-stack:8.0.0-xdebug

# App
WORKDIR /app

# Permission
RUN chmod 755 /app

# VSCode as Git editor 
RUN git config --global core.editor "code --wait"