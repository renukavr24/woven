FROM python:3.8

# install mkdocs python module
RUN pip install mkdocs

# create mkdocs folder
RUN mkdir /mkdocs
WORKDIR /mkdocs

# copy the produce_serve.sh file to docker
COPY ./scripts/produce_serve.sh /mkdocs/scripts/produce_serve.sh

# MkDocs by default listens port 8000
EXPOSE 8000

# default entrypoint
ENTRYPOINT ["/mkdocs/scripts/produce_serve.sh"]