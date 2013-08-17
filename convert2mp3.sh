#!/bin/bash

cd $1

for f in *.mp4
do
  name=`echo "$f" | sed -e "s/.mp4$//g"`
  ffmpeg -i "$f" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "$name.mp3"
done`

#The better way to encode MP3 is to use -q:a for variable bit rate.
#ffmpeg -i k.mp4 -q:a 0 -map a k.mp3
#The q option can only be used with libmp3lame and corresponds to the LAME -V option. See:


