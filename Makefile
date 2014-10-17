.PHONY: build run

build:
	sudo docker build --rm=true -t mazelab/ftp .

run:
	sudo docker run -t -i -p 21:21 --rm=true --name ftp mazelab/ftp /bin/bash