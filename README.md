# Linux settings
Some linux settings I have been collecting
![screen shot](screenshot.png)


## Auto installation
This is to install everything automatically. However, I recommend to open the installation files and execute only necessary sections. Some installation guides are also given here.

Main installation
```
git clone https://github.com/knmac/linux_settings.git
cd linux_settings
./install.sh
```

Theme installation
```
cd linux_settings
./install_theme.sh
```

## Powerline Font
This is to display breadcrumbs for Vim/Neovim and Tmux correctly.

Install the fonts:
```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```
Then *manually* change the font in your terminal. The one I usually use is `Source Code Pro for Powerline Medium`


## Vim/Neovim
I recommend using neovim instead as it has async supports. Some mouse-clicking features also do not work in classic Vim.

### Neovim installation
Install neovim:
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

Install neovim dependencies:
```
sudo apt-get install python-dev python-pip python3-dev python3-pip curl vim exuberant-ctags git ack-grep
pip install --user neovim pep8 flake8 pyflakes pylint isort
pip3 install --user neovim pep8 flake8 pyflakes pylint isort
```

### Cheatsheet
Some self-defined shortcuts (in normal mode)
- Auto completion: `Ctrl-x Ctrl-o`
- Open todo list: `F2`
- Navigate between files and folders: `F3`
- Show (interactive) buffere list: `F5`
- Previous buffer: `F6`
- Next buffer: `F7`
- Navigate between functions: `F8`
- Open error list: `F9`
- Open tab manager: `tl`
- Quick comment toggle: `\ci`
- Jedi-Vim mappings:
    - Go to definition: `,d` (can use CTags instead)
    - Go to assignment: `,a`
    - Find occurences: `,o`
- Search files: `Ctrl-p`
    - Switch to buffer or MRU searching (after `Ctrl-p`): `Ctrl-f` / `Ctrl-b`

Some useful Ctags commands (requires Ctags):
- Go to definition: `Ctrl-]`
- Preview definition: `Ctrl-w }`
- Close preview window: `Ctrl-w z`

Some useful vim commands:
- Line navigation:
	- `h`/`j`/`k`/`l`: left/down/up/right
	- `0`/`$`: start/end of current line
	- `^, g_`: non-blank start/end of current line
- Text navigation:
	- `w`/`b`: next/previous beginning of a word
	- `e`: end of a word
- Screen navigation:
	- `gg`/`G`: first/last line
  	- `nG` (or `:n`): go to n'th line
	- `Ctrl-u`/ `Ctrl-d`: half-page up/down
- Search navigation:
	- `:/[pattern]`: search for pattern
	- `n`/`N`: next / previous matching pattern
- Window navigation:
	- `:split`: horizontal split
	- `:vsplit`: vertical split
	- `Ctrl-w h/j/k/l`: move to left/down/up/right window
- Code folding:
	- `za`: toggle folding
- Open multiple files with buffer: (can be combined with NERDTree and CtrlP)
	- `:badd [filename]`: open file in new buffer
	- `:bn`: next buffer
	- `:bp`: previous buffer
	- `:bd`: delete buffer
	- `:ls`: list all buffer
	- `:b [number/filename]`: go to that buffer
- Substitution
    - `:[substitution options]/[old string to be replaced]/[new string to replace]/[execution options]`
    - Substitution options:
        - `%s`: replace all
        - `s`: replace the current line
        - `5,12s`: replace from line 5 to line 12
        - `,$s`: replace from current line to the last line
    - Execution options:
        - `g`: go
        - `gc`: go, but with confirmation
    - Examples:
        - `:%s/foo/bar/g`: replace all `foo` by `bar`
        - `:s/foo/bar/g`: replace `foo` by `bar` on the current line


## Tmux
### Building from source
Change the version accordiningly
```
sudo apt-get update
sudo apt-get install -y libevent-dev libncurses-dev make
wget https://github.com/tmux/tmux/releases/download/2.4/tmux-2.4.tar.gz
tar xvzf tmux-2.4.tar.gz
cd tmux-2.4/
./configure && make
sudo make install
```

### Cheatsheet
From outside tmux
- Attach to the previous session:
```
tmux attach
```
- Attach to a specific session:
```
tmux attach -t [session-name]
```
- Attach with detaching (helps when display is off after connecting from a different computer):
```
tmux attach -d
```
- List all sessions:
```
tmux ls
```

From inside tmux (`<PREFIX>` = `Ctrl-b`)
- Rename session:         `<PREFIX> :rename-session [new-session-name]`
- Rename window:          `<PREFIX> :rename-window [new-window-name]`
- Reload tmux config:     `<PREFIX> :source-file [path/to/file]`
- Show all commands:      `<PREFIX> ?`
- Show clock:             `<PREFIX> t`
- Mouse mode:             `<PREFIX> m`
- Split veritcally:       `<PREFIX> |`
- Split horizontally:     `<PREFIX> -`
- Create new window:      `<PREFIX> c`
- Zoom/un-zoom a pane:    `<PREFIX> z`
- Switch between layouts: `<PREFIX> Space`
- Kill pane:              `<PREFIX> x`
- Kill window:            `<PREFIX> &`
- Move pane left/right:   `<PREFIX> {` or `<PREFIX> }`
- Move window left/right: `Ctrl-Shift-Left` or `Ctrl-Shift-Right`
- Move between panes:     `<PREFIX>` (release) `h/j/k/l`  *(or use your mouse)*
- Move between windows:   `<PREFIX> h` or `<PREFIX> l`  *(or use your mouse)*
- Move between sessions:  `<PREFIX> (` or `<PREFIX> )`
- Resize panes:           `<PREFIX> Alt-Left/Down/Up/Right`  *(or use your mouse)*
- Copy process:
    - Copy using keyboard:
        1. Enter copy mode: `<PREFIX> Enter`
        2. Move to start/end of text
        3. Begin highlight:   `Ctrl-Space`
        4. Move to end/start of text
        5. Copy to clipboard: `Alt-w` (on Linux) or `Esc-w` (on Mac)
    - Copy using mouse:
        1. Enter copy mode: `<PREFIX> Enter`
        2. Use your mouse to highlight
	- Paste from buffer: `<PREFIX> p`
	- List buffer:       `<PREFIX> b`
	- Choose buffer:     `<PREFIX> P`
