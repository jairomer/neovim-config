FROM alpine:latest

ARG GCC_VERSION=10.2.0
ARG HOME=/home/vimusr

RUN addgroup -S vimgrp && adduser -S vimusr -G vimgrp
WORKDIR $HOME
RUN apk update && apk add --no-cache cmake make vim python3-dev git build-base g++ go npm openjdk11
RUN mkdir $HOME/workspace
RUN git clone https://github.com/jairomer/neovim-config.git $HOME/.vim
RUN cd $HOME/.vim && git submodule update --init --recursive
RUN python3 $HOME/.vim/bundle/YouCompleteMe/install.py --all
USER vimusr
ENTRYPOINT ["vim", "-u .vim/init.vim"]
