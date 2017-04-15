# Linux settings (how to use)

* Rename ``` vimrc ``` to ``` .vimrc ``` and put in home folder.
* Rename ``` tmux.conf ``` to ``` .tmux.conf ``` and put in home folder.
* Put ``` config ``` inside ``` ~/.ssh ```.


# vimrc's installation guide
## Required packages
```
sudo apt-get install curl vim exuberant-ctags git ack-grep
sudo pip install pep8 flake8 pyflakes isort yapf
```

## Activate YouCompleteMe
Open vim the first time will download and install all plugins. To activate YouCompleteMe (put inside ``` ~/.vim/plugged/ ``` by default), go to ``` ~/.vim/plugged/YouCompleteMe/ ``` and run:

```
python install.py
```

## Cheatsheet
(In normal mode)
* Open task list: F6
* Navigate between files and folders: F7
* Navigate between functions: F8
* Open error list: F9
* Open task manager: tl
* Code folding: za


# tmux 2.2's installation guide
## Install from source
```
sudo apt-get update
sudo apt-get install -y libevent-dev libncurses-dev make
wget https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz
tar xvzf tmux-2.2.tar.gz
cd tmux-2.2/
./configure && make
sudo make install
```

## Cheat sheet
(After pressing Ctrl - b)
* Split veritcally: |
* Split horizontally: -
* Create new window: c
* Kill pane: x
* Kill window: &
* Navigate, resize: use your mouse :)
