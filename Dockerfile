FROM mlaxwong/php-stack:7.4.0-xdebug

# ENV
ENV APP_DIR=app/
ENV PUBLIC_DIR=public/

# Brew
RUN apt-get update && \
    apt-get install build-essential curl file git ruby-full locales --no-install-recommends -y && \
    rm -rf /var/lib/apt/lists/*

RUN localedef -i en_US -f UTF-8 en_US.UTF-8

RUN useradd -m -s /bin/bash linuxbrew && \
    echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

USER root
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

# install act (https://github.com/nektos/act)
RUN brew install act

# App
WORKDIR /${APP_DIR}${PUBLIC_DIR}

RUN rm -rf /var/www/html
RUN ln -s /${APP_DIR}${PUBLIC_DIR} /var/www/html

# Permission
RUN chmod 755 /var/www/html