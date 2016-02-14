#!/bin/bash

targets=( "Technologien" "Quellen.bib" "3D_Zustand.tex" "Forschung.tex" "Auswirkungen.tex" "Einleitung.tex" "Facharbeit.tex" "Facharbeit.pdf" "Titelblatt.tex" "Schlusserklarung.tex" )

for i in ${targets[@]} ; do
	echo "Copying $i now!"
	cp -r Facharbeit/$i DOCS/Facharbeit/
done

rm DOCS.zip
zip -r DOCS.zip DOCS/*

