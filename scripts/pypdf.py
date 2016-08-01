#!/usr/bin/env python
import sys

#from pyPdf import PdfFileWriter, PdfFileReader
#input = PdfFileReader(sys.stdin)
#output = PdfFileWriter()
#for i in range(0,input.getNumPages()):
#    output.addPage(input.getPage(i).rotateClockwise(90 if i%2==0 else -90))
#output.write(sys.stdout)

from pyPdf import PdfFileWriter, PdfFileReader
output_pdf = PdfFileWriter()

with open(r'quiz-half.pdf', 'rb') as readfile:
    input_pdf = PdfFileReader(readfile)
    total_pages = input_pdf.getNumPages()
    for page in xrange(total_pages - 1, -1, -1):
        output_pdf.addPage(input_pdf.getPage(page))
    with open(r'output.pdf', "wb") as writefile:
        output_pdf.write(writefile)


