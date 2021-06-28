#!/bin/sh

get_platform() {
  case "$(uname -s)" in
  Linux*) platform=Linux ;;
  Darwin*) platform=Mac ;;
  CYGWIN*) platform=Cygwin ;;
  MINGW*) platform=MinGw ;;
  *) platform="UNKNOWN:${unameOut}" ;;
  esac
  echo $platform
}


echo "Installing Packer"

if [ -d ~/.local/share/nvim/site/pack/packer ]; then
  echo "Clearning previous packer installs"
  rm -rf ~/.local/share/nvim/site/pack
fi

echo -e "\n=> Installing packer"
git clone https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo -e "=> packer installed!"

echo "Linking config"
echo "Old nvim config will be changed to nvim.bak if exists! :0"

# copping configuration

if [ -d ~/.config/nvim ]; then
   echo "Nvim Directory exists"
   echo "Changing nvim to nvim.bak"
   mv ~/.config/nvim/ ~/.config/nvim.bak/
   echo "Creating new nvim directory"
   mkdir -p ~/.config/nvim
else
   echo "Nvim Config doesn't exist so creating one"
   mkdir -p ~/.config/nvim/
fi

cp -r init.lua ~/.config/nvim/ && cp -r lua ~/.config/nvim/

echo "Neovim will open with some errors, just press enter" && sleep 2

# Install all plugin
nvim +PackerSync
