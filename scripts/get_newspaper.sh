#!/bin/bash

if [[ -z $1 ]]
then 
    today_date=`date +"%d-%m-%Y"`
else
    today_date=$1
fi

dd=`echo $today_date | cut -d '-' -f1`
mm=`echo $today_date | cut -d '-' -f2`
yyyy=`echo $today_date | cut -d '-' -f3`

today_date_underscore=`echo $today_date | tr '-' '_'`

desired_response_code=200

mkdir ~/.local/bin/$today_date

for i in {01..50}
do
    url="https://asset.harnscloud.com/PublicationData/TOI/cap/$yyyy/$mm/$dd/Page/$today_date_underscore""_0$i""_cap.jpg"
    wget -nv -O ~/.local/bin/$today_date/$i.jpg $url
done

sxiv ~/.local/bin/$today_date/*

rm -rf ~/.local/bin/$today_date
