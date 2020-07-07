set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim')

Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ngemily/vim-vp4'
Plug 'tpope/vim-commentary'
Plug 'vheon/vim-polyglot'
Plug 'jlanzarotta/bufexplorer'
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'iCyMind/NeoSolarized'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()            " required
filetype plugin indent on    " required

"call togglebg#map("<F5>")

set foldmethod=indent
set foldlevel=99
set noswapfile
set spelllang=en_us

" pep8 standard
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set colorcolumn=80 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set encoding=utf-8
set nu

let python_highlight_all=1
syntax on
set hidden

" relative line numbers
set nu rnu

let g:airline_whitespace_disabled=1
let g:airline_powerline_fonts=1
let g:airline_detect_whitespace=0
let g:vp4_perforce_executable='p4q'

" old stuff
set history=500
set autoread
let mapleader = ","
nmap <leader>w :w!<cr>
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set magic
set showmatch
set textwidth=0
set colorcolumn=80
set noerrorbells
set novisualbell
set shiftwidth=4
set expandtab
set tabstop=4
set nowrap
set splitright
set termguicolors
:inoremap jk <Esc>
inoremap {<CR> {<CR>}<Esc>ko
set noshowmode
set viminfo='15
nnoremap <silent> <Leader>c :let @/=""<CR>
" make // search in visual mode
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'


if has("persistent_undo")
	set undodir=$HOME/.undodir/
	set undofile
endif

autocmd Filetype xml setlocal tabstop=2 shiftwidth=2
autocmd Filetype xsd setlocal tabstop=2 shiftwidth=2

set cmdheight=1
set background=light
colorscheme NeoSolarized

let g:neosolarized_vertSplitBgTrans = 1

set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum
set diffopt+=vertical

let g:airline_skip_empty_sections=1
let g:airline_theme='solarized'

let g:clang_format#auto_format = 0

let g:gist_detect_filetype = 1

let g:netrw_banner=0

" Startify don't change working dir. Also makes startify smart and change to
" vcs root
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

" COC
let g:coc_disable_startup_warning = 1
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
command! -nargs=0 Format :call CocAction('format')
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Format selection
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

set statusline^=%{coc#status()}

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> <C-p> :Files<CR>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" FZF related configs.

" vim-fzf custom command passing options to Ag. If called with ! (Bang), then
" show fzf with preview of the file itself.
function! s:ag_with_opts(arg, bang)
  let tokens  = split(a:arg)
  let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"'))
  let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
  call fzf#vim#ag(query, ag_opts, a:bang ? fzf#vim#with_preview('right:40%') : {'down': '40%'})
endfunction

autocmd VimEnter * command! -nargs=* -bang Ag call s:ag_with_opts(<q-args>, 1)



let g:fzf_buffers_jump = 1
nmap <C-b> :Buffers<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
