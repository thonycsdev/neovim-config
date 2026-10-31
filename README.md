# neovim-config
Latest and almost usefull configuration for neovim

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim). Leader key is `<Space>`.

## General

Defined in `lua/config/keybinds.lua`.

| Keymap | Action |
|---|---|
| `<leader>cd` | File explorer (netrw) |

## Keymap help — [which-key.nvim](https://github.com/folke/which-key.nvim)

Press `<leader>` (or `g`, `[`, `]`, `z`, ...) and wait to see the available keymaps.

| Keymap | Action |
|---|---|
| `<leader>?` | Show buffer-local keymaps |

## Fuzzy finder — [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

Uses [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) for sorting (needs `make` and a C compiler).

| Keymap | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fd` | Diagnostics |
| `<leader>fs` | Document symbols |
| `<leader>fS` | Workspace symbols |

## LSP — [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason.nvim](https://github.com/mason-org/mason.nvim)

Servers installed by [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim): `lua_ls`, `ts_ls`, `intelephense`. Keymaps are only active in buffers with an attached server.

| Keymap | Action |
|---|---|
| `K` | Hover docs |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gri` | Go to implementation |
| `go` | Go to type definition |
| `grr` | References |
| `gs` | Signature help |
| `gn` | Line diagnostics |
| `<F2>` | Rename |
| `<leader>ca` | Code action |
| `]d` / `[d` | Next / previous diagnostic (built-in) |

## Completion — [blink.cmp](https://github.com/saghen/blink.cmp)

Sources: LSP, path, snippets ([friendly-snippets](https://github.com/rafamadriz/friendly-snippets)), buffer. Insert mode:

| Keymap | Action |
|---|---|
| `<C-n>` / `<C-p>` | Next / previous item |
| `<C-y>` | Accept |
| `<C-e>` | Close menu |
| `<C-space>` | Open menu / toggle docs |
| `<Tab>` / `<S-Tab>` | Jump between snippet fields |

## Formatting — [conform.nvim](https://github.com/stevearc/conform.nvim)

Formats on save. Formatters: `stylua` (Lua), `prettier` (JS/TS/JSON), `php-cs-fixer` (PHP), falling back to the LSP formatter. Install them with `:MasonInstall stylua prettier php-cs-fixer`.

| Keymap | Action |
|---|---|
| `<leader>lf` | Format buffer / selection |

## Git — [vim-fugitive](https://github.com/tpope/vim-fugitive)

No custom keymaps; use `:Git` (e.g. `:Git`, `:Git blame`, `:Git diff`).

## Syntax — [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

`main` branch. Parsers: `lua`, `tsx`, `typescript`, `php`. Provides highlighting and indentation, no keymaps.

## Editing (built-in)

| Keymap | Action |
|---|---|
| `gc` (visual) / `gcc` | Toggle comment on selection / line |
| `gc{motion}` | Toggle comment over a motion (e.g. `gcip`) |

## UI and misc (no keymaps)

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim): colorscheme, with transparent background
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): status line
- [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors): previews color codes inline
- [vim-oscyank](https://github.com/ojroques/vim-oscyank): copy over SSH via OSC 52 (`:OSCYankVisual`)
