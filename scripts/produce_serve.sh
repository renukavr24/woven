#!/bin/bash

# build and tar zip the given mkdocs docs folder
produce() {
	
	# goto the docs folder 
	cd /mkdocs/my_project
	
	# build the docs folder
	mkdocs build &> /dev/null
	cd ..
	
	# zip the docs folder into result.tar.gz
	tar -czvf /mkdocs/my_project/result.tar.gz -C "/mkdocs/my_project" .
}

# unzip the tar.gz file and serve the webpage
serve() {
	
	# create a folder named contents
	mkdir contents
	
	#unzip the tar.gz file and move it to contents folder
	tar -xzvf /mkdocs/my_project/result.tar.gz -C contents
	
	# navigate to contents folder and call mkdocs serve
	cd contents
	mkdocs serve "--dev-addr=0.0.0.0:8000"
}

# produce or serve command passed from the prompt 
$1