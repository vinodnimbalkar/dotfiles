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

echo "Installing Vim Plug"

if [ ! -d ~/.config/nvim/autoload/plug.vim ]; then
  if [ "$(get_platform)" = "Mac" ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    echo "Vim Plug Installed"
  elif ["$(get_platform)" ="Linux"]; then
    curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Vim Plug Installed"
  else
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
      ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
    echo "Vim Plug Installed"
  fi
fi

# conping configuration

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

cp -r init.vim ~/.config/nvim/ && cp -r * ~/.config/nvim/

echo "neovim will open with some errors, just press enter" && sleep 2

# Install all plugin
nvim +PlugInstall
