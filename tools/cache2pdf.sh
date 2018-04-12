#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Usage: $0 <path_to_cache> <output.pdf>"
    exit 1
fi

PNG_FILES=`ls $1/*.png`

for i in $PNG_FILES
do
  convert $i `sed "s/png/pdf/g" <<< "$i"`
done

PDF_FILES=`ls $1/*.pdf`

pdftk $PDF_FILES cat output $2
