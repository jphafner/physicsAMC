#!/bin/bash


find ./${YEAR} -maxdepth 1 -type f -regex '.*ch[0-9][0-9]-mc.tex$' | while read file
do
    #\begin{question}{ch20-mc-Q01}
    #perl -pe 's/\bc\w+/ZAP/g' ${file}
    #\element{serway-mc}{
    #\begin{question}{ch01-mc-q01}
    echo "perl -pi.bak -e \"s/\{questionmult}\{ch(\d\d)-mc-q/{questionmult}{serway-ch\1-q/g\" ${file}"
          perl -pi.bak -e  "s/\{questionmult}\{ch(\d\d)-mc-q/{questionmult}{serway-ch\1-q/g" ${file}

    #echo "perl -pi.bak -e \"s/\{question}\{cpo-ch(\d\d)-Q/{question}{cpo-mc-ch\1-q/g\" ${file}"
    #      perl -pi.bak -e  "s/\{question}\{cpo-ch(\d\d)-Q/{question}{cpo-mc-ch\1-q/g" ${file}
    #echo "perl -pi.bak -e \"s/\{question}\{cpo-mc-ch(\d\d)-Q/{question}{cpo-mc-ch\1-q/g\" ${file}"
    #      perl -pi.bak -e  "s/\{question}\{cpo-mc-ch(\d\d)-Q/{question}{cpo-mc-ch\1-q/g" ${file}

done
