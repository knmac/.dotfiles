# Linux settings
Some linux settings I have been collecting
![screen shot](screenshot.png)


## Auto installation
This is to install everything automatically. However, I recommend to open the installation files and execute only necessary sections. Some installation guides are also given here.

Main installation
```bash
git clone https://github.com/knmac/linux_settings.git
cd linux_settings
./install.sh
```

Theme installation
```bash
cd linux_settings
./install_theme.sh
```

## Powerline Font
This is to display breadcrumbs for Vim/Neovim and Tmux correctly.

Install the fonts:
```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```
Then *manually* change the font in your terminal. The one I usually use is `Source Code Pro for Powerline Medium`


## Vim/Neovim
I recommend using neovim instead as it has async supports. Some mouse-clicking features also do not work in classic Vim.

If you run neovim in a virtualenv and see this error: `[deoplete] deoplete failed to load. Try the :UpdateRemotePlugins command and restart Neovim. See also :checkhealth.`. Follow these steps:
```bash
pip install --upgrade neovim pynvim
(Open neovim)
:UpdateRemotePlugins
```

### Neovim installation
Install neovim:
```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

Install neovim dependencies:
```bash
sudo apt-get install python-dev python-pip python3-dev python3-pip curl vim exuberant-ctags git ack-grep
pip install --user neovim pep8 flake8 pyflakes pylint isort pynvim
pip3 install --user neovim pep8 flake8 pyflakes pylint isort pynvim
```

### Cheatsheet
[Neovim cheatsheet](nvim_cheatsheet.md)


## Tmux
### Building from source
Change the versions, URLs, and paths accordingly in `install_tmux.sh`

Then add these two lines in your `.bashrc`:
```bash
export PATH="$HOME/.local/bin":$PATH
export LD_LIBRARY_PATH="$HOME/.local/lib":$LD_LIBRARY_PATH
```

### Cheatsheet
[Tmux cheatsheet](tmux_cheatsheet.md)
