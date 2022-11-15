# PDFTricks
## Poster-print large 1:1 output

Use `pdfposter`.  Here's what works well on my home setup:

```
  $ pdfposter -s 1.032 -m 8x10in input.pdf output.pdf
```

The `-s 1.032` gives actual 1:1 on my Epson.  Also the `-m 8x10` prevents the printer from cutting off the margins.

## Print a bunch of files scaled to fit a page

Forgive my poor bash skills!

See script:  http://edf.bu.edu/svn/edf/Eric/tools/PDF/lpr-fit-pdf.sh

```
#!/bin/bash
#
# print a PDF file resized to one page with pdfjam
#
for fn in "$@"
do
    echo "processing $fn"
    tmp1=$(mktemp /tmp/lpr-fit.XXXXXX.pdf)
    tmp2=$(mktemp /tmp/lpr-fit.XXXXXX.pdf)
    /usr/bin/pdfcrop --margins 50 $fn $tmp1
    /usr/bin/pdfjam --outfile $tmp2 --paper letter $tmp1
    lpr $tmp2
    rm -f $tmp1
    rm -f $tmp2
done
```

## Resize page to fit paper

```
  pdfjam --outfile out.pdf --paper letter input.pdf
```

## Add margins to pages

```
  pdfcrop --margins "100 100 100 100" input.pdf
```

(units are pt or 1/72 in)

## Make thumbnail from first page

```
  convert -density 300 -resize %10 -background white \
  -alpha remove -bordercolor black -border 1 \
  ./ATL-COM-DAQ-2016-028.pdf[0] thumb.png
```

Apparently "![0]" selects the first page.
