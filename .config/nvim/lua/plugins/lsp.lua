vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/folke/lazydev.nvim',
})

require("lazydev").setup({});

vim.lsp.enable('lua_ls')
