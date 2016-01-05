#!/bin/bash
#
# Creates file release archives for CelleratorML
# 
# CelleratorMLZIp
#  
echo "*****************************************************************"
echo Creating a file release for CelleratorML ...
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
cp -pv CelleratorML.nb temporary-directory/temp/
cp -pv CelleratorML.m temporary-directory/temp/
cp -pv CelleratorML-Description.pdf temporary-directory/temp/
cp -pv example.xml temporary-directory/temp/
cp -pv Sample-Latex-Output.tex temporary-directory/temp/
cp -pv README.txt temporary-directory/temp/
cp -pv news.txt temporary-directory/temp/
#
#
cd temporary-directory
echo 
echo creating archives ..
ARCHIVE=CelleratorML-${VERSION}
mv temp $ARCHIVE
#
ZIPFILE=${ARCHIVE}.zip
echo "Zip File --> $ZIPFILE .."
zip -rq $ZIPFILE ${ARCHIVE}/*
mv -v $ZIPFILE ../$ZIPFILE
#
TARFILE=${ARCHIVE}.tar
echo "Tarball --> $TARFILE.gz .."
tar -cf $TARFILE $ARCHIVE
gzip --best $TARFILE
mv -v $TARFILE.gz ../$TARFILE.gz
#
mv $ARCHIVE ../$ARCHIVE
#
cd $CWD
rm -r temporary-directory
pwd
exit
