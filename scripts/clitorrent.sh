#!/bin/sh

PROXY_LIST_URL="https://piratebayproxy.net"
URL="$(curl -s $PROXY_LIST_URL | pup 'table td[align="left"] a text{}' | head -n 1)/search"
[ -n "$1" ] && query="$*" || read -p "Enter Search Query: " query
QUERY_URL="$(echo "$URL/$query" | sed 's/ /%20/g')"
echo "$QUERY_URL"

page="$(curl -s "$QUERY_URL")"

echo "$page" | pup -c 'div.detName a.detLink text{}' > temp1.txt
echo "$page" | pup -c 'tbody tr td:nth-of-type(2) font text{}' | grep '^Uploaded*' | cut -d, -f1,2 > temp2.txt
echo "$page" | pup -c 'tbody tr td[align="right"] text{}' | paste -d" " - - | awk '{print "S:" $1 ", L:" $2}' > temp3.txt
echo "$page" | pup -c 'tbody tr td:nth-of-type(2) a[title="Download this torrent using magnet"] attr{href}' | cut -d'&' -f1 > temp4.txt

SELECTION="$(paste temp1.txt temp2.txt temp3.txt | cat -n | fzf --with-nth 2.. | cut -f1 | sed 's/^[ \t]*//g')"
MAGNET="$(cat temp4.txt | sed -n "${SELECTION}p")"
echo "### Downloading magnet ${MAGNET} ###"
aria2c -d /media/kunal/HDD/TorrentDownloads --seed-time=1 "$MAGNET" > /dev/null 2>&1 &
rm temp*.txt
