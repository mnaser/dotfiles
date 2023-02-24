" Plugins
call plug#begin()
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

" Ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */roles/*/tasks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */roles/*/handlers/*.yml set filetype=yaml.ansible

