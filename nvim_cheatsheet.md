# My neovim cheatsheet

(The default `<LEADER>` is `\`)

## Some custom Vim shortcuts

| Functionality                                             | Commands                        |
|-----------------------------------------------------------|---------------------------------|
| Open todo list                                            | `F2`                            |
| Navigate between files and folders                        | `F3`                            |
| Navigate between functions                                | `F4`                            |
| Show (interactive) buffere list                           | `F5`                            |
| Previous buffer                                           | `F6`                            |
| Next buffer                                               | `F7`                            |
| Close the current buffer (and switch to the previous one) | `F8`                            |
| Open error list                                           | `F9`                            |
| Run the `make` command (required to set up Makefile)      | `F10`                           |
| Auto completion (in insert mode)                          | `Ctrl-x Ctrl-o`                 |
| Open tab manager (Notice: tab is different from buffer)   | `tl`                            |
| Insert ipdb breakpoint                                    | `<LEADER> b`                    |
| Unhighlight searching text                                | `<LEADER> <space>` (or `:nohl`) |

## Some NERD Commenter mappings:

| Functionality           | Command       |
| ----------------------- | ------------- |
| Comment                 | `<LEADER> cc` |
| Uncomment               | `<LEADER> cu` |
| Comment with left-align | `<LEADER> cl` |
| Comment 'Sexily'        | `<LEADER> cs` |

## Some JediVim mappings

(This is for Python only; use CTags for non-Python files):

| Functionality                  | Command |
| ------------------------------ | ------- |
| Go to definition               | `,d`    |
| Go to assignment               | `,a`    |
| Find occurences                | `,o`    |
| Rename variable                | `,r`    |
| Show definition (in a new tab) | `,k`    |

## Some FZF Mappings:

| Functionality                                   | Command  |
| ----------------------------------------------- | -------- |
| Search for files with filename                  | `Ctrl-p` |
| Search for files with string (requires ripgrep) | `Ctrl-f` |

## Some Vimtex mappings:

| Functionality | Command       |
| ------------- | ------------- |
| Compile       | `<LEADER> ll` |
| View          | `<LEADER> lv` |
| Clean         | `<LEADER> lc` |

## Some useful Ctags commands (requires Ctags):

| Functionality        | Command    |
| -------------------- | ---------- |
| Go to definition     | `Ctrl-]`   |
| Preview definition   | `Ctrl-w }` |
| Close preview window | `Ctrl-w z` |

## Some useful (default) vim commands:

### Navigation

| Group             | Functionality                               | Command                        |
|-------------------|---------------------------------------------|--------------------------------|
| Line navigation   | Go left / down / up / right                 | `h` / `j` / `k` / `l`          |
|                   | Go to start / end of current line           | `0` / `$`                      |
|                   | Go to non-blank start / end of current line | `^` / `g_`                     |
| Text navigation   | Go to next / previous beginning of a word   | `w` / `b`                      |
|                   | Go to end of a word                         | `e`                            |
| Screen navigation | Go to first / last line                     | `gg` / `G`                     |
|                   | Go to `n`'th line                           | `nG` (or `:n`)                 |
|                   | Go half-page up / down                      | `Ctrl-u`/ `Ctrl-d`             |
| Search navigation | Search for pattern                          | `/[pattern]`                   |
|                   | Go to next / previous matching pattern      | `n` / `N`                      |
| Window navigation | Create a horizontal split                   | `:split`                       |
|                   | Create a vertical split                     | `:vsplit`                      |
|                   | Go to left / down / up / right window       | `Ctrl-w` `h` / `j` / `k` / `l` |

### Code folding

| Functionality    | Command |
|------------------|---------|
| Toggle a fold    | `za`    |
| Close all folds  | `zM`    |
| Reopen all folds | `zR`    |

### Working with buffers

| Functionality           | Command                                  |
|-------------------------|------------------------------------------|
| Open file in new buffer | `:badd [filename]`                       |
| Go to next buffer       | `:bn`                                    |
| Go to previous buffer   | `:bp`                                    |
| Delete buffer           | `:bd`                                    |
| List all buffer         | `:ls`                                    |
| Go to a buffer          | `:b` `[buffer_index] ` / `[buffer_name]` |

### Substitution

General command:

`[substitution_options]/[old_string]/[new_string]/[execution_options]`

Substitution options:

| Functionality                              | Command |
|--------------------------------------------|---------|
| Replace all                                | `%s`    |
| replace the current line                   | `s`     |
| replace from line 5 to line 12             | `5,12s` |
| replace from current line to the last line | `,$s`   |

Execution options:

| Functionality                | Command |
|------------------------------|---------|
| Execute without confirmation | `g`     |
| Execute with confirmation    | `gc`    |

Examples:
    - `:%s/foo/bar/g`: replace all `foo` by `bar`
    - `:s/foo/bar/g`:  replace `foo` by `bar` on the current line
