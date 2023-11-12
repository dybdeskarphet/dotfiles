--[[
  File: trouble.lua
  Description: Configuration of trouble.nvim
  See: https://github.com/folke/trouble.nvim
]]

local trouble = require("trouble")

trouble.setup({
    icons = true, -- use devicons for filenames
    signs = {
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "",
    },
})
