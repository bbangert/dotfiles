#!/bin/sh

# Install GNU stow / zsh
if ! command -v stow >/dev/null @>&1; then
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install -y stow zsh
    fi
fi

# Backup common existing files
for f in .bashrc .bash_profile .bash_logout; do
    if [ -e ~/$f ]; then
        mv ~/$f ~/$f.bak
    fi
done

# Expand compressed binaries
tar xjvf bin/bin/*.tbz --directory bin/bin/

# Stow dotfiles
stow --target="$HOME" --stow git zsh

# Download lsd and install it
if ! command -v lsd >/dev/null 2>&1; then
    wget https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb
    sudo dpkg -i lsd_0.21.0_amd64.deb
    rm lsd_0.21.0_amd64.deb
fi


# Install prezto
prezto_dir="$HOME/.zprezto"
if [ -d $prezto_dir ]
then
  echo "Prezto already installed, exiting installation."
  exit
fi

zsh ~/dotfiles/install-prezto.sh
