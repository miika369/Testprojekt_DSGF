# Testprojekt_DSGF

## Overview

This project focuses on the automation and documentation of purchasing processess within the "Swag Labs" online shop using the Robot Framework.

## Tech Stack

Following tools and technologies are used for the implementation
- Python & Robot Framework (Selenium)
- Visual Studio Code
- Geckodriver
- MySQL
- Docker
- Git

# Installation and configuration

## [Visual Studio Code](https://code.visualstudio.com/Download)

Install the extension "RobotCode"

## [Python](https://www.python.org/downloads/windows/)

Install the required libraries by running the following command in your VSC terminal:

```bash
pip install robotframework robotframework-seleniumlibrary mysql-connector-python
```

## [Geckodriver](https://github.com/mozilla/geckodriver/releases)

Extract the .exe file and add the folder path to your systems PATH variable.

## [Docker](https://www.docker.com/products/docker-desktop/)

To set your own credentials create a ".env" file and structure it like this:

```plaintext
DB_ROOT_PASSWORD=your_root_password
DB_NAME=swag_labs_db
DB_USER=tester
DB_PASSWORD=your_password
```

Create the docker-compose.yml and set it up as follows:

```yaml
version: '3.8'

services:
    database:
        image: mysql:latest
        container_name: swag_labs_db
        restart: always
        environment:
            MYSQL_ROOT_PASSWORD: ${DB_ROOT_PASSWORD}
            MYSQL_DATABASE: ${DB_NAME}
            MYSQL_USER: ${DB_USER}
            MYSQL_PASSWORD: ${DB_PASSWORD}
        ports:
            - "3306:3306"
    
    phpmyadmin:
        image: phpmyadmin:latest
        container_name: swag_labs_phpmyadmin
        restart: always
        ports:
            - "8080:80"
        environment:
            PMA_HOST: database
            MYSQL_ROOT_PASSWORD: ${DB_ROOT_PASSWORD}
```
Run your environment using:

```bash
docker-compose up -d
```