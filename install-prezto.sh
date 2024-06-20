 #!/usr/bin/zsh

echo "Installing prezto"

git clone --recursive --shallow-submodules --depth 1 https://github.com/bbangert/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Remove existing zshrc
rm -f ~/.zshrc ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile  ~/.zshenv

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Done"
