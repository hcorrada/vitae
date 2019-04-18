#!/usr/bin/env bash

./bin/vitae formats/short.md
./bin/vitae formats/lyterati.md
cp output/short.pdf ${HOME}/Documents/UMDCS/tenure/HCB-shortCV.pdf
cp output/lyterati.pdf ${HOME}/Documents/UMDCS/tenure/HCB-longCV.pdf
