#!/bin/bash

# Krzysztof Glaz
# 2024-03-01
# Example: Check the remote host for a list of files and copy only from today.
# /backup_host2 - remote host directory
# /backup_local/backup_host2/ - directory on localhost

for new_file in $(ssh user@10.10.10.2 find /backup_host2/ -mtime -1 -type f)
do
        rsync -azv root@10.10.10.26:$new_file /backup_local/backup_host2/
done
