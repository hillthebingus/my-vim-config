
call plug#begin(expand('~/.vim/plugged'))

""""" General purpose

" Git utilities
Plug 'tpope/vim-fugitive'

" Lsp?
Plug 'dense-analysis/ale'

" Actual lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Visual representation of diff
Plug 'airblade/vim-gitgutter'

"""" Other utilities

" Neotree but not neo
Plug 'scrooloose/nerdtree'

" Status lines thing
" Plug 'itchyny/lightline.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Indent guides
Plug 'preservim/vim-indent-guides'

" Commenting utilities
Plug 'tpope/vim-commentary'

"""" Themes

" idk
Plug 'gilgigilgil/anderson.vim'
Plug 'cocopon/iceberg.vim'
Plug 'sts10/vim-pink-moon'
Plug 'nordtheme/vim'
Plug 'AlessandroYorba/Sierra'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'wadackel/vim-dogrun'
Plug 'TheNiteCoder/mountaineer.vim'


call plug#end()

" Sets
set shiftwidth=4
set tabstop=4

set number
set relativenumber
set statusline=%f\ -\ Filetype:\ %y
let mapleader = " "

nnoremap <F2> :source ~/.vimrc<cr>:echom "-- Sourced .vimrc"<cr>:PlugInstall<cr>
nnoremap <leader>f :NERDTreeFind<cr>


"""" LSP Configuring
let g:ale_fixers = {
\	'c':['clangtidy'],
\}

let g:ale_linters = {
\	'c':['clangcheck'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_warn_about_trailing_whitespace = v:false

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"""" lightline Configuring
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"""" Indent guides configuring
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 2

"""" Airline configuring
let g:airline_theme = "zenburn"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0




"""" Vim configuring

set noshowmode
set nowrap
set laststatus=2

set mouse=a

set foldmethod=marker
set foldmarker=¿reg,?reg

set shiftwidth=2
set tabstop=2

" Color scheme
set termguicolors
set background=dark
colorscheme mountaineer

" Highlights.
syn keyword   myTodo   contained   TODO: FIXME:
highlight myTodo guibg=red guifg=yellow term=bold,italic


