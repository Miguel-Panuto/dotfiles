# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository

Personal Neovim configuration, deployed via GNU Stow from a parent `dotfiles` repo. The actual install path is `~/.config/nvim/` (this directory is `nvim/.config/nvim/` inside the stow tree).

## Formatting

Lua is formatted with `stylua` using `.stylua.toml` (2-space indent, 160 cols, single quotes, no-paren calls). Run:

```sh
stylua .
```

## Plugin management

Plugins are managed by Neovim's built-in `vim.pack` (requires nvim 0.12+). The loader lives at `lua/miguelpanuto/pack.lua`:

1. Reads every module named in its `module_names` list from `lua/miguelpanuto/plugins/`.
2. Registers a `PackChanged` autocmd that dispatches `build` hooks for `install`/`update`.
3. Calls `vim.pack.add(...)` once with all specs (parallel clone via Git, into `$XDG_DATA_HOME/nvim/site/pack/core/opt/`).
4. Calls each spec's `setup()` in declaration order.

**Each `plugins/<name>.lua` returns a table** with: `src` (required HTTPS git URL), optional `name` (when the repo dir name is generic, e.g. `catppuccin/nvim` → `name = 'catppuccin'`), optional `version` (branch/tag/commit or `vim.version.range(...)`), optional `setup` (called after `vim.pack.add`), optional `build` (function called from `PackChanged` for install/update; if it needs the plugin's own commands, call `vim.cmd.packadd(data.spec.name)` first — `PackChanged` fires before `:packadd`). A file may also `return nil` to skip itself conditionally (see `telescope_fzf_native.lua`).

**Adding a plugin**: create `plugins/<name>.lua` returning the spec, then append `'<name>'` to `module_names` in `pack.lua`. **Removing**: delete the entry from `module_names`, restart, then `:lua vim.pack.del({ '<plugin-dir-name>' })` to clean disk.

Lockfile at `nvim-pack-lock.json` (in this directory) tracks pinned revisions — currently `.gitignore`d. Inside Neovim: `:lua vim.pack.update()` (interactive review buffer), `:lua = vim.pack.get()` (list), `:Mason` (LSP/tooling installer, configured in `plugins/lsp.lua`).

**nvim-treesitter is pinned to `master`** — the default `main` branch is the rewrite and removed `require('nvim-treesitter.configs')`.

## Architecture

Entry point chain:

1. `init.lua` — requires the `miguelpanuto` module, then calls `Define_Colorschema 'tokyodark'`.
2. `lua/miguelpanuto/init.lua` — loads, in order: `opts` → `keymaps` → `pack` → `color`.
3. `lua/miguelpanuto/color.lua` — defines the global `Define_Colorschema(name)` function (note: global, used from top-level `init.lua` after plugins load). It sets the colorscheme and forces transparent backgrounds on `Normal`, `NormalFloat`, `NormalNC`, `SignColumn`, `EndOfBuffer`.

Changing the active colorscheme is done by editing the argument to `Define_Colorschema` in the top-level `init.lua`. The corresponding plugin spec must exist under `plugins/` and be listed in `lazy.lua`.

Each plugin spec is one file under `lua/miguelpanuto/plugins/` returning a lazy.nvim spec table — keep new plugins to that pattern and register them in `lazy.lua`.
