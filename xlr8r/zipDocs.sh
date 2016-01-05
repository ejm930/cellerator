#!/bin/bash
#
# 
# zipDocs-xlr8r.sh
#
# This script creates a zip archive of the xlr8r documentation
#
# revised 22 Oct 12 from xlr8rzip.sh
##
echo "*****************************************************************"
echo Creating a basic help file release for xCellerator ...
echo $(cat version.txt)-$(date +"Build-%y%m%d-%H%M")>tempver.txt
VERSION=$(cat tempver.txt)
echo Release version = $VERSION 
#
echo Creating temporary working directories ...
#
CWD=$PWD
echo current working directory is $CWD
#
# create a temporary working directory, and create a sub-directory
#
mkdir -v temporary-directory
mkdir -v temporary-directory/html
#
cp tempver.txt temporary-directory/creation-date.txt
#
# put everything else in the working directory
#
cp html/index.html temporary-directory/html
cp -r html/include temporary-directory/html
cp -r html/usersguide temporary-directory/html
cp -r html/examples temporary-directory/html
rm temporary-directory/html/examples/*.nb
rm -r temporary-directory/html/examples/Wuschel
cp -r html/docs temporary-directory/html
cp -r html/people temporary-directory/html
cp readme.html temporary-directory
#
#
# Rename and zip files
echo
echo Creating zip file ...
#
ARCHIVE=xCellerator-HTML-Docs-${VERSION}
mv temporary-directory $ARCHIVE
# 
ZIPFILE=${ARCHIVE}.zip
echo "Zip File --> $ZIPFILE"
echo zipping File ...
zip -rq $ZIPFILE ${ARCHIVE}/*
#
exit
