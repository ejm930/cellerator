#!/bin/csh
#
# 
# SBML2xlr8rzip.sh
#  
set CWD=`pwd`;
echo current working directory is ${CWD}
#
# create a temporary working directory, and create a sub-directory
#
mkdir temporary-directory
#
# Fix line feeds on Version.txt and place it to the working directory
#
tr '\015' '\012' < VERSION.txt > temporary-directory/VERSION.txt
#
set VERSION=`cat temporary-directory/VERSION.txt`
echo Version is ${VERSION}
#
# put everything else in the working directory
#
tr '\015' '\012' < COPYING.txt > temporary-directory/COPYING.txt
tr '\015' '\012' < COPYING.html > temporary-directory/COPYING.html
#tr '\015' '\012' < news.txt > temporary-directory/news.txt
#
cp SBML2xlr8r.nb temporary-directory
cp SBML2xlr8r.m temporary-directory
cp example.nb temporary-directory
cp BIOMD0000000005.xml temporary-directory
#
cp installation-instructions.txt temporary-directory
#
mv temporary-directory SBML2xlr8r-package-${VERSION}
#
echo zip -r SBML2xlr8r-package-${VERSION}.zip SBML2xlr8r-package-${VERSION}/*
zip -rq SBML2xlr8r-package-${VERSION}.zip SBML2xlr8r-package-${VERSION}/*
#
echo tar -cf SBML2xlr8r-package-${VERSION}.tar SBML2xlr8r-package-${VERSION}
tar -cf SBML2xlr8r-package-${VERSION}.tar SBML2xlr8r-package-${VERSION}
echo gzip --best SBML2xlr8r-package-${VERSION}.tar
gzip --best SBML2xlr8r-package-${VERSION}.tar
#