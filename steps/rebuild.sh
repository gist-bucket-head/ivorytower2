#!/bin/sh
rm -rf README.md
for filename in s*.md; do
	#If you want to show the filenames above each section, do the following 2 lines:
	#echo "${filename}"
	#echo "==="
	cat "${filename}"
	echo
	echo
done > README.md
more README.md
