FROM alpine:3.7
RUN apk add --no-cache cmake build-essential vim-nox python3-dev git
RUN rm $HOME/.vim && git clone https://github.com/jairomer/neovim-config.git $HOME/.vim
RUN cd $HOME/.vim && git submodule update --init --recursive
RUN python3 bundle/YouCompleteMe/install.py --all
ENTRYPOINT ["vim"]
