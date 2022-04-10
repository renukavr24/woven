# Project: Create a docker image to run Mkdocs and serve a website

The project takes the mkdocs inputs from local directory to serve a website.

# Prerequisites

Require Docker, Mkdocs inputs files, Shell

# Assumption

1. It is assumed that host system is windows.
2. Gitlab runner is shell based with docker cli intalled on an Ubuntu host.

# Steps to follow

1. Open powershell and navigate to the directory which has the docker file.

2. Build the docker file using below command-

	`docker build -t <image_name> .`
	
3. Run the below command by passing mkdocs docs folder path to produce the tar file. This tar.gz file will be created in the current directory-

	`docker run --rm -v {docs folder path}:/mkdocs/my_project -i <image_name> produce`
	
	EX: `docker run --rm -v ${PWD}/docs:/mkdocs/my_project -i myimage-1.0 produce`
	
4. Execute the below command along with the folder path that has tar.gz file-

	`docker run --rm -v {tar.gz folder path}:/mkdocs/my_project -p 8000:8000 -i <image_name> serve`
	
	EX: `docker run --rm -v ${PWD}/docs:/mkdocs/my_project -p 8000:8000 -i myimage-1.0 serve`

5. Open the http://localhost:8000 to access the mkdocs web page.

# Running from sh file

1. Open git bash prompt and pass the command - 

    `./mkdockerize.sh <docs directory path>`

    EX: `./scripts/mkdockerize.sh "/d/woven/docs"`