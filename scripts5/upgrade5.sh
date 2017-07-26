#!/bin/bash

now=$(date +'%d/%m/%Y %R')
echo ${now} Inicia el proceso. > /storage/scripts/upgrade.log

FILE_DIR="/storage/scripts5"
URL="https://codeload.github.com/000cuenta0001/carpetaconcreta/zip/master" 

SIZE=$(curl -sI $URL | grep Content-Length | cut -d ' ' -f 2)

echo El fichero de git pesa: $SIZE >> /storage/scripts5/upgrade5.log

SIZE_2=$(ls -la $FILE_DIR/carpetaconcreta.zip.old | awk '{ print $5}')


echo El fichero local pesa: $SIZE_2 >> /storage/scripts5/upgrade5.log


 if [ $SIZE -ne $SIZE_2 ]; then

  echo Nos traemos el fichero >> /storage/scripts5/upgrade5.log
  curl -o ${FILE_DIR}/carpetaconcreta.zip $URL

  echo Unzip del fichero >> /storage/scripts/upgrade5.log
  unzip -o ${FILE_DIR}/carpetaconcreta.zip carpetaconcreta-master/* -d ${FILE_DIR} > /dev/null

  echo copia el plugin >> /storage/scripts5/upgrade5.log
  cp -rf ${FILE_DIR}/carpetaconcreta-master/* /storage/ > /dev/null
  echo Unzip del fichero 

  echo renombra zip origen >> /storage/scripts5/upgrade5.log
  mv $FILE_DIR/carpetaconcreta.zip $FILE_DIR/carpetaconcreta.zip.old

  echo borramos directorio descomprimido >> updgrade5.log
  rm -rf ${FILE_DIR}/carpetaconcreta-master
 fi

now=$(date +'%d/%m/%Y %R')
echo ${now}  proceso acabado >> /storage/scripts5/upgrade5.log
cat /storage/scripts5/upgrade5.log
