--[[
  File: settings.lua
  Description: Base settings for neovim
  Info: Use <zo> and <zc> to open and close foldings
]]

require "helpers/globals"

-- Set associating between turned on plugins and filetype
cmd[[filetype plugin on]]

-- Disable comments on pressing Enter
cmd[[autocmd FileType * setlocal formatoptions-=cro]]

-- Tabs {{{
opt.expandtab = true                -- Use spaces by default
opt.shiftwidth = 2                  -- Set amount of space characters, when we press "<" or ">"
opt.tabstop = 2                     -- 1 tab equal 2 spaces
opt.smartindent = true              -- Turn on smart indentation. See in the docs for more info
-- }}}

-- Clipboard {{{
opt.clipboard = 'unnamedplus' -- Use system clipboard
opt.fixeol = false -- Turn off appending new line in the end of a file
opt.undodir = "/tmp"
-- }}}

-- Folding {{{
opt.foldmethod = 'syntax'
-- }}}

-- Search {{{
opt.ignorecase = true               -- Ignore case if all characters in lower case
opt.joinspaces = false              -- Join multiple spaces in search
opt.smartcase = true                -- When there is a one capital letter search for exact match
opt.showmatch = true                -- Highlight search instances
-- }}}

-- Window {{{
opt.title = true
opt.titlestring = 'NVIM: %-25.55F %a%r%m'
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new vertical splits to right
-- }}}

-- Wild Menu {{{
opt.wildmenu = true
opt.wildmode = "longest:full,full"
-- }}}

-- Default Plugins {{{
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
-- }}}

-- Change Alacritty Color {{{

function Sad(line_nr, from, to, fname)
  vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname)) 
end

function LeaveColor() 
  Sad('54', "0x232529", "0x040302", '~/.config/alacritty/alacritty.yml')
  Sad('14', "1.0", "0.90", '~/.config/alacritty/alacritty.yml')
end

function EnterColor()
  Sad('54', "0x040302", "0x232529", '~/.config/alacritty/alacritty.yml')
  Sad('14', "0.90", "1.0", '~/.config/alacritty/alacritty.yml')
end

vim.cmd([[
  augroup ChangeAlacrittyPadding
   au! 
   au VimEnter * lua EnterColor()
   au VimLeavePre * lua LeaveColor()
  augroup END 
]])
-- }}}

-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1
