call plug#begin('~/.local/share/nvim/plugged')

Plug 'chriskempson/base16-vim' " colors

Plug 'sheerun/vim-polyglot' " syntax etc

Plug 'w0rp/ale' " linting and fixing

"" project find and fuzzy file open
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"" try
""" Plug 'vimwiki/vimwiki'

call plug#end()


let base16colorspace = 256
colorscheme base16-eighties


" ale
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_linters = {'javascript': ['eslint', 'flow']}
let g:ale_fixers = {'javascript': ['eslint']}


" fzf
nnoremap <c-p> :GFiles<cr>
nnoremap <d-s-f> :Ag<space>

