#!/bin/bash
#
# Creates file release archives for xSSAlite
# 
# ZipHere
#  
echo "*****************************************************************"
echo Creating a file release for xSSAlite ...
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
cp -v tempver.txt temporary-directory/temp/version.txt
rm tempver.txt
#
#
mkdir temporary-directory/temp/source
mkdir temporary-directory/temp/install
cp -pv xSSAlite.nb temporary-directory/temp/source
cp -pv Build-xSSAlite-Palette.nb  temporary-directory/temp/source
cp -pv Examples.nb temporary-directory/temp/source
cp -pv xSSAlite-Palette.nb temporary-directory/temp/install
cp -pv xSSAlite.m temporary-directory/temp/install
#
cp -pv gpl.txt temporary-directory/temp
cp -pv license.txt temporary-directory/temp
cp -pvr html temporary-directory/temp
#
cp -pvr html temporary-directory/temp
#
#cp -pv doc/CelleratorML-Description.pdf temporary-directory/temp
#
cd temporary-directory
echo 
echo creating archives ..
ARCHIVE=xSSAlite-${VERSION}
mv temp $ARCHIVE
#
ZIPFILE=${ARCHIVE}.zip
echo "Zip File --> $ZIPFILE .."
zip -rq $ZIPFILE ${ARCHIVE}/*
mv -v $ZIPFILE ../$ZIPFILE
#
#TARFILE=${ARCHIVE}.tar
#echo "Tarball --> $TARFILE.gz .."
#tar -cf $TARFILE $ARCHIVE
#gzip --best $TARFILE
#mv -v $TARFILE.gz ../$TARFILE.gz
#
#mv $ARCHIVE ../$ARCHIVE
#
cd $CWD
rm -r temporary-directory
pwd
exit
