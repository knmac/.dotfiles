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

(The default `[PREFIX]` is `Ctrl-b`)

| Functionality             | Command (after `[PREFIX]:`)  | Key-binding (after `[PREFIX]`)               |
|---------------------------|------------------------------|----------------------------------------------|
| Show all commands         |                              | `?`                                          |
|                           |                              |                                              |
| New session               | `new-session`                | `Ctrl-c`                                     |
| New window                | `new-window`                 | `c`                                          |
| Split vertically          | `split-window -v`            | `-` (default `%`)                            |
| Split horizontally        | `split-window -h`            | `\` or `_` (default `"`)                     |
|                           |                              |                                              |
| Navigate between sessions |                              | `(`/`)`                                      |
| Navigate between windows  |                              | `Ctrl-` `h`/`l`                              |
| Navigate between panes    |                              | `h`/`j`/`k`/`l`                              |
| Resize panes              |                              | `Shift-` `h`/`j`/`k`/`l`                     |
| Swap windows              |                              | `Ctrl-Shift-` `Left`/`Right` (no `[PREFIX]`) |
| Swap panes                |                              | `{`/`}`                                      |
| Zoom/unzoom pane          | `resize-pane -Z`             | `z`                                          |
| Next layout               | `next-layout`                | `space`                                      |
|                           |                              |                                              |
| Rename session            | `rename-session [name]`      | `$`                                          |
| Rename window             | `rename-window [name]`       | `,`                                          |
| List sessions             | `choose-tree -Zs`            | `s`                                          |
| List windows              | `choose-tree -Zw`            | `w`                                          |
|                           |                              |                                              |
| Kill session              | `kill-session`               |                                              |
| Kill window               | `kill-window`                | `&`                                          |
| Kill pane                 | `kill-pane`                  | `x`                                          |
|                           |                              |                                              |
| Reload tmux config        | `source-file [path/to/file]` | `r`                                          |
| Mouse mode                |                              | `m`                                          |
| Clock mode                | `clock-mode`                 | `t`                                          |
| Copy mode                 | `copy-mode`                  | `[` or `Enter`                               |
| Paste from buffer         |                              | `]` or `p`                                   |
| List buffer               |                              | `#` or `b`                                   |
| Choose buffer             |                              | `P`                                          |


In *copy mode*:
- Copy process:
    - Copy using keyboard:
        1. Enter copy mode
        2. Move to start/end of text
        3. Begin highlight:   `Ctrl-Space`
        4. Move to end/start of text
        5. Copy to clipboard: `Alt-w` (on Linux) or `Esc-w` (on Mac)
    - Copy using mouse:
        1. Enter copy mode
        2. Use your mouse to highlight
- Search text:
    1. Enter copy mode
    2. Search for text: `Ctrl-s [text]`
    3. Search forward/backward: `n/N`
