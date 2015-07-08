#!/bin/sh

# Xdebug configuration
if [ $APPLICATION_ENV = "Development" ]
then
    if ! grep -Fxq "xdebug.enable" /etc/php5/conf.d/xdebug.ini
    then
        config="
           xdebug.enable=Off
           xdebug.remote_host=localhost
           xdebug.remote_port=9000
           xdebug.remote_handler=dbgp
        ";
        echo $config >> /etc/php5/conf.d/xdebug.ini;
    fi;
    sed -i "s/_enable=Off/_enable=On/g" /etc/php5/conf.d/xdebug.ini;
    sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf;
fi;

# initialize
service apache2 restart
tail -f /var/log/apache2/error.log
