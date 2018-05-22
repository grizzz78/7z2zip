#!/bin/sh
echo "" > log.txt
mkdir output
for i in *.7z
do
  zipname=`echo "${i}" | sed -e "s/\.7z/\.zip/g"`
  mkdir tmp
  cd tmp
  7za e "../${i}" >> ../log.txt
  zip -r "../output/${zipname}" . >> ../log.txt
  cd ..
  rm -r tmp
  echo "${i} -> ${zipname}"
done
