# PHP Development Container

PHP Development Container for VSCode

| ENV Name | Default Value | Description |
| -- | -- | -- |
| `APP_ROOT` | `app/` | App directory in docker container |
| `APACHE_DOCUMENT_ROOT` | `app/public/` | App public directory |


## Run on docker

``` bash
docker run --rm -it -v ${PWD}:/app/public/ -p 8080:80 php-apache-dev-container
```

App will server on `http://localhost:8080`.

## User in docker-compose.yml

``` yml
version: '3.8'

services:
  php:
    container_name: vscode-php-apache-dev-container
    images: php-apache-dev-container
    ports:
      - "8080:80"
    volumes:
      - .:/app:delegated
    depends_on:
```