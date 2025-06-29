build:
	docker build . -t ide 

run:
	docker run -it --volume .:/root/workspace:rw ide
