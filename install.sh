#!/bin/sh

# Check architecture
arch=$(uname -m)

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

# Stow dotfiles
stow --target="$HOME" --stow git zsh

# Download lsd and install it
if ! command -v lsd >/dev/null 2>&1; then
    if [ "$arch" = "x86_64" ] ; then
        wget https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd-musl_1.1.2_amd64_xz.deb
        sudo dpkg -i lsd-musl_1.1.2_amd64_xz.deb
        rm lsd-musl_1.1.2_amd64.deb
    elif [ "$arch" = "aarch64" ] ; then
        wget https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd-musl_1.1.2_arm64_xz.deb
        sudo dpkg -i lsd-musl_1.1.2_arm64_xz.deb
        rm lsd-musl_1.1.2_arm64_xz.deb
    fi
fi


# Install prezto
prezto_dir="$HOME/.zprezto"
if [ -d $prezto_dir ]
then
  echo "Prezto already installed, exiting installation."
  exit
fi
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
zsh install-prezto.sh
echo 'eval "$(atuin init zsh)"' >> ~/.zshrc
echo 'export ATUIN_SYNC_ADDRESS=https://sh.groovie.org' >> ~/.zshrc
