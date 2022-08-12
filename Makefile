install:
	wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage \
		&& chmod u+x nvim.appimage \
		&& sudo mv nvim.appimage /usr/bin/vim
	git clone https://github.com/jairomer/neovim-config.git $HOME/.config/nvim && \
		cd $HOME/.config/nvim && \
		git submodule update --init --recursive
	cd $HOME/.config/nvim && \
		python3 -m pip install --user --upgrade pynvim && \
		python bundle/YouCompleteMe/install.py && \
	cd bundle/delimitMate/ && \
	make all && make install && \
	cd ../..


docker:
	docker build -t nvim ./docker --build-arg USER=`id -u` --build-arg GROUP=`id -g`

run: 
	docker run -it \
            --rm \
            --name ovim \
            --cap-add SYS_ADMIN \
            --device /dev/fuse \
            -v `pwd`:/home/`id -u`/Workspace:rw,shared,consistent \
            --user `id -u` \
            nvim:latest vim
