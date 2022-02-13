FROM debian:10
ARG USER=user
ARG GROUP=user
RUN apt-get update
RUN apt-get install -y wget build-essential git cmake libfuse-dev fuse3
RUN echo deb http://http.us.debian.org/debian/ testing non-free contrib main >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python3 python3-pip

RUN addgroup -gid $GROUP user \
    && adduser --disabled-password --gecos '' --uid $USER --gid $GROUP user

RUN wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage \
    && chmod u+x nvim.appimage \
    && chown $USER nvim.appimage \
    && mv nvim.appimage /usr/bin/vim

RUN mkdir -p /home/$USER/.config/
RUN chown -R $USER /home/$USER
USER $USER
RUN git clone https://github.com/jairomer/neovim-config.git /home/$USER/.config/nvim && \
  cd /home/$USER/.config/nvim && \
  git submodule update --init --recursive && \
  python3 -m pip install --user --upgrade pynvim && \
  python3 bundle/YouCompleteMe/install.py
RUN mkdir /home/$USER/Workspace \
      && chown $USER /home/$USER/Workspace
WORKDIR /home/$USER/Workspace
