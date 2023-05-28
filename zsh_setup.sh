#!/bin/sh

# Install git
sudo apt install git

# Install zsh
sudo apt install zsh tmux exa neovim

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins: autosuggestions & syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Update zshrc
cat ${PWD}/.zshrc > ~/.zshrc

# Add prompts.txt
cp ${PWD}/prompts.txt ~/prompts.txt
