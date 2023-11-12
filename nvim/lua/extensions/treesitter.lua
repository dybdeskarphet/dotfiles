--[[
  File: treesitter.lua
  Description: Configuration of tree-sitter
  See: https://github.com/tree-sitter/tree-sitter
]]
require'nvim-treesitter.configs'.setup {

  -- Needed parsers
  ensure_installed = { "c", "comment", "diff", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "html", "http", "java", "javascript", "json", "kotlin", "lua", "latex", "markdown_inline", "matlab", "python", "scss", "sql", "sxhkdrc", "todotxt", "vim", "vimdoc", "yaml"},

  -- Install all parsers synchronously
  sync_install = false,

  -- Подсветка
  highlight = {
    -- Enabling highlight for all files
    enable = true,
    disable = {},
  },

  indent = {
    -- Disabling indentation for all files
    enable = true,
    disable = { "javascript"},
  },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = false,
  }
}
