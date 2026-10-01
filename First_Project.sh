#!/bin/bash

#$Version:001$
#$Thu Oct  1 21:28:42 IST 2026$

#Variables

BASE=/Users/afzalkhan/backup
#DAYS FOR DELETION
DAYS=10
DEPTH=1
RUN=0

#Check if directory is present or not

if [ ! -d $BASE ]
then
	echo"directory is not available: $BASE"
	exit 1
fi

#check if arcive folder is present or not

if [ ! -d $BASE/archive ]
then
	mkdir $BASE/archive
fi

#Find the files larger than 1 GB

for i in `find $BASE -maxdepth $DEPTH -type f -size +20M`
do
	if [ $RUN -eq 0 ]
	then
		echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive"
		gzip $i || exit 1
		mv $i.gz $BASE/archive || exit 1
	fi

done