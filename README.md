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

## License

MIT
