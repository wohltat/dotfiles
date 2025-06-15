FROM manjarolinux/base:latest

RUN pacman -Syy --noconfirm yay git neovim yazi zsh tmux stow eza fzf fd ripgrep fortune-mod lolcat gcc bat
COPY /.dotfiles/omz/.oh-my-zsh /root/.oh-my-zsh
COPY /.dotfiles/ /root/.dotfiles

# Replace root's shell with /bin/bash
RUN sed -i 's|^root:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*$|root:x:0:0:root:/root:/bin/zsh|' /etc/passwd

# Colors for yay and pacman
RUN sed -i "s|^#Color$|Color|" /etc/pacman.conf 

WORKDIR /root/.dotfiles
RUN stow zsh && stow bash && stow yazi && stow tmux && stow nvim

# sync nvim first time
RUN nvim --headless "+Lazy! sync" +qa
# run for some time to finish remaining treesitter install steps (workaround)
RUN tmux new-session -s nvim_first_install -d 'nvim' && sleep 15 && tmux kill-session -t nvim_first_install

# make nvim symlinks
RUN ln -s /usr/bin/nvim /usr/bin/vi 
RUN ln -s /usr/bin/nvim /usr/bin/vim


# RUN useradd -m username && \
#     passwd -d username && \
#     echo "username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
#
# USER username
# WORKDIR /home/username

