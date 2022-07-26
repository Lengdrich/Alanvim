-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

local enable_lsp_filetype = {
  'go',
  'lua',
  'sh',
  'rust',
  'c',
  'cpp',
  'typescript',
  'typescriptreact',
}

plugin({
  'neovim/nvim-lspconfig',
  require= {'williamboman/nvim-lsp-installer'},
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  ft = enable_lsp_filetype,
  config = conf.nvim_lsp,
})

plugin({'williamboman/nvim-lsp-installer'})

plugin({ 'glepnir/lspsaga.nvim', after = 'nvim-lspconfig' })

plugin({
  'hrsh7th/nvim-cmp',
  event = 'BufReadPre',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
  },
})

plugin({ 'L3MON4D3/LuaSnip', event = 'InsertEnter', config = conf.lua_snip })
plugin({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.auto_pairs })
