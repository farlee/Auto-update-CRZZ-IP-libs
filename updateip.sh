#!/bin/bash
path='/home/harry/Desktop/tmp/'
#php_file=$path"updateipfile.php"
cd $path
wget -q http://update.cz88.net/ip/copywrite.rar
wget -q http://update.cz88.net/ip/qqwry.rar
/usr/bin/php -q updateipfile.php
rm -f copywrite.rar
rm -f qqwry.rar
