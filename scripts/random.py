#!/usr/bin/python

import sys
import random

from pyPdf import PdfFileWriter, PdfFileReader

# read input pdf and instantiate output pdf
output = PdfFileWriter()
input1 = PdfFileReader(file(sys.argv[1],"rb"))

# construct and shuffle page number list
pages = list(range(input1.getNumPages()))
random.shuffle(pages)

# display new sequence
print 'Reordering pages according to sequence:'
print pages

# add the new sequence of pages to output pdf
for page in pages:
    output.addPage(input1.getPage(page))

# write the output pdf to file
outputStream = file(sys.argv[1]+'-mixed.pdf','wb')
output.write(outputStream)
outputStream.close()

