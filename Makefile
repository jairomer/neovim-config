install:
	git submodule update --init --recursive \
		python -m pip install --user --upgrade pynvim && \
		python bundle/YouCompleteMe/install.py && \
	cd bundle/delimitMate/ && make all && make install

docker:
	docker build -t nvim ./docker --build-arg USER=`id -u` --build-arg GROUP=`id -g`
