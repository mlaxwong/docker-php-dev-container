FROM mlaxwong/php-stack:8.0.7-app-dev

# ENV
ENV DEVTOOL_LOCALPACKAGE_PATH /localpackages
ENV APP_ROOT /app
ENV APACHE_DOCUMENT_ROOT /app/public

# Volume
VOLUME /root/.gitconfig
VOLUME ${APP_ROOT}
VOLUME ${DEVTOOL_LOCALPACKAGE_PATH}

# VSCode as Git editor 
RUN git config --global core.editor "code --wait"