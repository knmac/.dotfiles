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

## Cheatsheet
(In normal mode)
* Open todo list: F2
* Navigate between files and folders: F3
* Navigate between functions: F4
* Open error list: F9
* Open tab manager: tl
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
