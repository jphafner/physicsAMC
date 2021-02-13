#!/bin/bash

<<<<<<< HEAD
if [ $# -eq 0 ]; then
    echo "  Bad argument ORDER"
    echo "  Syntax: $(basename $0) [n exam] [input pdf]"
    exit 1
fi
=======
#if [ $# -eq 0 ]; then
#    echo "  Bad argument ORDER"
#    echo "  Syntax: $(basename $0) [n exam] [input pdf]"
#    exit 1
#fi

function usage() {
    echo "Usage: $(basename $0) (-i input pdf) (-n num exam)";
    exit ${E_OPTERROR};
}
## : has a required argument
## :: has an optional argument
## Set default values??
options="n:i:r"
function parseargs() {
  while getopts ${options} opts; do
    case ${opts} in
      r)
        rm_tmp = true;;
      n)
        num = ${OPTARG};;
      i)
        input = ${OPTARG};;
      h)
        usage;; 
      \?)
        echo "Unknown option: -${OPTARG}" >&2
        usage;;
      *)
        echo "Invalid option: -${OPTARG}" 1>&2
        usage;;
      :)
        echo "Option -${OPTARG} requires an argument." 1>&2
        usage;;
    esac
  done
  ## Checks for required, multiple methods
  while getopts ${options} opts; do
    case "${opts}" in
        :) echo "${OPTARG} requires an argument"; exit 1;
    esac
  done
  if [ $OPTIND -eq 1 ]; then
      echo "No options were passed"
      usage
  fi
  for var in ${options[@]}; do
      if [[ -z ${var} ]]; then
          echo "Error: specific a value for ${var} with ${option[var]}"
          usage
      fi
  done
  if [ -z ${num} ]; then
      echo "[n exam] is a required argument"
      usage
  fi
}
>>>>>>> develop

## Examples
##  pdfjam --batch --nup 2x1 --suffix 2up --landscape --outfile . file1.pdf file2.pdf
##  pdfnup --batch --suffix 2up file1.pdf file2.pdf
##  pdfjam file1.pdf '{},2-' file2.pdf '10,3-6' --outfile ../myNewFile.pdf
##  gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=finished.pdf file1.pdf file2.pdf
##  pdfjam file1.pdf file2.pdf file3.pdf --no-landscape --frame true --nup 2x2 --suffix 4up --outfile ~/Documents
##  pdfjam 'my US letter file.pdf' --a4paper --outfile 'my A4 file.pdf'
##  pdfjam --nup 2x3 --frame true --noautoscale false --delta "0.2cm 0.3cm" --scale 0.95 myslides.pdf --outfile myhandout.pdf
##  pdfjam-slides3up --pagenumbering true --batch slides1.pdf slides2.pdf
##  pdfjam myfile.pdf --trim '1cm 2cm 1cm 2cm' --clip true --outfile /dev/stdout | pdfnup --frame true --outfile myoutput.pdf
##  pdfjam --twoside myfile.pdf --offset '1cm 0cm' --suffix 'offset'
##  file -Lb 'my PDF file'
##  pdfnup --checkfiles 'my PDF file'
##  pdfjam --landscape --doublepagestwistodd true my-landscape-document.pdf 

<<<<<<< HEAD
NEXAM=$( expr $1 - 1 )
INPUT=$2
 
if [ ! $(( ${1} % 2)) -eq 0 ]; then
    echo "NEXAM must be an even number"
    exit 1
fi

## Exams are assumed to be two pages
## There must be an even number of exams

for i in `seq 0 2 ${NEXAM}`; do
    echo $i
    ORDER+=$( expr 2 \* $i + 1 )'R '
    ORDER+=$( expr 2 \* $i + 3 )'R '
    ORDER+=$( expr 2 \* $i + 2 )'L '
    ORDER+=$( expr 2 \* $i + 4 )'L '
done

echo ${ORDER[@]}

## https://github.com/hellerbarde/stapler
## Usage: stapler [options] mode input.pdf ... [output.pdf]
echo "stapler cat ${INPUT} ${ORDER} temp.pdf"
      stapler cat ${INPUT} ${ORDER} temp.pdf

# pdfnup options: --pages, --paper, --orient, --trim, --delta,
#                 --offset, --scale and --openright, --frame

echo "pdfnup --nup 1x2 --papersize '{11in,8.5in}' --frame true temp.pdf"
      pdfnup --nup 1x2 --papersize '{11in,8.5in}' --frame true temp.pdf

echo "rm -f temp.pdf"
      rm -f temp.pdf

=======
function clean_tmp() {
  echo "rm -f temp.pdf"
        rm -f temp.pdf
}

function main() {
    parseargs()

    #NEXAM=$( expr ${num} - 1 )
    NEXAM=$( expr 20 - 1 )
    INPUT=$2

    if [ ! $(( ${num} % 2)) -eq 0 ]; then
        echo "NEXAM must be an even number"
        exit 1
    fi

    ## Exams are assumed to be two pages
    ## There must be an even number of exams

    for i in $(seq 0 2 ${NEXAM}); do
        echo $i
        ORDER+=$( expr 2 \* $i + 1 )'R '
        ORDER+=$( expr 2 \* $i + 3 )'R '
        ORDER+=$( expr 2 \* $i + 2 )'L '
        ORDER+=$( expr 2 \* $i + 4 )'L '
    done

    echo ${ORDER[@]}

    ## https://github.com/hellerbarde/stapler
    ## Usage: stapler [options] mode input.pdf ... [output.pdf]
    echo "stapler cat ${INPUT} ${ORDER} temp.pdf"
          stapler cat ${INPUT} ${ORDER} temp.pdf

    # pdfnup options: --pages, --paper, --orient, --trim, --delta,
    #                 --offset, --scale and --openright, --frame

    echo "pdfnup --nup 1x2 --papersize '{11in,8.5in}' --frame true temp.pdf"
          pdfnup --nup 1x2 --papersize '{11in,8.5in}' --frame true temp.pdf

    if [ ${rm_tmp} ]; then
        clean_tmp()
    fi
}

main()
exit $?
>>>>>>> develop

