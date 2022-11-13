# dotfiles

Set of dotfiles I use for my terminal prompt. 

Note that my shell setup assumes the use of [Nerd Fonts](https://www.nerdfonts.com/) for proper icon/glyph display.

## VS Code Automatic Usage

Installed automatically in VS Code when used with [dotfiles setup](https://code.visualstudio.com/docs/devcontainers/containers#_personalizing-with-dotfile-repositories).

Example `settings.json` modification:

```json
    "dotfiles.repository": "bbangert/dotfiles",
    "dotfiles.targetPath": "~/dotfiles",
    "dotfiles.installCommand": "~/dotfiles/install.sh",
```

Some other useful VS Code settings for font usage in Terminal and editor windows:

```json
    "editor.fontLigatures": true,
    "editor.fontFamily": "FiraCode NF",
    "terminal.integrated.fontFamily": "FiraCode NF",
```

Note the font family may need name tweaks based on OS, the above is for Windows.

To use the same font family on MacOS:

```json
    "editor.fontFamily": "FiraCodeNerdFontComplete-Retina",
    "terminal.integrated.fontFamily": "FiraCodeNerdFontComplete-Retina",
```

## Git Commit Signing

SSH signing is the easiest when using remote shells, as its easy to avoid accidentally
leaving private keys around.
