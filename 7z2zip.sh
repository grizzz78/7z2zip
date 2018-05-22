#!/bin/sh
echo "" > log.txt
mkdir output
for i in *.7z
do
  zipname=`echo "${i}" | sed -e "s/\.7z/\.zip/g"`
  mkdir tmp
  cd tmp
  printf "${i} ... decompress "
  7za e "../${i}" >> ../log.txt
  printf "... compress to zip ... "
  zip -r "../output/${zipname}" . >> ../log.txt
  cd ..
  rm -fr tmp
  printf "ok\r\n";
done
printf "All files written to directory output\r\n"
