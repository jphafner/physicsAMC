#!/bin/bash


find ./${YEAR} -maxdepth 1 -type f -regex '.*bak$' | while read file
do
    #\begin{question}{ch20-mc-Q01}
    #perl -pe 's/\bc\w+/ZAP/g' ${file}
    #\element{serway-mc}{
    #\begin{question}{ch01-mc-q01}
    echo "mv ${file} ${file/%.bak/}"
          mv ${file} ${file/%.bak/}

done
