#!/bin/bash
file="./html/index.html"
today=$(date +%F)
# Use sed to replace any existing content between the span tags
sed -i -E "s!(<span id=\"update-span\">)[^<]*(</span>)!\1${today}\2!" "$file"
echo "Updated $file with date $today"

