#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

if [ $(id -u ) -eq 0 ]; then 
    echo "${RED}Please do not run this script as sudo${NC}"
    exit
fi

if [ -z "$HOME" ]; then
    echo "${RED}HOME variable not set. Aborting${NC}"
    exit
fi

if ! command -v wget >/dev/null 2>&1; then
    echo "${RED}wget is not installed. Pleas install wget and rerun this script${NC}"
    exit
fi


if [ -f "${HOME}/.zshrc" ]; then
    echo "${YELLOW}.zshrc already exist. Renaming the current .zshrc to .zshrc_old${NC}"
    mv "${HOME}/.zshrc" "${HOME}/.zshrc_old"
fi

wget -O ${HOME}/.zshrc https://raw.githubusercontent.com/bauerbene/Configurations/master/zsh/.zshrc

echo "${YELLOW}Please insert sudo password to install zsh and zplug${NC}"
sudo apt update && sudo apt install zsh zplug -y

echo "${YELLOW}Please insert user password to set zsh as default shell${NC}"
chsh -s /bin/zsh

echo "${GREEN}Finished zsh setup. If there are no errors above, you can start using zsh.${NC}"