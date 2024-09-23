#!/bin/bash

file="${HOME}/sync/recentf.mg"
name=$(cat "$file")   
buffers=$(echo "$name" | tr ' ' '\n' | tac | xargs)
#echo $buffers

#source ./recentf.sh
#recentf
mg ~/sync/daimler.mg ~/sync/wiki.mg $buffers $@

