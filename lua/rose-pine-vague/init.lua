-- rose-pine-vague.nvim
-- A blend of Rose Pine's aesthetic with Vague's darker background and higher pine contrast
--
-- https://github.com/hamptonian/rose-pine-vague.nvim

local M = {
  name = "rose-pine-vague",
  palette = nil,
}

-- Default configuration
M.default_config = {
  -- Set background contrast: can be 'normal' or 'hard'
  contrast = "normal",

  -- Enable italics for comments
  italics = true,

  -- User can override specific colors
  overrides = {},

  -- Enable legacy highlights for compatibility
  legacy_highlights = true,
}

-- Current user config
M.config = vim.deepcopy(M.default_config)

---Setup the colorscheme with user preferences
---@param user_config? table
function M.setup(user_config)
  M.config = vim.tbl_deep_extend("force", M.config, user_config or {})
end

---Load the palette, applying any user overrides
---@return table
local function load_palette()
  local palette = require("rose-pine-vague.palette").palette

  -- Apply user palette overrides if any
  if M.config.overrides and next(M.config.overrides) then
    palette = vim.tbl_deep_extend("force", palette, M.config.overrides)
  end

  return palette
end

---Apply the colorscheme highlights
---@param palette table
local function apply_highlights(palette)
  local groups = require("rose-pine-vague.groups").get_groups(palette)

  -- Apply all highlight groups
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  -- Handle legacy highlights if needed
  if M.config.legacy_highlights then
    vim.api.nvim_set_hl(0, "SpecialKey", { fg = palette.pine })
    vim.api.nvim_set_hl(0, "NonText", { fg = palette.muted })
    vim.api.nvim_set_hl(0, "ModeMsg", { fg = palette.foam, bold = true })
    vim.api.nvim_set_hl(0, "MsgArea", { fg = palette.text })
    vim.api.nvim_set_hl(0, "MoreMsg", { fg = palette.iris })
  end
end

---Set terminal colors
---@param palette table
local function set_terminal_colors(palette)
  vim.g.terminal_color_0 = palette.base
  vim.g.terminal_color_1 = palette.love
  vim.g.terminal_color_2 = palette.foam
  vim.g.terminal_color_3 = palette.gold
  vim.g.terminal_color_4 = palette.pine
  vim.g.terminal_color_5 = palette.iris
  vim.g.terminal_color_6 = palette.leaf
  vim.g.terminal_color_7 = palette.text
  vim.g.terminal_color_8 = palette.muted
  vim.g.terminal_color_9 = palette.love
  vim.g.terminal_color_10 = palette.foam
  vim.g.terminal_color_11 = palette.gold
  vim.g.terminal_color_12 = palette.pine
  vim.g.terminal_color_13 = palette.iris
  vim.g.terminal_color_14 = palette.leaf
  vim.g.terminal_color_15 = palette.subtle
end

---Load the colorscheme (called by :colorscheme rose-pine-vague)
function M.load()
  M.palette = load_palette()
  apply_highlights(M.palette)
  set_terminal_colors(M.palette)
  vim.g.colors_name = M.name
end

-- Register as a colorscheme for Neovim
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function(args)
    if args.match == M.name then
      M.load()
    end
  end,
})

return M
