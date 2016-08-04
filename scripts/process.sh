#!/bin/bash

## AMC parameters

# density of the scans (default 300)
density=300
# tolerance of the detection
# it can be a single real number or inf,sup for different ranges
tolerance=0.3,0.2
# proportion of each box to be considered thicked
proportion=0.15
# black and white convertion threshold (0 white, 1 black)
bwTrheshold=0.6
# whether copies where made (leave unset or false, otherwise it will be considered true)
copies=true
# whether to debug or not (leave unset or false, otherwise it will be considered true)
debug=true

# export format
exportFormat=ods

## My parameters
projectDir=/home/adin/MC-Projects/encuesta
scanFile=/home/adin/Downloads/2016-1/20160603204803394.pdf
listFile=list-files.txt
exportFile=$(basename $scanFile)
exportFile="${exportFile%.*}".$exportFormat
scansDir=scans
processDir=process

## Process
# create dirs
mkdir $scansDir
mkdir $processDir

# create list of files to process
echo $scanscanFile > $listFile

# extract pages
auto-multiple-choice getimages \
    --copy-to $scansDir \
    --vector-density $density \
    --list $listFile


# process images
ls -d -1 $scansDir/** > $listFile

# configs mutliple in case of copies
# if $copies then
#   multiple=--multiple
# fi
if [ -z ${copies+x} -o "$copies" = "false" ]; then 
	# $copies is unset
	multiple=''
	echo "Processing single values" 	
else 
	# $copies is set
	multiple=--multiple
    echo "Processing photocopies"
fi

if [ -z ${debug+x} -o "$debug" = "false" ]; then 
	# $debug is unset
	debugPar=
else
	# $debug is set
	debugFile=analyse.log
	debugPar="--debug $debugFile"
  	touch $debugFile
fi

auto-multiple-choice analyse \
    --data $projectDir/data \
    --cr $processDir \
    $multiple \
    --tol-marque $tolerance \
    --prop $proportion \
    --bw-threshold $bwTrheshold \
    --try-three \
    --pre-allocate 1 \
    --liste-fichiers $listFile \
    $debugPar 


# grade the scans
if [ -z ${debug+x} -o "$debug" = "false" ]; then 
	# $debug is unset
	debugPar=
else
	# $debug is set
	debugFile=note.log
	debugPar="--debug $debugFile"
    touch $debugFile
fi

# extract the grades first
auto-multiple-choice prepare \
    --mode b \
    --data $projectDir/data \
    --with pdflatex \
    $projectDir/encuesta.tex


# then do the grading
auto-multiple-choice note \
    --data $projectDir/data \
    --seuil $proportion \
    --notemin 0 \
    --notemax 10 \
    --grain 0.5 --arrondi n \
    --plafond \
    $debugPar

# export
if [ -z ${debug+x} -o "$debug" = "false" ]; then 
	# $debug is unset
	debugPar=
else
	# $debug is set
	debugFile=export.log
	debugPar="--debug $debugFile"
    touch $debugFile
fi

auto-multiple-choice export \
    --data $projectDir/data \
    --module $exportFormat \
    --o $exportFile \
    --useall 0 \
    $debugPar


