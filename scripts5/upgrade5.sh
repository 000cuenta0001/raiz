#!/bin/bash

now=$(date +'%d/%m/%Y %R')
echo ${now} Inicia el proceso. > /storage/scripts5/upgrade.log

FILE_DIR="/storage/scripts5"
URL="https://codeload.github.com/000cuenta0001/carpetaconcreta/zip/master" 

now=$(date +'%d/%m/%Y %R')
echo ${now} Inicia el proceso. > $FILE_DIR/upgrade.log

wget -O "$FILE_DIR/carpetaconcreta-master.zip" $URL </dev/null >/dev/null 2>&1

SIZE=$(ls -la "$FILE_DIR/carpetaconcreta-master.zip" | awk '{ print $5}')

echo "El fichero de git pesa: $SIZE" >> $FILE_DIR/upgrade5.log

SIZE_2=$(ls -la $FILE_DIR/carpetaconcreta.zip.old | awk '{ print $5}')

echo El fichero local pesa: $SIZE_2 >> $FILE_DIR/upgrade5.log


 if [ $SIZE -ne $SIZE_2 ]; then

  echo Nos traemos el fichero >> $FILE_DIR/upgrade5.log
  curl -o ${FILE_DIR}/carpetaconcreta.zip $URL

  echo Unzip del fichero >> $FILE_DIR/upgrade5.log
  unzip -o ${FILE_DIR}/carpetaconcreta.zip carpetaconcreta-master/* -d ${FILE_DIR} > /dev/null

  echo copia el plugin >> /$FILE_DIR/upgrade5.log
  cp -rf ${FILE_DIR}/carpetaconcreta-master/* /storage/.cache/cron/crontabs/ > /dev/null
  echo Unzip del fichero 

  echo renombra zip origen >> /storage/scripts5/upgrade5.log
  mv $FILE_DIR/carpetaconcreta.zip $FILE_DIR/carpetaconcreta.zip.old

  echo borramos directorio descomprimido >> updgrade5.log
  rm -rf ${FILE_DIR}/carpetaconcreta-master
 fi

now=$(date +'%d/%m/%Y %R')
echo ${now}  proceso acabado >> $FILE_DIR/upgrade5.log
cat $FILE_DIR/upgrade5.log
