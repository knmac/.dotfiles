# My neovim cheatsheet

(The default `<leader>` is `\`)

## 1. Custom Vim key-bindings

### 1.1. Fn key-bindings

| Functionality                            | Key-binding            |
|------------------------------------------|------------------------|
| Search for help                          | `F1`                   |
| Show key-bindings                        | `Shift+F1`             |
| Open to-do list                          | `F2`                   |
| File explorer                            | `F3`                   |
| Show tags in the current buffer          | `F4`                   |
|                                          |                        |
| Show buffer list                         | `F5`                   |
| Show tab list                            | `Shift+F5`             |
| Previous buffer                          | `F6` (or `Ctrl+Alt+h`) |
| Previous tab                             | `Shift+F6`             |
| Next buffer                              | `F7` (or `Ctrl+Alt+l`) |
| Next tab                                 | `Shift+F7`             |
| Close the current buffer                 | `F8`                   |
| Close the current tab                    | `Shift+F8`             |
|                                          |                        |
| Open diagnostic list                     | `F9`                   |
| Run the `make` command                   | `F10`                  |
| Run the `make clean` command             | `Shift+F10`            |
| Maximize/restore current window (splits) | `F11`                  |
| Toggle color code colorizer (e.g., CSS)  | `Shift+F11`            |
| Toggle floating terminal                 | `F12`                  |
| Toggle start page                        | `Shift+F12`            |
|                                          |                        |
| Split navigation                         | `<Alt+h/j/k/l>`        |

### 1.2. Telescope key-bindings

| Functionality                      | Key-binding       |
|------------------------------------|-------------------|
| Open Telescope                     | `<space> <space>` |
| Fuzzy search for filename          | `<space> f`       |
| Fuzzy search for text              | `<space> g`       |
| Fuzzy search in the current buffer | `<space> /`       |

<!-- | Insert python template                                    | `,py`                  | -->
<!-- | Insert html template                                      | `,html`                | -->
<!-- | Insert markdown template                                  | `,md`                  | -->
<!-- | Insert today's date (end of line)                         | `,today`               | -->

<!--
## Some (other) FZF key-bindings

(I only list some commands I use frequently. I highly recommend to check out [fzf.vim](https://github.com/junegunn/fzf.vim) for much cooler stuffs)

| Functionality                                   | Key-binding | Command     |
|-------------------------------------------------|-------------|-------------|
| Search for files with filename                  | `Ctrl+p`    | `:Files`    |
| Search for files with string (requires ripgrep) | `Ctrl+f`    | `:Rg`       |
| Show all commands                               |             | `:Commands` |
| Git commits (it's **magic**)                    |             | `:Commits`  |

To navigate in FZF's window, use either `Ctrl+j`/`Ctrl+n`/`down arrow` to go down and `Ctrl+k`/`Ctrl+p`/`up arrow` to go up.
-->

### 1.3. LSP-related key-bindings

| Functionality                                         | Key-binding   |
|-------------------------------------------------------|---------------|
| Show definitions                                      | `gd`          |
| Show declaration                                      | `gD`          |
| Show implementation                                   | `gi`          |
| Show reference                                        | `gr`          |
| Show function documentation (on hover)                | `<Shift+k>`   |
| Show signature help (while typing function arguments) | `<Ctrl+k>`    |
| Show type definitions                                 | `<Shift+d>`   |
|                                                       |               |
| Rename variables                                      | `<leader> rn` |
| Code action                                           | `<leader> ca` |
| Code formatting (if supported)                        | `<leader> f`  |
|                                                       |               |
| Show current line's diagnostic                        | `<leader> e`  |
| Go to previous diagnostic                             | `[e`          |
| Go to next diagnostic                                 | `]e`          |
|                                                       |               |
| Add workspace folder                                  | `<leader> wa` |
| Remove workspace folder                               | `<leader> wr` |
| List workspace folder                                 | `<leader> wl` |

<!--
## Some NERD Commenter key-bindings

| Functionality           | Key-binding   |
| ----------------------- | ------------- |
| Comment                 | `<leader> cc` |
| Uncomment               | `<leader> cu` |
| Toggle comment          | `<leader> ci` |
| Comment with left-align | `<leader> cl` |
| Comment 'Sexily'        | `<leader> cs` |
-->

<!--
   -## Some CoC key-bindings
   -
   -| Functionality                        | Key-binding   |
   -|--------------------------------------|---------------|
   -| Previous diagnostic                  | `[g`          |
   -| Next diagnostic                      | `]g`          |
   -| Go to definition                     | `gd`          |
   -| Go to type definition                | `gy`          |
   -| Go to implementation                 | `gi`          |
   -| Go to reference                      | `gr`          |
   -| Show documentation in preview window | `K`           |
   -| Rename symbol                        | `<leader> rn` |
   -| Format selected code                 | `<leader> f`  |
   -->

<!--
   -## Some Vimtex key-bindings
   -
   -| Functionality | Key-binding   |
   -|---------------|---------------|
   -| Compile       | `<leader> ll` |
   -| View          | `<leader> lv` |
   -| Clean         | `<leader> lc` |
   -->

### 1.4. Vim-markdown and Tabular key-bindings

| Functionality                          | Key-binding/Command |
|----------------------------------------|---------------------|
| Open link in Vim to edit               | `ge`                |
| Open link in browser                   | `gx`                |
| Next header                            | `]]`                |
| Previous header                        | `[[`                |
| Format table                           | `:TableFormat`      |
| Create table of contents (to navigate) | `:Toc`              |


### 1.5. Other key-bindings

| Functionality                                 | Key-binding/Command |
|-----------------------------------------------|---------------------|
| Remove highlighted searching text             | `<leader> <space>`  |
| Insert ipdb breakpoint (on the next line)     | `<leader> b`        |
| Insert ipdb breakpoint (on the previous line) | `<leader> B`        |
| Insert '-' characters                         | `<leader> -`        |
| Insert '=' characters                         | `<leader> =`        |


## 2. Default useful vim key-bindings

### 2.1. Standard navigation

| Group             | Functionality                             | Key-binding/Command         |
|-------------------|-------------------------------------------|-----------------------------|
| Line navigation   | Go left/down/up/ right                    | `h`/`j`/`k`/`l`             |
|                   | Go to start/end of current line           | `0`/`$`                     |
|                   | Go to non-blank start/end of current line | `^`/`g_`                    |
| Word navigation   | Go to next/previous beginning of a word   | `w`/`b`                     |
|                   | Go to end of a word                       | `e`                         |
| Screen navigation | Go to first/last line                     | `gg`/`G`                    |
|                   | Go to `n`-th line                         | `nG` (or `:n`)              |
|                   | Go half-page up/down                      | `Ctrl+u`/`Ctrl+d`           |
| Search navigation | Search for pattern                        | `/[pattern]`                |
|                   | Go to next/previous matching pattern      | `n`/`N`                     |
| Window navigation | Create a horizontal split                 | `:split` (or `<Ctrl+w> s`)  |
|                   | Create a vertical split                   | `:vsplit` (or `<Ctrl+w> v`) |
|                   | Go to left/down/up/right split            | `Ctrl+w` `h`/`j`/`k`/`l`    |

### 2.2. Substitution

General command:

`[substitution_options]/[old_string]/[new_string]/[execution_options]`

Substitution options:

| Functionality                              | Key-binding |
|--------------------------------------------|-------------|
| Replace all                                | `%s`        |
| replace the current line                   | `s`         |
| replace from line 5 to line 12             | `5,12s`     |
| replace from current line to the last line | `,$s`       |

Execution options:

| Functionality                | Key-binding |
|------------------------------|-------------|
| Execute without confirmation | `g`         |
| Execute with confirmation    | `gc`        |

Examples:

- `:%s/foo/bar/g`: replace all `foo` by `bar`
- `:s/foo/bar/g`: replace `foo` by `bar` on the current line

### 2.3. Vim's default auto-completion (insert mode)

| Functionality                      | Key-binding     |
|------------------------------------|-----------------|
| Word/pattern completion - forward  | `Ctrl+x Ctrl+n` |
| Word/pattern completion - backward | `Ctrl+x Ctrl+p` |
| Line completion                    | `Ctrl+x Ctrl+l` |
| Filename completion                | `Ctrl+x Ctrl+f` |
| Omni completion **(my favorite)**  | `Ctrl+x Ctrl+o` |

More information: [link](https://www.thegeekstuff.com/2009/01/vi-and-vim-editor-5-awesome-examples-for-automatic-word-completion-using-ctrl-x-magic/)

### 2.4. Ctags key-bindings (requires Ctags)

| Functionality        | Key-binding |
|----------------------|-------------|
| Go to definition     | `Ctrl+]`    |
| Preview definition   | `Ctrl+w }`  |
| Close preview window | `Ctrl+w z`  |

### 2.5. Code folding

| Functionality    | Key-binding |
|------------------|-------------|
| Toggle a fold    | `za`        |
| Close all folds  | `zM`        |
| Reopen all folds | `zR`        |

### 2.6. Buffers manipulation

| Functionality                     | Key-binding                           |
|-----------------------------------|---------------------------------------|
| Open file in new buffer           | `:badd [filename]`                    |
| Go to next buffer                 | `:bn`                                 |
| Go to previous buffer             | `:bp`                                 |
| Delete buffer                     | `:bd`                                 |
| List all buffer (not interactive) | `:ls`                                 |
| Go to a buffer                    | `:b` `[buffer_index]`/`[buffer_name]` |
