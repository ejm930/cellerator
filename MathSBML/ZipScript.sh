#!/bin/bash
#
# 
# MathZipHere
#  
echo "*****************************************************************"
echo Creating a file release for MathSBML ...

#echo $(cat VERSION.txt)-$(date +"%d-%b-%Y-%H%M")>tempver.txt
echo $(cat VERSION.txt)-$(date +"%H%M")>tempver.txt
VERSION=$(cat tempver.txt)
echo Release version = $VERSION
#
echo Creating temporary working directories ...
#
CWD=$PWD
#
echo Working Directory is $CWD
TEMP=MathSBML-$(cat tempver.txt)
INSTALL=$TEMP/install
DOC=$TEMP/doc
PLUGINS=$TEMP/plugins
#
mkdir $TEMP
cp -pv tempver.txt $TEMP/creation-date.txt
mkdir $INSTALL
mkdir $DOC
mkdir $PLUGINS
#
cp -pv MathSBML.m    $INSTALL
cp -pv MathSBML.nb   $INSTALL
cp -pv MathSBML-*.nb $INSTALL
cp -pv MathSBML-*.m  $INSTALL 
#
cp -pvr plugins/*    $PLUGINS
rm -vr $PLUGINS/*/.svn
#
cp -pr ../mathsbml-webpage/* $DOC
cp -pv README.nb $DOC
cp -pv README.pdf $DOC
#
cp -pv *.txt $TEMP
rm $TEMP/tempver.txt
#cp -pv gpl.txt $
#cp -pv NEWS.txt  $TEMP
#cp -pv Version-Compatibility.txt $TEMP
#tr '\015' '\012' < VERSION.txt > $TEMP/VERSION.txt
#cp -pv install.txt $TEMP
#cp -pv how-to-report-a-bug.txt $TEMP
cp -pv installer.nb $TEMP
#
echo zipping ...
zip -rq ${TEMP}.zip ${TEMP}/*
#
rm tempver.txt

echo $(pwd)/${TEMP}.zip > ../latestversion
#
exit
#
