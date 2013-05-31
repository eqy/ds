#!/bin/sh

IFS=$'\n'

filepath='./files.txt'
folderpath='./folders.txt'

fileinfo="File list is written to $filepath"
folderinfo="Folder list is written to $folderpath"

echo -e "dirstalk v.0001\n$fileinfo\n$folderinfo"
 
echo "USAGE: dirstalk USER PATH"
files=$(find $2 -type f -user $1)
filecount=$(echo "$files" | wc -l)
folders=$(find $2 -type d -user $1)
foldercount=$(echo "$folders" | wc -l)
echo "found $filecount files owned by $1"
echo "found $foldercount folders owned by $1"

find $2 -type f -user $1 | xargs du -h > $filepath
find $2 -type d -user $1 | xargs du -sh > $folderpath
#du -h `$files`
#echo '' > $filepath
#for line in $files
#do 
#        echo -e $(du -h $line) >> $filepath
#done

#echo '' > $folderpath
#for line in $folders
#do 
#        echo -e $(du -sh --separate-dirs $line) >> $folderpath
#done

#echo $files > $filepath
#for line in $files
#do
#        echo $(du "$line") >> $filepath
#done

#echo `du -h "$folders"` > $folderpath

