set nocompatible

" Plugins
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

" Theme
set termguicolors
colorscheme onedark

" Copilot
let g:copilot_filetypes = {'*': v:true}

" LSP
:lua << EOF
require("mason").setup()

mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  "ansiblels",
})
mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup{}
  end
})
EOF
