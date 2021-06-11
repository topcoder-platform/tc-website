#!/bin/bash

BACKUP_DIR=/home/web/web_backup
TARGET_JAR=${BACKUP_DIR}/topcoder.jar
BACKUP_JAR=${TARGET_JAR}.bak
# TARGET_JAR1=${BACKUP_DIR}/tc_cache.jar
# BACKUP_JAR1=${TARGET_JAR1}.bak

# app
echo [Taking backup of existing topcoder.jar]
if [ -e $BACKUP_JAR ]; then
  rm -rf $BACKUP_JAR
fi
if [ -e $TARGET_JAR ]; then
  mv $TARGET_JAR $BACKUP_JAR
fi

# echo [Taking backup of existing tc_cache.jar]
# if [ -e $BACKUP_JAR1 ]; then
#   rm -rf $BACKUP_JAR1
# fi
# if [ -e $TARGET_JAR1 ]; then
#   mv $TARGET_JAR1 $BACKUP_JAR1
# fi
