# My Vim config

![Screenshot of Vim](./screenshot/vimrc.png)

## Table of contents

<!-- vim-markdown-toc GFM -->

* [Stack](#stack)
* [Plugins](#plugins)
* [Install](#install)
* [Layout](#layout)

<!-- vim-markdown-toc -->

## Stack

* Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug), with per-filetype/per-command lazy loading for language and utility plugins
* LSP: native neovim LSP via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), servers installed by [mason.nvim](https://github.com/mason-org/mason.nvim) (`:Mason`, `<space>e`)
* Completion: [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) — `Tab` to open/cycle, `Enter` to confirm, `<C-Space>` to trigger
* Syntax highlighting: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`main` branch), with regex syntax plugins only for languages without a parser (smali, vcl, caddy, haproxy, logstash, cql, openscad, blade)
* Statusline: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) with dracula theme, native diagnostics + LSP status
* Git: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) for the gutter, [fugitive](https://github.com/tpope/vim-fugitive) + [gv.vim](https://github.com/junegunn/gv.vim) for everything else
* Fuzzy finding: [fzf.vim](https://github.com/junegunn/fzf.vim) (`<C-p>` files, `<M-p>` ripgrep)
* AI: [copilot.vim](https://github.com/github/copilot.vim) inline suggestions (`<S-Tab>` to accept); chat/agent work happens in Claude Code, not in vim
* Go: [vim-go](https://github.com/fatih/vim-go) for tooling (`:GoTest`, `:GoFillStruct`, delve) — its LSP features are disabled in favor of native gopls

Key LSP bindings (leader is `,`): `gd`/`gy`/`gi`/`gr` gotos, `K` hover, `[c`/`]c` diagnostics, `<leader>rn` rename, `<leader>a`/`<leader>s` code actions, `<leader>f`/`:Format` format, `<space>a` diagnostic list, `<space>o`/`<space>s` symbols, `<leader>jsd` doc comments (Neogen).

Note on version managers: init.vim resolves the global asdf node once at startup and prepends its bin dir to `PATH`, so language servers are immune to projects pinning old node versions via `.tool-versions`.

## Plugins

What each plugin provides and how to trigger it. Leader is `,`.

### UI

* **gitsigns.nvim** — git change markers in the sign column; also does hunk staging/reset/preview and line blame via `:Gitsigns <subcommand>` (unmapped)
* **vim-fugitive** — git inside vim: `:Git` anything, `:Git blame`, `:Gdiffsplit!` for 3-way merge conflict resolution
* **committia.vim** — splits the commit-message window into message/status/diff automatically
* **vim-repeat** — makes `.` repeat plugin actions (surround, etc.), not just native edits
* **vim-peekaboo** — shows register contents in a sidebar when you hit `"` or `@`
* **lualine.nvim** — statusline (dracula theme, native diagnostics, LSP progress); **nvim-web-devicons** supplies its icons
* **vim-numbertoggle** — relative line numbers in normal mode, absolute in insert/unfocused
* **vim-css-color** — paints color literals (`#abcdef`) in their actual color
* **vim-remembrall** — shows matching mappings when you pause mid-keybinding
* **vim-better-whitespace** — highlights trailing whitespace; `:StripWhitespace` cleans it
* **vim-rooter** — auto-`cd`s to the project root (nearest `.git`)
* **vim-searchindex** — shows `[3/17]` match position when searching
* **camelcasemotion** — `w`/`b`/`e`/`ge` stop at camelCase/snake_case boundaries; `ci,w` changes one segment
* **vista.vim** — symbol outline sidebar from LSP: `<leader>tb` or the `tb` chord
* **splitjoin.vim** — `gS` splits a one-liner into multiple lines, `gJ` joins them back
* **gv.vim** — `:GV` commit browser (fugitive-based)
* **istanbul.vim** — JS test coverage overlay: `<leader>ir` reads `.nyc_output`
* **vim-illuminate** — highlights other occurrences of the symbol under the cursor (LSP-aware)
* **copilot.vim** — inline AI suggestions; `<S-Tab>` accepts, `<M-]>`/`<M-[>` cycle alternatives, `:Copilot panel` lists candidates
* **dracula/vim** — the colorscheme

### Files and search

* **fzf** + **fzf.vim** — `<C-p>` files (ripgrep source), `<M-p>` live grep, `<C-b>` buffer switch; also `:History`, `:Commits`, `:Maps`
* **far.vim** — project-wide find & replace with preview: `:Far foo bar **/*.js` then `:Fardo`

### Syntax

* **nvim-treesitter** — AST-based highlighting for ~25 languages, `:TSUpdate` to update parsers
* **vim-blade / vcl / logstash / ansible-vim / vim-smali / cql / caddy / openscad / haproxy** — syntax for languages treesitter has no parser for, each loads only for its filetype; smali pairs with `ftplugin/smali.vim` fold setup
* **vim-dotenv** — `.env` file support (`:Dotenv`)
* **vim-markdown** — markdown extras; kept mainly for `:TableFormat` (`<leader>ft`)

### Code generation and helpers

* **vim-markdown-toc** — `:GenTocGFM` generates this README's TOC
* **nerdcommenter** — `<leader>c<space>` toggle comments (and friends)
* **emmet-vim** — `<C-y>,` expands CSS-like abbreviations to HTML; visual `<C-y>,` wraps selection in a tag
* **vim-surround** — `cs"'` change quotes, `ysiw)` wrap word, `ds(` delete pair
* **vim-closetag** — auto-closes HTML/XML tags when typing `>`

### LSP and completion

* **nvim-lspconfig** — server configs for native LSP (gotos, hover, rename, code actions — see Stack)
* **mason.nvim** + **mason-lspconfig.nvim** — install/manage language servers: `:Mason` or `<space>e`
* **nvim-cmp** + **cmp-nvim-lsp/buffer/path** — completion menu fed by LSP, buffer words and file paths
* **nvim-autopairs** — auto-closes brackets/quotes, integrates with cmp confirms
* **neogen** — generates doc comments (JSDoc etc.) from signatures: `<leader>jsd` / `:Neogen`

### Efficiency

* **editorconfig-vim** — honors `.editorconfig` per project
* **vim-arpeggio** — chord mappings: `jk`→Esc, `fn`→function, `rq`→require, `ct`→const, `lt`→let, `wq`→save-quit, `tb`→Vista
* **gist-vim** (+ **webapi-vim**) — `<C-g>` posts buffer as private gist, `<C-M-g>` public
* **vim-gnupg** — transparently edits `*.gpg` encrypted files

### Language tooling

* **vim-go** — Go tooling (`:GoTest`, `:GoFillStruct`, `:GoAlternate`, delve debugging); LSP duties disabled in favor of gopls

### Misc

* **vim-devicons** — filetype icons for fzf and friends
* **vim-checkbox** — `<leader>tt` toggles `- [ ]` checkboxes in markdown

## Install

Requirements:

* neovim (recent; treesitter uses the `main` branch which needs 0.11+)
* node (copilot.vim and the JS-based language servers)
* `tree-sitter` CLI (`npm install -g tree-sitter-cli` or `pacman -S tree-sitter-cli`) — needed to compile treesitter parsers
* `rg` (ripgrep) — fzf file source and `:Rg` grep

Then:

```bash
git clone git@github.com:nemanjan00/vim.git
cd vim
./install.sh
```

Open nvim and run `:PlugInstall`. Treesitter parsers and language servers (mason `ensure_installed`) install themselves on first start.

## Layout

* `init.vim` — plugin list and main config (LSP/cmp/treesitter setup in the lua block at the end)
* `keybindings.vim` — all mappings (leader is `,`)
* `essentials/` — baseline settings that should be defaults
* `functions/` — small helper functions (window moving, fzf)
* `ftplugin/` — per-filetype settings (e.g. smali fold-away of `.line` directives)
* `coc/`, `coc-settings.json` — legacy coc config, kept only to make reverting the native-LSP migration easy; delete once the new stack has proven itself
* `templates/` — skeleton files for new `*.html` / `*.c` buffers
* `secrets.vim` — sourced if present, not tracked
