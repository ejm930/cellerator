#!/bin/bash
#
# 
# xlr8rzip.sh
# revised 19 Jan 11 to include revised set of plugins and updated palettes
# revised 5 Feb 07 to work on Linux under bash
#
# creates a version tarball tagged with the date and time created
#
echo "*****************************************************************"
echo Creating a file release for xCellerator ...
#
echo $(cat version.txt)-$(date +"%d-%b-%Y-%H%M")>tempver.txt
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
mkdir -v temporary-directory/source
mkdir -v temporary-directory/install
mkdir -v temporary-directory/plugins
mkdir -v temporary-directory/doc
#
cp tempver.txt temporary-directory/creation-date.txt
#
# put everything else in the working directory
#
echo
echo Copying informational files ...
echo
cp -v *.txt temporary-directory
cp -v tempver.txt temporary-directory/version.txt
rm tempver.txt
cp -v README temporary-directory
cp -v installer.nb temporary-directory

#
echo
echo Copying application files ...
echo
cp -v xlr8r.nb temporary-directory/source
cp -v xlr8r.m  temporary-directory/install
#echo
echo Copying palette files ...
echo
#
cp -v BuildNewPalettes.nb temporary-directory/source
cp -v xCelleratorPalette.nb temporary-directory/install
cp -v xCelleratorCascadePalette.nb temporary-directory/install

mkdir temporary-directory/MathSBML/
mkdir temporary-directory/MathSBML/source
mkdir temporary-directory/MathSBML/install
#
cp -v ../MathSBML/Math*.nb temporary-directory/MathSBML/source
cp -v ../MathSBML/Math*.m temporary-directory/MathSBML/install

#
##
#
# install plugins if they exist
echo
echo Copying Plugins ...
echo
#
#
#
# ---- kMech
#
cp -v ../kmech/kMech.m temporary-directory/plugins
cp -v ../kmech/kMech.nb temporary-directory/source
#
# ---- cellzilla
#
cp -v ../cellzilla/Cellzilla2D.m temporary-directory/plugins
cp -v ../cellzilla/Cellzilla2D.nb temporary-directory/source
#
# ---- xssa
cp -v ../xSSAlite/xSSAlite.m temporary-directory/plugins
cp -v ../xSSAlite/xSSAlite.nb temporary-directory/source
cp -v ../xSSAlite/Build-xSSAlite-Palette.nb temporary-directory/source
cp -v ../xSSAlite/xSSAlite-Palette.nb temporary-directory/plugins
#
# ---- sbml
cp -v ../SBML2xlr8r/SBML2xlr8r.m temporary-directory/plugins
cp -v ../SBML2xlr8r/SBML2xlr8r.nb temporary-directory/source
cp -v ../xlr8r2sbml/xlr8r2SBML.m temporary-directory/plugins
cp -v ../xlr8r2sbml/xlr8r2SBML.nb temporary-directory/source


#cp -v $HOME/.Mathematica/Applications/xlr8r2SBML.m temporary-directory/plugins
#
# ---- CelleratorML
cp -v ../CelleratorML/CelleratorML.m temporary-directory/plugins
cp -v ../CelleratorML/CelleratorML.nb temporary-directory/source
#
#cp -v about-the-plugins.txt temporary-directory/plugins
#
# copy in documentation
#
#
echo 
echo Copying documentation for xlr8r ...
#
#cp -v help.nb temporary-directory/doc
#
#cp -r ../xlr8rweb/usersguide temporary-directory/doc
#
#
# Rename and zip files
echo
echo Creating Archives ...
#
ARCHIVE=xCellerator-${VERSION}
mv temporary-directory $ARCHIVE
# 
ZIPFILE=${ARCHIVE}.zip
echo "Zip File --> $ZIPFILE"
echo zipping File ...
zip -rq $ZIPFILE ${ARCHIVE}/*
#
#
#TARFILE=${ARCHIVE}.tar
#echo "Tarball --> $TARFILE.gz"
#tar -cf $TARFILE $ARCHIVE
#gzip --best $TARFILE
#
rm -r $ARCHIVE
exit
