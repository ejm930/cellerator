#!/bin/bash
#
# Creates file release archives for Cellzilla2D
# 
# Cellzilla2D-zip.sh
#  
echo "*****************************************************************"
echo Creating a file release for Cellzilla2D ...
#
echo $(cat VERSION.txt)-$(date +"%d-%b-%Y-%H%M")>tempver.txt
VERSION=$(cat tempver.txt)
echo Release version = $VERSION
#
CWD=$PWD
echo current working directory is $CWD
#
echo
echo Creating temporary working directories ...
echo
#
# create a temporary working directory, and create a sub-directory
#
mkdir -v temporary-directory
mkdir -v temporary-directory/temp
#
#
#set VERSION=`cat temporary-directory/temp/VERSION.txt`
#echo Version is ${VERSION}
#
# put everything else in the working directory
#
echo
echo Adding basic files ...
echo
cp -v tempver.txt temporary-directory/version.txt
cp -v tempver.txt temporary-directory/temp/File-Version-Information.txt
rm tempver.txt
#
#
cp -pv Cellzilla2D.nb temporary-directory/temp
cp -pv installer.nb temporary-directory/temp
cp -pv install.html temporary-directory/temp
cp -pv Cellzilla2D.m temporary-directory/temp
cp -pv VERSION.txt temporary-directory/temp
cp -pv license.txt temporary-directory/temp
cp -pv gpl.txt temporary-directory/temp
cp -pvr html temporary-directory/temp
rm temporary-directory/temp/html/examples/*.nb
#
# cp -pv nstallation-instructions.txt temporary-directory
#
cd temporary-directory
mkdir ./temp/html/bakups/
mv ./temp/html/*.html~  ./temp/html/bakups
rm -r ./temp/html/bakups/
#
echo 
echo creating archives ..
ARCHIVE=Cellzilla2D-${VERSION}
mv temp $ARCHIVE
#
ZIPFILE=${ARCHIVE}.zip
echo "Zip File --> $ZIPFILE .."
zip -rq $ZIPFILE ${ARCHIVE}/*
mv -v $ZIPFILE ../$ZIPFILE
mv -v $ARCHIVE ..
cd ..
rm -r temporary-directory
exit
