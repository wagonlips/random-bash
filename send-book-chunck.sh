#!/bin/bash
# Count the number of chunks in the directory.
CHUNKS=`ls /home/sean/Documents/text-blobs/the-brothers-karamazov/ | wc -l`
# Load the current iteration number.
VALUE=`cat /home/sean/Documents/text-blobs/iter-number`
# Because the chunks are numbered starting with 000, add 1 so it sounds right.
CHUNKNUMBER=$(($VALUE + 1))
# Use the plural noun until only one chunk remains.
if [ `expr $CHUNKS - $CHUNKNUMBER` == 1 ] 
then
  CHUNKPLURAL="chunk"
else
  CHUNKPLURAL="chunks"
fi
# Put the chunk into a variable.
STORY=`cat /home/sean/Documents/text-blobs/the-brothers-karamazov/brothers-$VALUE`
# Assemble everything into an email and send it along with the python command to load the chunk for easy copy an pasting.
EMAIL="sean@seancamden.com"
SUBJECTLINE="BOOKCHUNK: The Brothers Karamazov $VALUE | `expr $CHUNKS - $CHUNKNUMBER` $CHUNKPLURAL left."
mail -s "$SUBJECTLINE" "$EMAIL" << MESSAGE
with open(r"/home/sean/Documents/text-blobs/the-brothers-karamazov/brothers-$VALUE") as infile:
data = infile.read()
myblob = TextBlob(data)

$STORY
MESSAGE
# Increment the iteration number.
let "VALUE += 1"
echo $(printf "%03d" $VALUE) > /home/sean/Documents/text-blobs/iter-number
