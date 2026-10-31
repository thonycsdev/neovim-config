# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal Neovim configuration in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. It has no build, lint or test suite.

## Verifying changes

- Check that the config loads without errors: `nvim --headless +qa` (errors print to stderr)
- Install, update or clean plugins to match the specs: `nvim --headless "+Lazy! sync" +qa`
- Restore the plugin versions pinned in `lazy-lock.json`: `nvim --headless "+Lazy! restore" +qa`
- Check health: `nvim --headless "+checkhealth" +qa`, or run `:checkhealth` / `:Lazy` interactively

`lazy-lock.json` pins plugin commits. Commit it whenever plugins are added, removed or updated.

## Architecture

`init.lua` loads three modules in this order, and the order matters:

1. `lua/config/options.lua`: editor options (`vim.opt`)
2. `lua/config/keybinds.lua`: sets `vim.g.mapleader = " "` plus global keymaps. It has to run before lazy so that `<leader>` mappings in plugin specs use the right leader.
3. `lua/config/lazy.lua`: bootstraps lazy.nvim (clones it into `stdpath("data")` if it's missing), then calls `setup` with `{ import = "plugins" }`

Every file in `lua/plugins/` returns a lazy.nvim spec (a single spec table or a list of them), and lazy picks it up automatically. To add a plugin, either drop a new file there or add the spec to an existing file. Tiny plugins with no config go in `oneliners.lua`.

Conventions:
- Plugin-specific keymaps live inside that plugin's `config` function, as in `telescope.lua`. `keybinds.lua` holds only global, plugin-independent mappings.
- Treesitter uses the **`main` branch** (the rewrite). Its API is not the same as the old `master` branch: parsers are installed with `require('nvim-treesitter').install({...})`, and highlighting and indent are turned on per filetype from a `FileType` autocmd (`vim.treesitter.start()`). There is no `nvim-treesitter.configs` / `ensure_installed`. To support a new language, add it to both the install list and the autocmd `pattern`.
- The colorscheme is tokyonight, with a transparent `Normal` background applied right after `colorscheme` in `colors.lua`.
- `telescope-fzf-native` builds with `make`, so a C toolchain is needed.
