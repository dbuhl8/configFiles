!/bin/bash
#install zsh and OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#install vim-plug
git clone https://github.com/junegunn/vim-plug.git ~/.vim/autoload/
cp ~/.vim/autoload/vim-plug/plug.vim ~/.vim/autoload/
#install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
