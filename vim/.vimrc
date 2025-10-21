" 设置行号显示
set number

" 设置相对行号（有时更便于跳转）
set relativenumber

" 设置默认缩进为 4 个空格
set tabstop=4
set shiftwidth=4
set expandtab

" 自动缩进
set smartindent
set autoindent





call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/tagbar'
" 结束插件配置
call plug#end()
let g:airline_theme='base16_gruvbox_dark_soft'
set background=dark
colorscheme gruvbox
set termguicolors
nmap <C-u> :TagbarToggle<CR>
