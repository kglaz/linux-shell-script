#!/bin/bash

# Krzysztof Glaz

# 1. Script running on root account
# 2. WWW service user: www-data
# 3. Install WP-CLI. WP-CLI is the command-line for WordPress (wp)
# 4. Add to cron, run every day


# check the path ($DIR_WEB) to the root directory of your site
DIR_WEB=/var/www/web_page
DATA_TODAY=`date +%Y%m%d`
DIR_BACKUP=$DIR_WEB/sql_backup

# create directory "sql_backup" in $DIR_WEB
mkdir -p $DIR_BACKUP

# database copy using wp-cli (wp command)
su - www-data -s /bin/bash -c "wp --path=$DIR_WEB db export $DIR_BACKUP/sql_backup-$DATA_TODAY.sql"

# delete sql files older than 30 days
find $DIR_BACKUP -type f -name "*.sql" -mtime +30 | while read line; do rm $line; done

