#!/bin/bash
#
# 
# xlr8r2SBMLzip.sh
#  
echo $(cat version.txt)-$(date +"%d-%b-%Y-%H%M")>tempver.txt
#VERSION=$(cat version.txt)
VERSION=$(cat tempver.txt)
echo Release version = $VERSION
#
CWD=$PWD
echo current working directory is $CWD
#
mkdir -v temporary-directory
#
# Fix line feeds on Version.txt and place it to the working directory
#
cp -v tempver.txt temporary-directory/version.txt
set VERSION=`cat temporary-directory/version.txt`
echo Version is ${VERSION}
#
# put everything else in the working directory
#rm tempver.txt
#
cp xlr8r2SBML.nb temporary-directory
cp xlr8r2SBML.m temporary-directory
cp installation-instructions.txt temporary-directory
cp example.nb temporary-directory
cp example.xml temporary-directory
#
mv temporary-directory xlr8r2SBML-package-${VERSION}
#
echo zip -r xlr8r2SBML-package-${VERSION}.zip xlr8r2SBML-package-${VERSION}/*
zip -rq xlr8r2SBML-package-${VERSION}.zip xlr8r2SBML-package-${VERSION}/*
#
echo tar -cf xlr8r2SBML-package-${VERSION}.tar xlr8r2SBML-package-${VERSION}
tar -cf xlr8r2SBML-package-${VERSION}.tar xlr8r2SBML-package-${VERSION}
echo gzip --best xlr8r2SBML-package-${VERSION}.tar
gzip --best xlr8r2SBML-package-${VERSION}.tar
#
