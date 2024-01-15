#!/bin/sh
ps -e | fzf | awk '{ print $1 }' | xargs -r kill -9
