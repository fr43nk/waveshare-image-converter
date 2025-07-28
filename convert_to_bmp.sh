#!/bin/bash

SRC_PATH=$1
DEST_PATH=$2

if [ -z $SRC_PATH ] || [ ! -d $SRC_PATH ]; then
    echo "No src path given"
    exit -1
fi

if [ -z $DEST_PATH ] || [ ! -d $DEST_PATH ]; then
    echo "No dest path given"
    exit -1
fi

echo "Convert all jpg images in $SRC_PATH to 8bit BMP in $DEST_PATH"

ALL_FILES=`find $SRC_PATH -type f -maxdepth 1 -name "*.jpg" -o -name "*.JPG"`

for FILENAME in $ALL_FILES; do
    BASENAME=`basename "$FILENAME"|awk -F'.' '{print $1}'`
    DIRNAME=`dirname "$FILENAME"`
    echo "$FILENAME - $BASENAME - $DIRNAME"
    magick "$FILENAME" -resize 800  -gravity center -crop 800x480+0+0 +repage -dither FloydSteinberg -posterize 2 -depth 5,6,5 bmp3:$DEST_PATH/$BASENAME.bmp
done
