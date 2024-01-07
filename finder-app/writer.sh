#!/bin/sh

if [ $# -ne 2 ] 
then
   echo "Invalid parameters passed... writer.sh <writepath> <writestr>"
   exit 1
fi

export writefile=$1
export writestr=$2

if [ -d $writefile ]
then
   echo "$writefile is a directory.Please provide full path to file."
fi

echo $writestr > $writefile
if [ $? -ne 0 ]
then
  echo "Unable to create a file $writefile"
fi
