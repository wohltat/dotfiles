stow zsh
stow tmux
stow yazi
stow kitty

stow nvim
nvim --headless "+Lazy! sync" +qa

# recomended manual install:
# bat - cat alternative with syntax highlighting, for yazi preview
# ouch - for compressed archive preview and unpacking
# eza - better replacement for ls
# fzf - fuzzy finder, for ctrl+r command search and more
# fd - better find alternative
# rg - ripgrep, grep alternative
# gcc - might be necessary for nvim/treesitter
#
# neovim-symlinks # removes vi
# stow omz
#
# necessary:
# stow
# node
# kitty
# autokey-gtk  # wayland has to be disabled, e.g. in /etc/gdm/custom.conf
# extra/ttf-hack-nerd # or some other nerd font for symbols in nvim 
#
# [oh-my-zsh] plugin 'zsh-syntax-highlighting' not found
# [oh-my-zsh] plugin 'zsh-autosuggestions' not found
# [oh-my-zsh] plugin 'lxd-completion-zsh' not found
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
