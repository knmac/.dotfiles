# My tmux cheatsheet

## From outside tmux

- Attach to the previous session:
```bash
tmux attach
```
- Attach to a specific session:
```bash
tmux attach -t [session-name]
```
- Attach with detaching (helps when display is off after connecting from a different computer):
```bash
tmux attach -d
```
- List all sessions:
```bash
tmux ls
```

## From inside tmux

(The default `<PREFIX>` is `Ctrl-b`)

- Rename session:         `<PREFIX> :rename-session [new-session-name]`
- Rename window:          `<PREFIX> :rename-window [new-window-name]`
- Reload tmux config:     `<PREFIX> :source-file [path/to/file]`
- Show all commands:      `<PREFIX> ?`
- Show clock:             `<PREFIX> t`
- Mouse mode:             `<PREFIX> m`
- Split veritcally:       `<PREFIX> |`  (default is `<PREFIX> %`)
- Split horizontally:     `<PREFIX> -`  (default is `<PREFIX> "`)
- Create new window:      `<PREFIX> :new-window` or `<PREFIX> c`
- Create new session:     `<PREFIX> :new-session`
- Zoom/un-zoom a pane:    `<PREFIX> z`
- Switch between layouts: `<PREFIX> Space`
- Kill pane:              `<PREFIX> x`
- Kill window:            `<PREFIX> &`
- Show list of sessions:  `<PREFIX> w`
- Show list of sessions:  `<PREFIX> s`
- Move pane left/right:   `<PREFIX> {` or `<PREFIX> }`
- Move window left/right: `Ctrl-Shift-Left` or `Ctrl-Shift-Right`
- Move between panes:     `<PREFIX>` (release) `h/j/k/l`  *(or use your mouse)*
- Move between windows:   `<PREFIX> h` or `<PREFIX> l`  *(or use your mouse)*
- Move between sessions:  `<PREFIX> (` or `<PREFIX> )`
- Resize panes:           `<PREFIX> Alt-Left/Down/Up/Right`  *(or use your mouse)*
- Copy process:
    - Copy using keyboard:
        1. Enter copy mode: `<PREFIX> [` (or `<PREFIX> Enter`)
        2. Move to start/end of text
        3. Begin highlight:   `Ctrl-Space`
        4. Move to end/start of text
        5. Copy to clipboard: `Alt-w` (on Linux) or `Esc-w` (on Mac)
    - Copy using mouse:
        1. Enter copy mode: `<PREFIX> [`
        2. Use your mouse to highlight
	- Paste from buffer: `<PREFIX> p`
	- List buffer:       `<PREFIX> b`
	- Choose buffer:     `<PREFIX> P`
- Search text:
    1. Enter copy mode: `<PREFIX> [`
    2. Search for text: `Ctrl-s [text]`
    3. Search forward/backward: `n/N`
