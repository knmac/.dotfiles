# My neovim cheatsheet

(The default `<leader>` is `\`)

## 1. Custom Vim key-bindings

### 1.1. Fn key-bindings

| Functionality                           | Key-binding            |
| --------------------------------------- | ---------------------- |
| Search for help                         | `F1`                   |
| Show key-bindings                       | `Shift+F1`             |
| Open to-do list                         | `F2`                   |
| File explorer                           | `F3`                   |
| Show tags in the current buffer         | `F4`                   |
| Generate tags file (requires `ctags`)   | `Shift+F4`             |
|                                         |                        |
| Show buffer list                        | `F5`                   |
| Show tab list                           | `Shift+F5`             |
| Previous buffer                         | `F6` (or `Ctrl+Alt+h`) |
| Previous tab                            | `Shift+F6`             |
| Next buffer                             | `F7` (or `Ctrl+Alt+l`) |
| Next tab                                | `Shift+F7`             |
| Close the current buffer                | `F8`                   |
| Close the current tab                   | `Shift+F8`             |
|                                         |                        |
| Open diagnostic list                    | `F9`                   |
| Run the `make` command                  | `F10`                  |
| Run the `make clean` command            | `Shift+F10`            |
| Toggle zoom the current window (splits) | `F11`                  |
| Toggle color code colorizer (e.g., CSS) | `Shift+F11`            |
| Toggle relative number                  | `F12`                  |

### 1.2. Telescope key-bindings

| Functionality                      | Key-binding       |
| ---------------------------------- | ----------------- |
| Open Telescope                     | `<space> <space>` |
| Fuzzy search for filename          | `<space> f`       |
| Fuzzy search for word              | `<space> w`       |
| Fuzzy search for buffer            | `<space> b`       |
| Fuzzy search in the current buffer | `<space> /`       |


### 1.3. LSP-related key-bindings

| Functionality                                         | Key-binding   |
| ----------------------------------------------------- | ------------- |
| Show definitions                                      | `gd`          |
| Show implementation                                   | `gi`          |
| Show reference                                        | `gr`          |
| Show type definition                                  | `gt`          |
| Show function documentation (on hover)                | `<Shift+k>`   |
| Show signature help (while typing function arguments) | `<Ctrl+k>`    |
|                                                       |               |
| Rename variables                                      | `<leader> rn` |
| Code action (if supported by the language server)     | `<leader> ca` |
| Code formatting (if supported by the language server) | `<leader> f`  |
|                                                       |               |
| Show current line's diagnostic                        | `<leader> e`  |
| Go to previous diagnostic                             | `[e`          |
| Go to next diagnostic                                 | `]e`          |

<!-- | Add workspace folder                                  | `<leader> wa` | -->
<!-- | Remove workspace folder                               | `<leader> wr` | -->
<!-- | List workspace folder                                 | `<leader> wl` | -->


### 1.4. Other key-bindings

| Functionality                                 | Key-binding/Command  |
| --------------------------------------------- | -------------------- |
| Insert ipdb breakpoint (on the next line)     | `<leader> b`         |
| Insert ipdb breakpoint (on the previous line) | `<leader> B`         |
| Insert '-' characters                         | `<leader> -`         |
| Insert '=' characters                         | `<leader> =`         |
| Generate doc string for function              | `<leader> d`         |
|                                               |                      |
| Switch to the left window                     | `<Alt+h>`            |
| Switch to the lower window                    | `<Alt+j>`            |
| Switch to the upper window                    | `<Alt+k>`            |
| Switch to the right window                    | `<Alt+l>`            |
| Swap with the left window                     | `<Alt+Shift+h>`      |
| Swap with the lower window                    | `<Alt+Shift+j>`      |
| Swap with the upper window                    | `<Alt+Shift+k>`      |
| Swap with the right window                    | `<Alt+Shift+l>`      |
|                                               |                      |
| Switch to the previous buffer                 | `<Ctrl+Alt+h>`       |
| Switch to the next buffer                     | `<Ctrl+Alt+l>`       |
| Jump to a buffer                              | `<Ctrl+Alt+j>`       |
| Kill a buffer                                 | `<Ctrl+Alt+k>`       |
| Swap with the previous buffer                 | `<Ctrl+Alt+Shift+h>` |
| Swap with the next buffer                     | `<Ctrl+Alt+Shift+l>` |
| Fuzzy jump to buffer using Telescope          | `<Ctrl+Alt+Shift+j>` |
| Kill the current buffer                       | `<Ctrl+Alt+Shift+k>` |
|                                               |                      |
| Toggle terminal                               | `<Ctrl+\>`           |
|                                               |                      |
| Go to previous hunk of Git change             | `[c`                 |
| Go to next hunk of Git change                 | `]c`                 |
|                                               |                      |
| Toggle line-wise comment (normal mode)        | `gcc`                |
| Toggle line-wise comment (visual mode)        | `gc`                 |
| Toggle block-wise comment (normal mode)       | `gbc`                |
| Toggle block-wise comment (visual mode)       | `gb`                 |
|                                               |                      |
| Start easy align (in visual mode)             | `ga`                 |
| - Easy align by `|`                           | `ga*|`               |
| - Easy align by ` `                           | `ga* `               |


## 2. Default useful vim key-bindings

### 2.1. Standard navigation

| Group             | Functionality                             | Key-binding/Command         |
|-------------------|-------------------------------------------|-----------------------------|
| Line navigation   | Go left/down/up/right                     | `h`/`j`/`k`/`l`             |
|                   | Go to start/end of current line           | `0`/`$`                     |
|                   | Go to non-blank start/end of current line | `^`/`g_`                    |
| Word navigation   | Go to next/previous beginning of a word   | `w`/`b`                     |
|                   | Go to end of a word                       | `e`                         |
| Screen navigation | Go to first/last line                     | `gg`/`G`                    |
|                   | Go to `n`-th line                         | `:n` (or `ngg` or `nG`)     |
|                   | Go half-page up/down                      | `Ctrl+u`/`Ctrl+d`           |
|                   | Go full-page up/down                      | `Ctrl+b`/`Ctrl+f`           |
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

| Functionality           | Key-binding                           |
|-------------------------|---------------------------------------|
| Open file in new buffer | `:badd [filename]`                    |
| Go to next buffer       | `:bn`                                 |
| Go to previous buffer   | `:bp`                                 |
| Delete buffer           | `:bd`                                 |
| List all buffers        | `:ls`                                 |
| Go to a buffer          | `:b` `[buffer_index]`/`[buffer_name]` |
