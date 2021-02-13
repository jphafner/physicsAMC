#!/bin/bash

## Check for unsorted questions in main file
## Compare master file names to category files

for file in `ls ./gfx/*pdf | xargs -n1 basename`; do
    count=0
    for tex in `ls ./*tex | xargs -n1 basename`; do
        if grep -q "${file%.pdf}" ${tex}; then
            #echo "${file%.pdf} in ${tex}"
            count=$(( $count + 1))
            break
        fi
    done
    if [ $count -eq 0 ]; then
        echo "not found ${file%.pdf}"
    fi
done

