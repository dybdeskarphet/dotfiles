require "helpers/globals"
require "helpers/keyboard"

g.mapleader = ' '                                                                 -- Use Space, like key for alternative hotkeys

-- General {{{
nm('<esc>', ':noh<CR>')
nm('<A-,>', '<Cmd>BufferPrevious<CR>')
nm('<A-.>', '<Cmd>BufferNext<CR>')
 -- }}}

-- LSP {{{
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>' )                                      -- Hover object
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')                                -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')                                     -- Rename an object
nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                                -- Go to declaration
 -- }}}

-- NvimTree {{{
nm('<leader>v', '<cmd>NvimTreeToggle<CR>')                                        -- Toggle file explorer
 -- }}}

-- Neoformat {{{
nm('K', '<Cmd>Neo<CR>')
 -- }}}

-- Markdown Preview {{{
nm('S', '<Cmd>MarkdownPreview<CR>')
-- }}}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
