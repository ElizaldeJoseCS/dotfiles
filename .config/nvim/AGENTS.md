# AGENTS.md — Neovim Config

## What this is

Single-file Neovim config (`init.lua`, ~960 lines). No monorepo, no builds, no tests. Plugin management uses Neovim's native `vim.pack` (not lazy.nvim or packer). Lockfile: `nvim-pack-lock.json`.

## Structure

Everything lives in `init.lua` in this order:
1. Colorscheme & transparent UI (lines 1–36)
2. Options (38–117)
3. Keymaps (119–201) — leader is `<Space>`
4. Autocmds (203–303)
5. Plugins via `vim.pack.add` (306–335)
6. Plugin configs (337–848) — treesitter, LSP, completion, UI
7. Floating terminal (850–957)

## Key conventions

- **Formatting**: efm-lsp handles format-on-save via `BufWritePre` autocmd. Only runs when `efm` client is attached. Languages: Lua (stylua), Python (ruff), JS/TS (prettier_d + eslint_d), Go (gofumpt), C/C++ (clang-format), Shell (shfmt).
- **LSP servers enabled**: lua_ls, pyright, bashls, ts_ls, gopls, clangd, omnisharp, efm. All configured via `vim.lsp.config()`.
- **Completion**: blink.cmp v1 (pinned; v2 migration pending — see comment at line 325).
- **Treesitter**: installed on demand at startup; parsers auto-install if missing.
- **Leader**: `<Space>` for both `mapleader` and `maplocalleader`.

## Gotchas

- `vim.opt.laststatus = 2` must stay paired with lualine's `globalstatus = false`.
- blink.cmp v2 requires `blink.lib` as a native dep outside `vim.pack` — don't upgrade without handling that.
- Obsidian vault path is OS-dependent (Manjaro/Arch → `~/Documents/Notes`, Ubuntu/WSL → `/mnt/c/Users/Rad/Documents/Notes`).
- `conceallevel = 2` is set for Obsidian; keep it if editing markdown-heavy workflows.
- Format-on-save only triggers for real file buffers (checks `buftype`, `modifiable`, and buffer name).
