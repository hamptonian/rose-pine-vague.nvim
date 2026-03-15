# rose-pine-vague.nvim

A [Rose Pine](https://github.com/rose-pine/neovim) variant inspired by [Vague](https://github.com/vague-theme/vague.nvim), featuring a darker background and higher contrast pine color.

## Features

- 🌑 Dark background (`#141415`) inspired by Vague
- 🌲 Bright, high-contrast pine (`#5ec8e0`) for keywords and constants
- ✨ Enhanced color palette with brighter, more vibrant accent colors
- 🎨 Full support for Treesitter, LSP diagnostics, and popular plugins
- ⚡ Configurable options for italics, contrast, and color overrides

## Installation

### lazy.nvim

```lua
{
  "hamptonian/rose-pine-vague.nvim",
  priority = 1000,
  config = function()
    require("rose-pine-vague").setup()
    vim.cmd.colorscheme("rose-pine-vague")
  end,
}
```

### Local Development

```lua
{
  dir = vim.fn.expand("~/.config/nvim-colors/rose-pine-vague"),
  priority = 1000,
  config = function()
    require("rose-pine-vague").setup()
    vim.cmd.colorscheme("rose-pine-vague")
  end,
}
```

## Configuration

```lua
require("rose-pine-vague").setup({
  -- Enable italics for comments (default: true)
  italics = true,

  -- Enable legacy Vim highlight groups (default: true)
  legacy_highlights = true,

  -- Override specific colors in the palette
  overrides = {
    -- base = "#141415",
    -- pine = "#5ec8e0",
    -- Add any color from palette.lua to override
  },
})
```

## Palette

| Color      | Hex       | Description                    |
|------------|-----------|--------------------------------|
| `base`     | `#141415` | Background (Vague dark)        |
| `surface`  | `#1a1b26` | Slightly brighter surface      |
| `overlay`  | `#232333` | Popup backgrounds              |
| `muted`    | `#7a7692` | Muted text                     |
| `subtle`   | `#9a96b8` | Subtle text                    |
| `text`     | `#e6e6f0` | Main text                      |
| `love`     | `#ef8aa2` | Errors, deletions              |
| `gold`     | `#f7ca8f` | Warnings                       |
| `rose`     | `#efcabe` | Git changes                    |
| `pine`     | `#5ec8e0` | Keywords, constants (high contrast) |
| `foam`     | `#a4d7e2` | Info, strings                  |
| `iris`     | `#c8b3eb` | Functions, hints               |
| `leaf`     | `#9abbb8` | Types, success                 |

## Supported Plugins

- Treesitter
- LSP Diagnostics
- Telescope
- GitSigns
- WhichKey
- Noice/Notify
- Aerial
- Mini Statusline
- Todo Comments

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

### Repository Rules

This repository has branch protection rules on `main`:

- **No force pushes** - History is preserved
- **Pull requests required** - All changes must go through PRs
- **No direct pushes** - Prevents accidental commits to main
- **Branch deletion protected** - Main branch cannot be deleted

### Development Setup

```bash
# Clone the repo
git clone https://github.com/hamptonian/rose-pine-vague.nvim.git
cd rose-pine-vague.nvim

# Install in Neovim for testing (symlink method)
ln -s $(pwd) ~/.local/share/nvim/site/pack/plugins/start/rose-pine-vague.nvim

# Or use lazy.nvim local path in your config
```

## License

MIT
