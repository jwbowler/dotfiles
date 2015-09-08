# Get zsh
sudo apt-get install zsh

# Setup ohmyzsh
sh ~/.dotfiles/setup/ohmyz.sh

# Add .*rc symlinks to home directory
touch ~/.sources
rm -rf ~/.zshrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/vimrc ~/.vimrc

# Get Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Vundle packages in vimrc
vim -c "VundleInstall" .zshrc

