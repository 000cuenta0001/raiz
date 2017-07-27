#!/bin/bash

now=$(date +'%d/%m/%Y %R')
echo ${now} Inicia el proceso. > /storage/scripts2/upgrade2.log

FILE_DIR="/storage/scripts2"
URL="https://codeload.github.com/000cuenta0001/cosasnuevas/zip/master" 

SIZE=$(curl -sI $URL | grep Content-Length | cut -d ' ' -f 2)

echo El fichero de git pesa: $SIZE >> /storage/scripts2/upgrade2.log

SIZE_2=$(ls -la $FILE_DIR/cosasnuevas.zip.old | awk '{ print $5}')


echo El fichero local pesa: $SIZE_2 >> /storage/scripts2/upgrade2.log


 if [ $SIZE -ne $SIZE_2 ]; then

  echo Nos traemos el fichero >> /storage/scripts2/upgrade2.log
  curl -o ${FILE_DIR}/cosasnuevas.zip $URL

  echo Unzip del fichero >> /storage/scripts2/upgrade2.log
  unzip -o ${FILE_DIR}/cosasnuevas.zip cosasnuevas-master/* -d ${FILE_DIR} > /dev/null

  echo copia el plugin >> /storage/scripts2/upgrade2.log
  cp -rf ${FILE_DIR}/cosasnuevas-master/* /storage/.kodi/ > /dev/null
  echo Unzip del fichero 

  echo renombra zip origen >> /storage/scripts2/upgrade2.log
  mv $FILE_DIR/cosasnuevas.zip $FILE_DIR/cosasnuevas.zip.old

  echo borramos directorio descomprimido >> updgrade2.log
  rm -rf ${FILE_DIR}/cosasnuevas-master
 fi

now=$(date +'%d/%m/%Y %R')
echo ${now}  proceso acabado >> /storage/scripts2/upgrade2.log
cat /storage/scripts2/upgrade2.log
