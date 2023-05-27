#!/bin/sh

for ITEM in *;
do
    du -h "$ITEM" | tail -n 1
done
