#!/bin/sh

fileCount ()
{
 dir1=$1
 for filename in ${$dir1)/*
 do
     echo "$filename"
     if [ -d "$filename" ]
     then
         fileCount $filename
     else
         filenum=$((filenum+1))
         lineCount $filename
     fi
 done 
}
###################

lineCount ()
{
  filepath=$1
  while read line
  do
    if [ $line == *"$searchstr"* ]
    then
        linenum=$((linenum+1))
    fi
  done<$filepath

}

##################
##MAIN##

if [ $# -ne 2 ] 
then
   echo "INvalid parameters passes... sh finder.sh <dirpath> <searchstr>"
   exit 1
fi
export filesdir=$1
export searchstr=$2
export filenum=0
export linenum=0
if [ -d "$filesdir" ]
then
    echo "$filesdir is present"
else
    exit 1
fi

fileCount $filesdir
echo "The number of files are $filenum and the number of matching lines are $linenum" 
