#!/bin/bash

#for month in "Jan" "June"; do
for month in "June"; do
    #for year in {1996..1997..1}; do
    for year in {1996..1996..1}; do
        #for num in {01..50..1}; do
        for num in {50..100..1}; do
            echo "$month$year-Q$num"
            grep $month$year-Q$num *.tex
            if ! grep -q $month$year-Q$num *.tex; then
                echo "missing $month$year-Q$num"
            fi
        done
    done
done

#for file in `ls ./gfx/*pdf | xargs -n1 basename`; do
#    count=0
#    for tex in `ls ./*tex | xargs -n1 basename`; do
#        if grep -q "${file%.pdf}" ${tex}; then
#            #echo "${file%.pdf} in ${tex}"
#            count=$(( $count + 1))
#            break
#        fi
#    done
#    if [ $count -eq 0 ]; then
#        echo "not found ${file%.pdf}"
#    fi
#done
