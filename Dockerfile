FROM orsolin/docker-php-5.3-apache  
RUN apt-get update && apt-get install vim -y && apt-get install -y libbz2-dev
RUN apt-get install -y libgmp-dev re2c libmhash-dev libmcrypt-dev file
RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/
COPY ./fixed-docker-php-ext-enable /usr/local/bin/docker-php-ext-enable
RUN docker-php-ext-configure gmp 
RUN docker-php-ext-install bcmath bz2 calendar exif gettext pcntl shmop sockets zip gmp mcrypt
