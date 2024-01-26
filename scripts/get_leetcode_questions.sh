#!/bin/sh

URL="https://gist.github.com/priyavrat-misra/a776a005ee4a68edda535f4a7e1b6adb"

DATA="$(curl $URL | pup 'article details' | grep -v '>$' | cut -c 4-)"
mkdir -p "./temp"

echo "$DATA" | while IFS= read -r LINE; do
    case $LINE in
        [0-9]*)
            echo "$LINE" >> "./temp/$CATEGORY".txt
            ;;
        *)
            CATEGORY=$LINE
            ;;
    esac
done

TOPIC="$(ls "./temp" | cut -d'.' -f1 | fzf)"

if [ -z "$TOPIC" ]; then
    rm -rf "./temp"
    exit
fi

QUESTION="$(cat "./temp/$TOPIC.txt" | fzf | cut -d'.' -f2 | cut -c 2-)"

if [ -z "$QUESTION" ]; then
    rm -rf "./temp"
    exit
fi

LEETCODE_URL="https://leetcode.com/problems/"$QUESTION"/description"
PROBLEM_URL="$(echo $LEETCODE_URL | sed 's/ /-/g')"

x-www-browser $PROBLEM_URL

rm -rf "./temp"
