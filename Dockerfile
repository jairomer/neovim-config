FROM alpine:3.13

ARG GCC_VERSION=10.2.0
ARG HOME=/home/vimusr
RUN addgroup -S vimgrp && adduser -S vimusr -G vimgrp
WORKDIR $HOME
RUN apk update && apk add --no-cache cmake make python3-dev git build-base g++ go npm openjdk11 vim
USER vimusr
RUN git clone https://github.com/jairomer/neovim-config.git $HOME/.vim
RUN cd $HOME/.vim && git submodule update --init --recursive
RUN python3 $HOME/.vim/bundle/YouCompleteMe/install.py --all
RUN mkdir $HOME/workspace
VOLUME $HOME/workspace
RUN cd $HOME/workspace
ENTRYPOINT ["vim"]
