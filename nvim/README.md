# Before using

Choose the flavor of Neovim by creating a relative symbolic link

```bash
cd /path/to/dotfiles/nvim
ln -rsf [your_choice_of_init_file] init.vim
```

For example:

- Basic Neovim, without any plugins (except for the gruvbox colorscheme, but you can remove it if you want).
```bash
ln -rsf init_basic.vim init.vim
```

- Neovim with COC (Conquer Of Completion). Require NodeJS.
```bash
ln -rsf init_coc.vim init.vim
```
If you don't like NodeJS, you can use some alternative plugins by changing the variables `use_coc` in `init_coc.vim` to 0.


- Neovim with native LSP (Language Server Protocol) support. Require NodeJS and Neovim>=v0.5.0.
```bash
ln -rsf init_lsp.vim init.vim
```
