#!/bin/bash

function install_exercism()
{
if ! [[ -x "$(command -v exercism)" ]]; then
echo "installing exercism..." ;
sudo snap install exercism
echo "configuring exercism.."
echo "Enter your token:"
read token
exercism configure --token=$token
echo "+++++++++++++++++++++++++++++"
echo "installation completed"
echo "+++++++++++++++++++++++++++++"
else echo "exercism is already installed."
fi
}

function install_snap()
{
program=snap
if ! [[ -x "$(command -v $program)" ]];then
echo "installing $program..."
sudo apt install snapd
fi
}

function install_figlet()
{
program=figlet
if ! [ -x "$(command -v $program)" ];then
echo "installing $program..."
sudo apt-get install figlet
fi
}

function install_vim()
{
if ! [ -x "$(command -v vim)" ];then
echo "installing vim..."
sudo apt install vim
fi
}

function install_fzf()
{
if ! [ -x "$(command -v fzf)" ];then
echo "installing fzf..."
sudo apt install fzf
fi
}

#installing dependencies
install_snap
install_figlet
install_vim
install_fzf

#installing exercism
install_exercism
