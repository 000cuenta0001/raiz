#!/bin/bash

now=$(date +'%d/%m/%Y %R')
echo ${now} Inicia el proceso. > /storage/scripts4/upgrade.log

FILE_DIR="/storage/scripts4"
URL="https://codeload.github.com/000cuenta0001/raiz/zip/master" 

SIZE=$(curl -sI $URL | grep Content-Length | cut -d ' ' -f 2)

echo El fichero de git pesa: $SIZE >> /storage/scripts4/upgrade4.log

SIZE_2=$(ls -la $FILE_DIR/raiz.zip.old | awk '{ print $5}')


echo El fichero local pesa: $SIZE_2 >> /storage/scripts4/upgrade4.log


 if [ $SIZE -ne $SIZE_2 ]; then

  echo Nos traemos el fichero >> /storage/scripts4/upgrade4.log
  curl -o ${FILE_DIR}/raiz.zip $URL

  echo Unzip del fichero >> /storage/scripts4/upgrade4.log
  unzip -o ${FILE_DIR}/raiz.zip raiz-master/* -d ${FILE_DIR} > /dev/null

  echo copia el plugin >> /storage/scripts4/upgrade4.log
  cp -rf ${FILE_DIR}/raiz-master/* /storage/.kodi/ > /dev/null
  echo Unzip del fichero 

  echo renombra zip origen >> /storage/scripts4/upgrade4.log
  mv $FILE_DIR/raiz.zip $FILE_DIR/raiz.zip.old

  echo borramos directorio descomprimido >> updgrade4.log
  rm -rf ${FILE_DIR}/raiz-master
 fi

now=$(date +'%d/%m/%Y %R')
echo ${now}  proceso acabado >> /storage/scripts4/upgrade4.log
cat /storage/scripts4/upgrade4.log
