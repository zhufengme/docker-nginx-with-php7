#!/bin/bash
path_of_nginx_template="/templates/nginx"
nginx_conf_file="/etc/nginx/sites-enabled/default"

path_of_php_template="/templates/php"
php_cli_conf_file="/etc/php/7.0/fpm/conf.d/10-docker-ext.ini"
php_fpm_conf_file="/etc/php/7.0/cli/conf.d/10-docker-ext.ini"

echo "Appling setting..."

if [ $HTTPS ];
then
    echo "Great! This is a HTTPS site"
    file_content=`cat ${path_of_nginx_template}/default.https.template`
    echo "$file_content" > ${nginx_conf_file}
else
    echo "Oh, This is a HTTP site"
    file_content=`cat ${path_of_nginx_template}/default.http.template`
    echo "$file_content" > ${nginx_conf_file}
fi

if [ $DEV_MODE ];
then
    echo "Development mode on"
    file_content=`cat ${path_of_php_template}/dev.ini`
    echo "$file_content" > ${php_cli_conf_file}
    echo "$file_content" > ${php_fpm_conf_file}
else
    echo "Production mode on"
    file_content=`cat ${path_of_php_template}/prod.ini`
    echo "$file_content" > ${php_cli_conf_file}
    echo "$file_content" > ${php_fpm_conf_file}
fi

echo "Setting done,Startting Serives..."

/usr/bin/supervisord


