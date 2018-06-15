#!/bin/sh
# Replace the html content from www.ieslpod.com to telegram formatting text

for txt in "$@"
do
  if [ -f "$txt" ]; then
    tg=`echo "$txt"|sed -r 's/(.*)\.txt/\1.tg/g'`
    if ! [ -e "$tg" ]; then
      cat "$txt"|sed -r '1d; s/<br>//g; s/(.*)<strong>(.*)<\/strong>/\*\*\2\*\*/g; s/\*\s(.*)/__\1__/g; s/<\/.*>//g' > "$tg"
    fi
    xclip -sel clip "$tg"
    less -SN "$tg"
  else
    echo "$txt - not exist!"
  fi
done
#cat text/0001\ Introducing\ Yourself.txt|sed -r '1d; s/<br>//g; s/(.*)<strong>(.*)<\/strong>/\*\*\2\*\*/g; s/\*\s(.*)/__\1__/g; s/<\/.*>//g'|less -SN
