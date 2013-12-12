#!/bin/bash
echo -n "Enter URL to Project Gutenberg book in text format: "
# The URL should look something like this: http://www.gutenberg.org/files/28054/28054-0.txt
read inputURL

myURL="`wget -qO- $inputURL`"

# Swap out odd characters for normal ones and fix the linebreaks.
echo $myURL | iconv -f utf8 -t ascii//TRANSLIT | sed 's|\r|\n|g' | sed 's|\b\n||g' > /tmp/wgettrans.txt

# Snip the non-book bits from the head and the tail of the file.
cat /tmp/wgettrans.txt | sed -n '/\*\*\*/,$p' | sed '1d' | sed -n '/\*\*\*/q;p' > /tmp/wgettemp.txt

echo -n "Enter the name of this book: "
read bookNAME

split -dC 5450 -a 3 /tmp/wgettemp.txt $bookNAME
