#!/bin/zsh

cd ~

# Update and upgrade linux packages
printf "\n---------------------------------"
printf "\nUpdate and upgrade linux packages"
printf "\n----------------------------------\n\n"
sleep 3
sudo apt update
sudo apt upgrade

# Install zsh and oh-my-zsh
printf "\n--------------------"
printf "\nInstall oh-my-zsh"
printf "\n--------------------\n\n"
sleep 3
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy useful configuration files
printf "\n------------------------"
printf "\nCopy configuration files"
printf "\n------------------------\n\n"
sleep 3
cp -v config/files/.aliases .
cp -v config/files/.ls_colors .
cp -v config/files/.vimrc .
cp -v config/files/.myvimrc .

# Update .zshrc file
printf "\n------------------"
printf "\nUpdate .zshrc file"
printf "\n------------------\n\n"
sleep 3
echo "source $HOME/.aliases" >> .zshrc
echo "export LS_COLORS=\"$LS_COLORS:ow=36:\"" >> .zshrc
source ./.zshrc

printf "Done !\n\n"

# Copy atom configuration
