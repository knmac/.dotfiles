# Linux settings
Some linux settings I have been collecting
![screen shot](screenshot.png)


## 1. Auto installation
This is to install everything automatically. However, I recommend to open the installation files and execute only necessary sections. Some installation guides are also given here.

Installation (require sudo)
```bash
git clone https://github.com/knmac/linux_settings.git
cd linux_settings
./install.sh
```


## 2. Powerline Fonts
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


## 3. Neovim

### 3.1. Installation
Install neovim dependencies:
```bash
sudo apt-get install python-dev python-pip python3-dev python3-pip curl vim exuberant-ctags git ack-grep
pip install --user neovim pep8 flake8 pyflakes pylint isort pynvim
pip3 install --user neovim pep8 flake8 pyflakes pylint isort pynvim
```

Install neovim:
```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

If you see this error (usually seen when run neovim in a virtual env): 
`[deoplete] deoplete failed to load. Try the :UpdateRemotePlugins command and restart Neovim. See also :checkhealth.`. 
Follow these steps:

1. Install/upgrade some packages
```bash
pip install --user --upgrade neovim pynvim
pip3 install --user --upgrade neovim pynvim
```
2. Then open neovim and run
```
:UpdateRemotePlugins
```

### 3.2. Cheatsheet
[Neovim cheatsheet](nvim_cheatsheet.md)


## 4. Tmux
### 4.1. Building from source
Change the versions, URLs, and paths accordingly in `install_tmux.sh`

Then add these two lines in your `.bashrc` or `.zshrc`:
```bash
export PATH="$HOME/.local/bin":$PATH
export LD_LIBRARY_PATH="$HOME/.local/lib":$LD_LIBRARY_PATH
```

### 4.2. Cheatsheet
[Tmux cheatsheet](tmux_cheatsheet.md)


## 5. Tools to help you ditch GUI ;)

- Web browser and pager: `w3m`
- Email client: `neomutt`
- File manager: `ranger` 
- Visual shell for Unix-like system: `mc` (Midnight commander)
- List contents in tree-like format: `tree`
- File searcher: `rg` (ripgrep - improved version of `grep`)
- File preview with syntax highlighting: `bat`
- Interactive process viewer: `htop`
- Document converter: `pandoc`
- Video converter: `ffmpeg`
- Music player client: `ncmpcpp`, `mpd`, `mpc` [moreinfo](https://computingforgeeks.com/how-to-configure-mpd-and-ncmpcpp-on-linux/)
- Youtube/Spotify/... streamer: `tizonia`
- Bandwidth monitor and rate esimator: `bmon`
- System info viewer: `neofetch`
- PDF reader (this is with GUI): `zathura`
