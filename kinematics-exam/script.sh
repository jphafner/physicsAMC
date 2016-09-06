#!/bin/bash

##$ sudo dnf install $( cat *.dep | sed -n 's/package{\w*}{\(\w\)}/texlive-\1/p' | paste -sd ' ' - )

#cat source-exam.dep | sed -n 's#{package}{[a-zA-Z]+}{\([a-zA-Z]+\)}#texlive-\1#p' 
#cat sample-exam.dep | sed -n 's#{package}{[a-zA-Z]+}{([a-zA-Z]+)}#texlive-#p' 
#cat sample-exam.dep | sed -n 's#{package}{[^}]+}#texlive-#p' 
#cat sample-exam.dep | sed -n 's#{package}{\w^}]}#texlive-#p' 
cat sample-exam.dep | sed -n 's#[^\*]*\*{package}{\([a-zA-Z]*\)}.*#texlive-\1#p' 

