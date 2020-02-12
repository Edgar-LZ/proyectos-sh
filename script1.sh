#!/bin/bash

export FOLDERS="$PWD";

for I in {1..5}
do
	mkdir "$FOLDERS/FOLDER$I"
	export FOLDERS="$FOLDERS/FOLDER$I"
	chmod 776 $FOLDERS 
done

echo $FOLDERS
