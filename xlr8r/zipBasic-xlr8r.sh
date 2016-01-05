#!/bin/bash
#
# 
# zipBasic-xlr8r.sh
#
# This script creates a zip archive of a basic xlr8r install
# It includes basic mathsbml, ssa, and kMech plugins, as well
# as the standard xCellerator palettes, but it does not
# include any source code (.nb) or documentation.
#
# revised 15 Oct 12 for launchpad file release
# revised 19 Jan 11 to include revised set of plugins and updated palettes
# revised 5 Feb 07 to work on under bash
##
echo "*****************************************************************"
echo Creating a basic file release for xCellerator ...
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
mkdir -v temporary-directory/applications
mkdir -v temporary-directory/palettes
#
cp tempver.txt temporary-directory/creation-date.txt
#
# put everything else in the working directory
#
echo
echo Copying informational files ...
echo
cp -v license.txt temporary-directory
cp -v gpl.txt temporary-directory
cp -v Basic-README temporary-directory/README
#
cp -v basic-installer.nb temporary-directory
#
#
echo
echo Copying application files ...
echo
cp -v xlr8r.m  temporary-directory/applications
cp -v ../kmech/kMech.m temporary-directory/applications
cp -v ../MathSBML/*.m temporary-directory/applications
cp -v ../xSSAlite/xSSAlite.m temporary-directory/applications
#
cp -v xCelleratorPalette.nb temporary-directory/palettes
cp -v xCelleratorCascadePalette.nb temporary-directory/palettes
#
cp -v ../xSSAlite/xSSAlite-Palette.nb temporary-directory/palettes
#
# Rename and zip files
echo
echo Creating zip file ...
#
ARCHIVE=xCellerator-Basic-${VERSION}
mv temporary-directory $ARCHIVE
# 
ZIPFILE=${ARCHIVE}.zip
echo "Zip File --> $ZIPFILE"
echo zipping File ...
zip -rq $ZIPFILE ${ARCHIVE}/*
#
exit
