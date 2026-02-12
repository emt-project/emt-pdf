#!/bin/bash

cd tex 

echo "Processing collection PDF..."
xelatex -interaction=nonstopmode tmp.tex
xelatex -interaction=nonstopmode tmp.tex
mv tmp.pdf ../html/emt.pdf

counter=0
for texfile in *.tex; do
    if [ "$texfile" != "tmp.tex" ]; then
        ((counter++))
        if [ $counter -gt 20 ]; then
            echo "Reached 20 files, stopping..."
            break
        fi
        echo "Processing $texfile..."
        basename=$(basename "$texfile" .tex)
        xelatex -interaction=nonstopmode "$texfile"
        xelatex -interaction=nonstopmode "$texfile"
        
        if [ -f "${basename}.pdf" ]; then
            mv "${basename}.pdf" "../html/"
        fi
    fi
done

rm *.aux *.log *.out *.tex
rm  *.idx *.ilg *.ind
# rm tmp.*