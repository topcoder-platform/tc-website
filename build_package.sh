#!/bin/bash
#Preparing paackage
ENV=$1
if [ -z $ENV ];
then
 echo "The script need to be executed with version ex:build-package.sh ENV"
 exit 1
fi

VER=`date "+%Y%m%d%H%M"`
SCRIPTDIR="./deployscripts"

BUILD_VARIABLE_FILE_NAME="./buildvar.conf"
source $BUILD_VARIABLE_FILE_NAME
AWS_CD_PACKAGE_NAME="${APPNAME}-${PACKAGETYPE}-${VER}.zip"
PACAKAGE_LOCATION="dist-${PACKAGETYPE}"
rm -rf $PACAKAGE_LOCATION
mkdir $PACAKAGE_LOCATION
cp -rvf $SCRIPTDIR/* $PACAKAGE_LOCATION/
cp topcoder.jar $PACAKAGE_LOCATION/
cp tc_cache.jar $PACAKAGE_LOCATION/
cp appspec.yml $PACAKAGE_LOCATION/appspec.yml
zip -j $AWS_CD_PACKAGE_NAME $PACAKAGE_LOCATION/*


VER1=$VER
echo export VER="$VER1" >> "$BASH_ENV"
