FROM docker.io/archlinux/archlinux

RUN pacman --noconfirm -Sy nvim tmux git base-devel 

RUN git clone https://aur.archlinux.org/yay-bin.git && \
    cd yay-bin && \
    env EUID=1 makepkg -si --noconfirm && \
    cd .. && rm -Rf yay-bin

RUN yay --noconfirm -Sy fernflower fd fzy nerd-fonts

COPY . /root/.config/nvim
COPY bashrc /root/.bashrc

COPY init.lua /root/.config/nvim/init.lua

WORKDIR /root/workspace
CMD bash 
