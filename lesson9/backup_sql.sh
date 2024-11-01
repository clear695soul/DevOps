#! /bin/bash
echo "Start"
sudo  mysqldump -u mario -pAm3ric@ Homework > /opt/mysql_backup/dumpSQL_$(date +"%Y-%m-%d_%H:%M").sql
echo "ready"
