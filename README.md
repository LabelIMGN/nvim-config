# Neovim Configuration

This is a customized Neovim setup with support for multiple languages including Lua, Python, C/C++, Rust, and Godot development.

## Features

- LSP support for multiple languages
- File explorer with NvimTree
- Fuzzy finding with Telescope
- Terminal integration with ToggleTerm
- Code completion with nvim-cmp
- Syntax highlighting with Treesitter
- Auto-pairing of brackets and quotes
- Surround text functionality
- Gruvbox theme with transparent background

## Keybindings

### General

| Keybinding | Mode | Description |
|------------|------|-------------|
| `Space` | Normal | Leader key |
| `<leader>h` | Normal | Clear search highlighting |
| `<C-Left>` | Normal | Resize window (decrease width) |
| `<C-Right>` | Normal | Resize window (increase width) |
| `<C-Up>` | Normal | Equalize window sizes |
| `<C-Down>` | Normal | Increase window width by 90 |
| `<A-k>` | Visual | Move selected lines up |
| `<A-j>` | Visual | Move selected lines down |
| `<C-k>` | Normal | Navigate to window above |
| `<C-h>` | Normal | Navigate to window left |
| `<C-l>` | Normal | Navigate to window right |
| `<C-j>` | Normal | Navigate to window below |
| `<leader>d` | Normal | Show diagnostics |

### File Navigation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>e` | Normal | Toggle NvimTree file explorer |
| `<C-p>` | Normal | Find files with Telescope |
| `<Space><Space>` | Normal | Show recent files |
| `<Space>fg` | Normal | Live grep (search in files) |
| `<Space>fh` | Normal | Search help tags |

### Terminal

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-\>` | Any | Toggle terminal |

### LSP

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code action |
| `gd` | Normal | Go to definition |
| `gi` | Normal | Go to implementation |
| `K` | Normal | Show hover information |
| `gr` | Normal | Show references |

### Rust-Specific

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<Leader>h` | Normal | Hover actions (in Rust files) |
| `<Leader>a` | Normal | Code action group (in Rust files) |

### Godot-Specific

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>gc` | Normal | Connect to Godot (in GDScript files) |
| `<leader>gr` | Normal | Run current scene (in GDScript files) |
| `<leader>gf` | Normal | Format GDScript (in GDScript files) |

### Completion

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-p>` | Insert | Select previous item |
| `<C-n>` | Insert | Select next item |
| `<S-Tab>` | Insert | Select previous item |
| `<Tab>` | Insert | Select next item |
| `<C-S-f>` | Insert | Scroll docs up |
| `<C-f>` | Insert | Scroll docs down |
| `<C-Leader>` | Insert | Complete |
| `<C-e>` | Insert | Close completion menu |
| `<CR>` | Insert | Confirm completion |

## Potential Keybinding Conflicts

There are a few potential keybinding conflicts in your configuration:

1. **`<C-p>`** is used for both:
   - Finding files with Telescope (normal mode)
   - Selecting previous item in completion menu (insert mode)
   
   Since these are in different modes, they won't directly conflict but may be confusing.

2. **`<Leader>h`** is used for both:
   - Clearing search highlighting (global)
   - Rust hover actions (in Rust files only)
   
   This will work as expected since the Rust binding is only active in Rust buffers, but you might consider using a different binding for one of them for consistency.

3. **`<leader>a`** is used for Rust code action group but this is buffer-local so it shouldn't conflict with other mappings.

## Configuration Structure

Your Neovim configuration is organized as follows:

- `init.lua`: Main configuration file
- `lua/core/keymaps.lua`: Key mappings
- `lua/core/plugins.lua`: Plugin management with Packer
- `lua/core/plugin_config/`: Individual plugin configurations

## Language Server Protocol (LSP)

The configuration includes LSP support for:
- Lua (`lua_ls`)
- Python (`pylsp`, `pyright`, `ruff`)
- C/C++ (`clangd`)
- Rust (via `rust-tools`)
- GDScript (`gdscript`)
- Assembly (`asm_lsp`)
- HTML/CSS (`html`, `cssls`)

## Tips for New Users

1. Use `:PackerSync` to update/install plugins
2. The LSP servers are managed by Mason. Use `:Mason` to see available servers
3. For Godot development, make sure the Godot editor is running with the `--remote-debug` flag enabled for the connection to work
4. Terminal can be toggled with `Ctrl+\`
5. File explorer can be toggled with `Space+e`
