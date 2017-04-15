# Linux settings (how to use)

* Rename ``` vimrc ``` to ``` .vimrc ```
* Rename ``` tmux.conf ``` to ``` .tmux.conf ```
* Put ``` config ``` inside ``` ~/.ssh ```


# Required packages for vimrc
```
sudo apt-get install curl vim exuberant-ctags git ack-grep
sudo pip install pep8 flake8 pyflakes isort yapf
```

After cloning YouCompleteMe (inside ``` ~/.vim/plugged/ ``` by default), go to ``` ~/.vim/plugged/YouCompleteMe/ ``` and run
``` python install.py ```

# Install tmux 2.2
```
sudo apt-get update
sudo apt-get install -y libevent-dev libncurses-dev make
wget https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz
tar xvzf tmux-2.2.tar.gz
cd tmux-2.2/
./configure && make
sudo make install
```
