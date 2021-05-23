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

The commands and key-bindings have to be after pressing `<prefix>` (except for *swap windows*). The default `<prefix>` is `Ctrl-b`

| Functionality             | Command                                  | Key-binding (after `<prefix>`)               |
|---------------------------|------------------------------------------|----------------------------------------------|
| Show all commands         |                                          | `?`                                          |
| Reload tmux config        | `:source-file [path/to/file]`            | `r`                                          |
|                           |                                          |                                              |
| New session               | `:new-session`                           | `Ctrl-c`                                     |
| New window                | `:new-window`                            | `c`                                          |
| Split vertically          | `:split-window -v`                       | `-` (default `%`)                            |
| Split horizontally        | `:split-window -h`                       | `|` or `_` (default `"`)                     |
|                           |                                          |                                              |
| Navigate between sessions | `:switch-client` `-p`/`-n`               | `(`/`)`                                      |
| Navigate between windows  | `:previous-window`/`:next-window`        | `Ctrl-` `h`/`l`                              |
| Navigate to last window   | `:last-window`                           | `Tab`                                        |
| Navigate between panes    | `:select-pane` `-L`/`-D`/`-U`/`-R`       | `h`/`j`/`k`/`l`                              |
| Resize panes              | `:resize-pane` `-L`/`-D`/`-U`/`-R` `[n]` | `Shift-` `h`/`j`/`k`/`l`                     |
| Swap windows              | `:swap-window -t` `-1`/`+1`              | `Ctrl-Shift-` `Left`/`Right` (no `<prefix>`) |
| Swap panes                | `:swap-pane -t` `-1`/`+1`                | `{`/`}`                                      |
| Zoom/unzoom pane          | `:resize-pane -Z`                        | `z`                                          |
| Next layout               | `:next-layout`                           | `space`                                      |
|                           |                                          |                                              |
| Rename session            | `:rename-session [name]`                 | `$`                                          |
| Rename window             | `:rename-window [name]`                  | `,`                                          |
| List sessions             | `:choose-tree -Zs`                       | `s`                                          |
| List windows              | `:choose-tree -Zw`                       | `w`                                          |
|                           |                                          |                                              |
| Kill session              | `:kill-session`                          |                                              |
| Kill window               | `:kill-window`                           | `&`                                          |
| Kill pane                 | `:kill-pane`                             | `x`                                          |
|                           |                                          |                                              |
| Mouse mode                |                                          | `m`                                          |
| Clock mode                | `:clock-mode`                            | `t`                                          |
| Copy mode                 | `:copy-mode`                             | `[` or `Enter`                               |
| Paste from buffer         |                                          | `]` or `p`                                   |
| List buffer               |                                          | `#` or `b`                                   |
| Choose buffer             |                                          | `P`                                          |


In *copy mode*:
- Copy process:
    - Copy using keyboard:
        1. Enter copy mode
        2. Move to start/end of text
        3. Begin highlight:   `Ctrl-Space`
        4. Move to end/start of text
        5. Copy to clipboard: `Ctrl-w` (on Linux) or `Esc-w` (on Mac)
    - Copy using mouse:
        1. Enter copy mode
        2. Use your mouse to highlight
- Search text:
    1. Enter copy mode
    2. Search for text: `Ctrl-s [text]`
    3. Search forward/backward: `n/N`

(You can also use Vim key-bindings in Copy mode)
