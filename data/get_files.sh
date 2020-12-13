#!/bin/bash

# example usage
# source get_files.sh http://www.mso.anu.edu.au/\~jerjen/researchprojects/cepheids/cepheid_data/ 'fits'


wget $1

grep $2 index.html | awk '{print $5}' | grep -oP '"\K[^"\047]+(?=["\047])' | sed 's#^#'$1'#g' > downloadlist

rm index*

wget -i downloadlist
