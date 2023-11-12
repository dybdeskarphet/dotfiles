--[[
  File: plugins.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]

require "helpers/globals"

return {

  -- Nvim Web Devicons {{{
  "nvim-tree/nvim-web-devicons",
  -- }}}

  -- Mason {{{
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "extensions.mason"
    end
  },
  -- }}}

  -- NvimTree {{{
 {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
    config = function()
      require "extensions.nvimtree"
    end
 },
  -- }}}

  -- Git Signs{{{
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require "extensions.gitsigns"
    end
  },
  -- }}}

  -- Trouble {{{
  {
   "folke/trouble.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   opts = {
    icons = true, -- use devicons for filenames
    signs = {
      -- icons / text used for a diagnostic
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "",
    },
   },
  },
  -- }}}

  -- TreeSitter {{{
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "extensions.treesitter"
    end
  },
  -- }}}

  -- Theme: One Monokai {{{one-monokai
  {
    "cpea2506/one_monokai.nvim",
    lazy = false,
    config = function ()
      require "extensions.colorscheme.one-monokai"
    end
  },
  -- }}}

  -- Theme: Sonokai {{{
  {
  'sainnhe/sonokai',
  lazy = false,
  config = function ()
    require "extensions.colorscheme.sonokai"
  end
  },
  -- }}}

  -- Markdown Preview {{{
  {
   "iamcco/markdown-preview.nvim",
   build = "cd app && npm install", 
   init = function() vim.g.mkdp_filetypes = { "markdown" } end, 
   config = function()
     require "extensions.markdown-preview"
   end
  },
  -- }}}

  -- Barbar {{{
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  -- }}}

-- Lualine {{{ 
{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require "extensions.lualine"
  end
},
-- }}}

  -- LSP Kind {{{ 
  {
    'onsails/lspkind-nvim',
    lazy = true,
    config = function()
      require "extensions.lspkind"
    end
  },
  --}}}

  -- CMP {{{
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require "extensions.cmp"
    end
  },
  -- }}}

  -- nvim-ts-autotag {{{
  'windwp/nvim-ts-autotag',
  -- }}}

  -- nvim-autopairs {{{
  {
    'windwp/nvim-autopairs',

    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
    config = function()
      require "extensions.nvim-autopairs"
    end
  },
  -- }}}

-- Auto-save {{{
  { 'pocco81/auto-save.nvim'
  },
-- }}}

-- Guess Indent {{{
{
  'nmac427/guess-indent.nvim',
  config = function() require('guess-indent').setup {} end,
},

-- }}}

-- vim-markdown-toc {{{
{
   'mzlogin/vim-markdown-toc'
},
-- }}}

}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0



