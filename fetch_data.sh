#!/bin/bash
rm -rf data
rm data.zip
rm ./html/*.pdf
rm -rf ./tex

file="./html/index.html"
today=$(date +%F)
# Use sed to replace any existing content between the span tags
sed -i -E "s!(<span id=\"update-span\">)[^<]*(</span>)!\1${today}\2!" "$file"
echo "Updated $file with date $today"

curl -LO emt-project.github.io/emt-static/data.zip
unzip data
rm data.zip


