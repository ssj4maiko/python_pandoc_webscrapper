#!/bin/bash
for file in html/*.html; do
    filename=${file##*/}
    filename=${filename%%.*}
    echo "$filename"
    ./pandoc.sh "$filename"
done