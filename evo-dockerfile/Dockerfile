FROM php:7.4-cli
MAINTAINER barkbork

# Create app directory
RUN mkdir /app
WORKDIR /app

# Install missing dependencies
RUN apt-get update && apt-get install -y unzip git libpng-dev zlib1g-dev libcurl4-gnutls-dev

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Install PHP extensions
RUN docker-php-ext-install gd curl mysqli pdo_mysql

# Install Trackmania Server
RUN curl -o /app/tm.zip http://files.v04.maniaplanet.com/server/TrackmaniaServer_Latest.zip && unzip -q tm.zip  && rm tm.zip

# Install EvoSC
RUN git clone https://github.com/EvoTM/EvoSC.git /app/EvoSC && mv /app/EvoSC/* /app/
RUN composer install

# Copy start.sh
COPY start.sh /app/start.sh

# Set the script as the entrypoint
ENTRYPOINT ["/bin/bash", "start.sh"]
