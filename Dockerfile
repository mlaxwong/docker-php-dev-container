FROM mlaxwong/php-stack:7.4.0-xdebug

# ENV
ENV APP_DIR=app/
ENV PUBLIC_DIR=public/

# Docker
RUN apt-get update && \
    apt-get upgrade -y

RUN sudo apt -y install docker.io

# ACT
RUN curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# App
WORKDIR /${APP_DIR}${PUBLIC_DIR}

RUN rm -rf /var/www/html
RUN ln -s /${APP_DIR}${PUBLIC_DIR} /var/www/html

# Permission
RUN chmod 755 /var/www/html

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*