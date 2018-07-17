call plug#begin('~/.local/share/nvim/plugged')

Plug 'chriskempson/base16-vim' " colors

Plug 'sheerun/vim-polyglot' " syntax etc

Plug 'w0rp/ale' " linting and fixing

"" project find and fuzzy file open
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary' " easy comment in/out

Plug 'jiangmiao/auto-pairs' " auto add the `}` after i type `{`

Plug 'tpope/vim-sleuth' " autodetect indent settings per file

Plug 'farmergreg/vim-lastplace' " reopen files in last cursor position

Plug 'itchyny/lightline.vim' " simple status line

Plug 'airblade/vim-gitgutter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " in shougo we trust

"" try
""" Plug 'vimwiki/vimwiki'

call plug#end()


let base16colorspace = 256
colorscheme base16-eighties



" ale
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_linters = {
\	'javascript': [
\		'eslint',
\		'flow',
\		],
\}
let g:ale_fixers = {
\	'javascript': [
\		'eslint',
\	],
\}
let g:ale_fix_on_save = 1


" fzf
nnoremap <c-p> :GFiles<cr>
nnoremap <d-s-f> :Ag<space>


" auto-pairs
au Filetype vim let b:AutoPairs = {'(': ')', '[': ']', '{': '}', "'": "'", '`': '`'} " dont auto-insert `\"` in vimscripts


" lightline
set noshowmode " lightline shows the mode, so no need for that
let g:lightline = {
\	'colorscheme': 'Tomorrow_Night_Eighties',
\}


" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
