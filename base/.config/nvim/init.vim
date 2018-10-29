call plug#begin('~/.local/share/nvim/plugged')

Plug 'chriskempson/base16-vim' " colors

Plug 'sheerun/vim-polyglot' " syntax etc

Plug 'w0rp/ale' " linting and fixing

"" project find and fuzzy file open
Plug '/usr/local/opt/fzf' " get fzf from brew
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary' " easy comment in/out

Plug 'jiangmiao/auto-pairs' " auto add the `}` after i type `{`

Plug 'tpope/vim-sleuth' " autodetect indent settings per file

Plug 'farmergreg/vim-lastplace' " reopen files in last cursor position

Plug 'itchyny/lightline.vim' " simple status line

Plug 'airblade/vim-gitgutter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " in shougo we trust

Plug 'wesQ3/vim-windowswap'

Plug 'Alok/notational-fzf-vim'


"" try
""" Plug 'vimwiki/vimwiki'
"Plug 'sgur/vim-editorconfig'
"Plug 'chrisbra/Colorizer'


call plug#end()


let base16colorspace = 256
colorscheme base16-tomorrow


" basic
let mapleader="\<Space>"

nmap <silent> <leader>vv :edit $MYVIMRC<CR>
nmap <silent> <leader>vs :source $MYVIMRC<CR>




" ale
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_linters = {
\	'javascript': [
\		'eslint',
\		'flow',
\		'prettier',
\	],
\	'typescript': [
\		'tslint',
\		'prettier',
\	],
\}
let g:ale_fixers = {
\	'javascript': [
\		'eslint',
\		'flow',
\		'prettier',
\	],
\	'typescript': [
\		'tslint',
\		'prettier',
\	],
\}
let g:ale_fix_on_save = 1


" fzf
nnoremap <c-p> :GFiles<cr>
"nnoremap <s-c-p> :Buffers<cr>
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

" javascript
let g:javascript_plugin_flow = 1
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_noarg_arrow_function = "⬠"
let g:javascript_conceal_underscore_arrow_function = "⬢"

set conceallevel=1


" notational-fzf-vim
let g:nv_search_paths = ['~/Dropbox/Notes', 'README.md']
let g:nv_preview_direction = 'up'
let g:nv_use_short_pathnames = 1
nnoremap <silent> <d-l> :NV<cr>

" mouse
set mouse=nicr

set hidden

" autoreload changed files
set autoread
" au FocusGained,BufEnter * :checktime
au FocusGained,BufEnter * :silent! !
" autosave on buf switch
au BufWinLeave * :silent! w

" delete current file
nnoremap <leader>DF :call delete(expand('%'))<CR> | bdelete!


