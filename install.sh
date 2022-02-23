#!/bin/sh

# Install GNU stow / zsh
if ! command -v stow >/dev/null @>&1; then
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get install -y stow zsh
    fi
fi

# Backup common existing files
for f in .bashrc .bash_profile .bash_logout; do
    if [ -e ~/$f ]; then
        mv ~/$f ~/$f.bak
    fi
done

# Stow dotfiles
stow --target="$HOME" --stow git


# Install prezto
prezto_dir="$HOME/.zprezto"
if [ -d $prezto_dir ]
then
  echo "Prezto already installed, exiting installation."
  exit
fi

echo "Install prezto and zsh config via 'zsh ~/dotfiles/install-prezto.sh'"
zsh ~/dotfiles/install-prezto.sh
