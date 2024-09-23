#!/bin/bash

if [ "$HOSTNAME" = cmtcdeu55025274 ]; then
	file="${HOME}/sync/recentf.mg"
	name=$(cat "$file")   
	buffers=$(echo "$name" | tr ' ' '\n' | tac | xargs)
	#echo $buffers
	#source ./recentf.sh
	#recentf
fi

mg ~/sync/daimler.mg ~/sync/wiki.mg $buffers $@


