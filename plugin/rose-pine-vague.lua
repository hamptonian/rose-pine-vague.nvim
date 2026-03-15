-- rose-pine-vague.nvim
-- A blend of Rose Pine's aesthetic with Vague's darker background and higher pine contrast
--
-- https://github.com/hamptonian/rose-pine-vague.nvim

if vim.g.loaded_rose_pine_vague then
  return
end
vim.g.loaded_rose_pine_vague = true

-- Register the colorscheme
vim.api.nvim_create_user_command("RosePineVague", function()
  vim.cmd.colorscheme("rose-pine-vague")
end, { desc = "Apply rose-pine-vague colorscheme" })
