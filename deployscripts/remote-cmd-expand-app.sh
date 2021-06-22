#!/bin/bash

source ~/.bash_profile

WORK_DIR=/home/web/web
BACKUP_DIR=/home/web/web_backup

BACKUP_JAR=${WORK_DIR}/topcoder.jar.bak
# BACKUP_JAR1=${WORK_DIR}/tc_cache.jar.bak

if [ ! -e ${BACKUP_DIR}/topcoder.jar ]; then
  echo "[FATAL] ${BACKUP_DIR}/topcoder.jar not found.."
  exit 1;
fi
# if [ ! -e ${BACKUP_DIR}/tc_cache.jar ]; then
#   echo "[FATAL] ${BACKUP_DIR}/tc_cache.jar not found.."
#   exit 1;
# fi

#
# Backup and deploy JAR
#
echo "Cleaning deployment folder ${WORK_DIR}/topcoder.jar --> $BACKUP_JAR"
if [ -e $BACKUP_JAR ]; then
  rm -rf $BACKUP_JAR
fi


# echo "Making backup ${WORK_DIR}/tc_cache.jar --> $BACKUP_JAR"
# if [ -e $BACKUP_JAR1 ]; then
#   rm -rf $BACKUP_JAR1
# fi

echo "Copying topcoder.jar"
cp -rf ${BACKUP_DIR}/topcoder.jar $WORK_DIR/
# cp -rf ${BACKUP_DIR}/tc_cache.jar $WORK_DIR/
# cp -rf ${BACKUP_DIR}/lib.zip $WORK_DIR/
#cp -rf ${BACKUP_DIR}/resources.zip $WORK_DIR/

pushd $WORK_DIR
# unzip -o lib.zip
# unzip -o resources.zip
jar xvf topcoder.jar
# mkdir -p lib/jars/tcs/tc_cache/1.0.0/
# cp -rf tc_cache.jar lib/jars/tcs/tc_cache/1.0.0/

popd

