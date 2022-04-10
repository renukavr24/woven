#!/bin/bash

# "$1" is the path of the mkdocs docs folder 

# produce tar.zip file command
docker run --rm -v $1:/mkdocs/my_project -i mkdocs-1.0 produce

# serve the application
docker run --rm -v $1:/mkdocs/my_project -p 8000:8000  -i mkdocs-1.0 serve