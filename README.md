# My Vim config

![Screenshot of Vim](./screenshot/vimrc.png)

## Table of contents

<!-- vim-markdown-toc GFM -->

* [Stack](#stack)
* [Install](#install)
* [Layout](#layout)

<!-- vim-markdown-toc -->

## Stack

* Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)
* Completion, LSP and diagnostics: [coc.nvim](https://github.com/neoclide/coc.nvim) (extensions live in `coc/`)
* Syntax highlighting: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`main` branch), with regex syntax plugins only for languages without a parser (smali, vcl, caddy, haproxy, logstash, cql, openscad, blade)
* Statusline: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) with dracula theme
* Git: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) for the gutter, [fugitive](https://github.com/tpope/vim-fugitive) + [gv.vim](https://github.com/junegunn/gv.vim) for everything else
* Fuzzy finding: [fzf.vim](https://github.com/junegunn/fzf.vim) (`<C-p>` files, `<M-p>` ripgrep)
* AI: [copilot.vim](https://github.com/github/copilot.vim) (`<S-Tab>` to accept) + [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) (`cc` to open)

## Install

Requirements:

* neovim (recent; treesitter uses the `main` branch which needs 0.11+)
* node + yarn (coc.nvim and its extensions)
* `tree-sitter` CLI (`npm install -g tree-sitter-cli` or `pacman -S tree-sitter-cli`) — needed to compile treesitter parsers
* `ag` (the_silver_searcher) — default fzf file source
* `rg` (ripgrep) — `:Rg` grep

Then:

```bash
git clone git@github.com:nemanjan00/vim.git
cd vim
./install.sh
```

Open nvim and run `:PlugInstall`. Treesitter parsers install themselves on first start.

## Layout

* `init.vim` — plugin list and main config
* `keybindings.vim` — all mappings (leader is `,`)
* `essentials/` — baseline settings that should be defaults
* `functions/` — small helper functions (window moving, fzf, action menu)
* `ftplugin/` — per-filetype settings (e.g. smali fold-away of `.line` directives)
* `coc/` — coc extensions and data
* `templates/` — skeleton files for new `*.html` / `*.c` buffers
* `secrets.vim` — sourced if present, not tracked
