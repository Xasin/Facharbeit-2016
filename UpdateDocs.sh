#!/bin/bash

targets=( "Technologien" "Quellen.bib" "3D_Zustand.tex" "Forschung.tex" "Auswirkungen.tex" "Einleitung.tex" "Facharbeit.tex" "Facharbeit.pdf" "Titelblatt.tex" "Schlusserklarung.tex" )

makeURLLists() {
	cd Facharbeit
	
	rm -f URLLIST
	rm -f NAMELIST
	
	echo "Generating webpage-lists!"
	
	# Generate NAMEs
	cat Facharbeit.bbl | grep "\field{title}" | tr '[ }]' '_' | cut -c 21- >> NAMELIST

	# Generate URLs
	cat Facharbeit.bbl | grep "\\verb " | cut -c 12- >> URLLIST
	
	cd ..
}

downloadWebs() {
	URLList=(`cat Facharbeit/URLLIST`)
	NAMEList=(`cat Facharbeit/NAMELIST`)

	rm -f URLLIST
	rm -f NAMELIST
	
	i=0
	for NAME in ${NAMEList[@]} ; do
		echo "Downloading $NAME now!"
		echo "URL: ${URLList[$i]}"
		wget -O DOCS/WEBSITEN/$NAME.html "${URLList[$i]}" -q
 		i=`expr $i + 1`
	done
}

copyContents() {
	for i in ${targets[@]} ; do
		echo "Copying $i now!"
		cp -r Facharbeit/$i DOCS/Facharbeit/
	done
}

genZip() {
	rm DOCS.zip
	zip -r DOCS.zip DOCS/*
}

if [[ $1 = "all" ]]; then
  makeURLLists
  downloadWebs
fi
copyContents
genZip
