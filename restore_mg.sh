#!/bin/bash

file="/home/cditzel/sync/recentf.mg"
name=$(cat "$file")   
buffers=$(echo "$name" | tr ' ' '\n' | tac | xargs)
#echo $buffers

#source ./recentf.sh
#recentf
mg $buffers ~/sync/daimler.mg ~/sync//wiki.mg $@

