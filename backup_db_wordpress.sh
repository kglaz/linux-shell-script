#!/bin/bash

# Add to cron. For example, you can run a backup at 5pm every day
# 0 17 * * * /root/bin/backup_db_from_webpowiat.sh

# Install WP-CLI. WP-CLI is the command-line for WordPress

# Create directory "sql_backup" in $DIR_WEB

DATA_TODAY=`date +%Y%m%d`
DIR_WEB=/var/www/DIRECTORY_PAGE
DIR_BACKUP=/var/www/DIRECTORY_PAGE/sql_backup


# backup database 
su - www-data -s /bin/bash -c "wp --path=$DIR_WEB db export $DIR_BACKUP/sql_backup-$DATA_TODAY.sql"



