--[[
  File: mason.lua
  Description: Mason plugin configuration (with lspconfig)
  See: https://github.com/williamboman/mason.nvim
]]

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "biome",
    "emmet_ls",
    "cssls",
    "pyright",
    "bashls",
    "pkgbuild_language_server",
    "dockerls",
    "gradle_ls",
    "html",
    "kotlin_language_server",
    "marksman",
    "sqlls",
    "tailwindcss",
    "yamlls",
  }
});

-- Setup every needed language server in lspconfig
mason_lspconfig.setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {}
  end,
}
