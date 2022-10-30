" Options

" clojure
" let g:sexp_enable_insert_mode_mappings = 0
" let g:sexp_filetypes = 'clojure'
" let g:rainbow_active = 1

" editing
set expandtab
set tabstop=2
set softtabstop=2
set sw=2
set shiftround
" No mouse
" set mouse=a

set encoding=utf-8
set fileencoding=utf-8

" Key Bindings

" variables
let mapleader = ","
let maplocalleader = "\\"

" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1

" editing vimrc
nnoremap <leader>ve :split ~/dots/init.vim<cr>
nnoremap <leader>vs :!bash ~/dots/dots.sh<cr><cr>:source ~/dots/init.vim<cr>

" normal bindings
noremap <c-u> viwU
nnoremap H 0
nnoremap L $
nnoremap J }
nnoremap K {
vnoremap H 0
vnoremap L $
vnoremap J }
vnoremap K {
nnoremap <leader>r :r!
nnoremap <leader>f gqip
nnoremap <leader><Space> :%s/\s\+$//<cr>
nnoremap <leader>/ :noh<cr>
nnoremap Q <nop>

" surrounding
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel

" Automatic Bindings
augroup everything
autocmd!

" buffers
autocmd BufWrite * mkview
autocmd BufRead  * silent! loadview

" commenting
autocmd FileType {javascript,c,cpp} nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType {python,ruby,sh,perl} nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
autocmd FileType {tex,plaintex} nnoremap <buffer> <localleader>c I%<esc>

" compile or run
autocmd FileType {tex,plaintex} nnoremap <buffer> <localleader>r :!pdflatex %<esc>

" Syntax
autocmd BufNewFile,Bufread *.exs set syntax=elixir
autocmd BufNewFile,Bufread *.ex set syntax=elixir
autocmd BufNewFile,Bufread *.ts set syntax=typescript
autocmd BufNewFile,Bufread *.tsx set syntax=typescript
autocmd BufNewFile,Bufread *.tf set syntax=terraform
autocmd BufNewFile,Bufread *.pug set syntax=pug
autocmd BufNewFile,Bufread *.graphql set syntax=graphql

" netrw
autocmd FileType netrw setl bufhidden=delete

" Plugins
" start by loading plugin.vim
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load some plugins
" Must also do :CocInstall coc-tsserver and then go to :CocList extensions and enable, because the tsserver doesn't play nice with Plug
call plug#begin("~/.local/share/nvim/plugged")
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'sheerun/vim-polyglot'
" Plug 'airblade/vim-gitgutter'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
" Plug 'luochen1990/rainbow'
" Plug 'guns/vim-sexp'
" Plug 'tpope/vim-sexp-mappings-for-regular-people'
call plug#end()

" ag
nnoremap <leader>a :Ag<space>

" airline
" let g:airline_theme='solarized'

" display
syntax on
" set termguicolors
" colorscheme base16-default-dark
" set background=light
set number
set ruler
set guicursor=
set laststatus=0

" No autoindent, dammit
set nocindent
set nosmartindent
set noautoindent
set indentexpr=
filetype indent off
set formatoptions-=cro

" CoC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = 'sp'
nnoremap gd :call CocAction('jumpDefinition')<cr>

" End Automatic Bindings
augroup END

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
