-- Shortcut Variables
local vim = vim
local api = vim.api
local map = api.nvim_set_keymap
local o = vim.o
local create_command = api.nvim_create_user_command
local cmd = api.nvim_command

-- ooooooooo.   oooo                          o8o                       
-- `888   `Y88. `888                          `"'                       
--  888   .d88'  888  oooo  oooo   .oooooooo oooo  ooo. .oo.    .oooo.o 
--  888ooo88P'   888  `888  `888  888' `88b  `888  `888P"Y88b  d88(  "8 
--  888          888   888   888  888   888   888   888   888  `"Y88b.  
--  888          888   888   888  `88bod8P'   888   888   888  o.  )88b 
-- o888o        o888o  `V88V"V8P' `8oooooo.  o888o o888o o888o 8""888P' 
--                                d"     YD                             
--                                "Y88888P'                             
--
-- 
require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
	use { 'neoclide/coc.nvim', branch = 'release' }
	use 'kyazdani42/nvim-web-devicons'
	use 'romgrk/barbar.nvim'
	use "cpea2506/one_monokai.nvim"
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
    	use {
       		'nvim-treesitter/nvim-treesitter',
        	run = function()
            		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            		ts_update()
        	end,
    	}
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
end)


-- Plugin Options
-- -- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.g["indentLine_char"] = "╎"
vim.g["mkdp_browser"] = "/usr/bin/chromium"

require("nvim-tree").setup{
	open_on_setup = true,
	ignore_buffer_on_setup = true,
}

local function tab_win_closed(winnr)
	local api = require"nvim-tree.api"
	local tabnr = vim.api.nvim_win_get_tabpage(winnr)
	local bufnr = vim.api.nvim_win_get_buf(winnr)
	local buf_info = vim.fn.getbufinfo(bufnr)[1]
	local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
	local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
	if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
		-- Close all nvim tree on :q
		if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
			api.tree.close()
		end
	else                                                      -- else closed buffer was normal buffer
		if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
			local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
			if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
				vim.schedule(function ()
					if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
						vim.cmd "quit"                                        -- then close all of vim
					else                                                  -- else there are more tabs open
						vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
					end
				end)
			end
		end
	end
end

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function ()
		local winnr = tonumber(vim.fn.expand("<amatch>"))
		vim.schedule_wrap(tab_win_closed(winnr))
	end,
	nested = true
})


-- Plugin Keymaps
cmd([[
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction
]])

cmd([[inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"]])
-- cmd([[inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()]])
map('n', '<C-P>', '<cmd>Telescope find_files<cr>', { noremap = true})
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { silent = true })
map('n', '<A-.>', '<Cmd>BufferNext<CR>', { silent = true })
map('n', '<C-Q>', '<Cmd>NvimTreeToggle<CR>', { silent = true })
map('n', 'S', '<Cmd>BufferNext<CR>', { silent = true})

-- oooooooooo.                      o8o                     
-- `888'   `Y8b                     `"'                     
--  888     888  .oooo.    .oooo.o oooo   .ooooo.   .oooo.o 
--  888oooo888' `P  )88b  d88(  '8 `888  d88' `"Y8 d88(  "8 
--  888    `88b  .oP"888  `"Y88b.   888  888       `"Y88b.  
--  888    .88P d8(  888  o.  )88b  888  888   .o8 o.  )88b 
-- o888bood8P'  `Y888""8o 8""888P' o888o `Y8bod8P' 8""888P' 
--                 
-- Settings
local options = {
	mouse = 'a',
	clipboard = 'unnamedplus',
	title = true,
	titlestring = 'NVIM: %-25.55F %a%r%m',
	number = true,
	relativenumber = true,
	cursorline = true,
	undodir = "/tmp",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

map('n', '<esc>', ':noh<CR>', { silent = true })

-- Custom Commands
create_command('Terminal', "belowright split term://zsh", { bang = true })
create_command('SpellCheck',
function(input)
	o.spell = true
	o.spellang = 'tr'
end, { bang = true }
)

create_command("WebsitePreview", [[execute "!firefox --new-window=file://%:p"]], { bang = true })
create_command("TexCreate", [[execute "!pdflatex '%' >/dev/null 2>&1" | redraw!]], { bang = true })
create_command("PoemCreate", [[w poem.txt | execute "!poemakegr '%'" | redraw!]], { bang = true})

cmd([[
function WriteCreatingDirs()
	execute ':silent !mkdir -p %:h'
	write
	endfunction
]])

create_command("W", "call WriteCreatingDirs()", { bang = true })


-- ooooooooooooo oooo                                              
-- 8'   888   `8 `888                                              
--      888       888 .oo.    .ooooo.  ooo. .oo.  .oo.    .ooooo.  
--      888       888P"Y88b  d88' `88b `888P"Y88bP"Y88b  d88' `88b 
--      888       888   888  888ooo888  888   888   888  888ooo888 
--      888       888   888  888    .o  888   888   888  888    .o 
--     o888o     o888o o888o `Y8bod8P' o888o o888o o888o `Y8bod8P' 
--
-- Theme
require("one_monokai").setup({
    colors = {
        bg = "#1B1D1F",
    },
})

-- Statusline
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
