# DocumentConversion
## Convert from Google Docs to LaTeX

 * Install pandoc (sudo apt install pandoc)
 * Download document as HTML from Google

```
   $ pandoc -t latex -s -o output.tex input.html
```

This works pretty well.  Images are handled reasonably.  Tables (e.g. pasted google spreadsheet bits) are not handled at all; have to take care of those by hand.
