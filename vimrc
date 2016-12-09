set nocompatible              " be iMproved, required
filetype off                  " required

" -------------------------------------------------
"  Leader and shortcuts
" -------------------------------------------------
let g:mapleader = "\<space>"
nnoremap <silent><leader>q :quit<cr>
nnoremap <silent><leader>w :write<cr>

inoremap jj <esc>

" -------------------------------------------------
"  Vundle
" -------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" -------------------------------------------------
"  Plugins
" -------------------------------------------------
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'Shougo/denite.nvim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" -------------------------------------------------
"  CtrlP
" -------------------------------------------------
let g:ctrlp_working_path_mode = 0
let g:ctrlp_root_markers = ['Gemfile', 'package.json']
let g:ctrlp_working_path_mode = 'r'

" -------------------------------------------------
" Denite
" -------------------------------------------------
nnoremap <silent><leader>uu               :Denite -buffer-name=file_rec
  \ file_rec<cr>
nnoremap <silent><leader>um               :Denite -buffer-name=models
  \ -path=`getcwd()`/app/models
  \ file_rec<cr>
nnoremap <silent><leader>uc               :Denite -buffer-name=controllers
  \ -path=`getcwd()`/app/controllers
  \ file_rec<cr>
nnoremap <silent><leader>uv               :Denite -buffer-name=views
  \ -path=`getcwd()`/app/views
  \ file_rec<cr>
nnoremap <silent><leader>uj               :Denite -buffer-name=javascripts
  \ -path=`getcwd()`/app/assets/javascripts
  \ file_rec<cr>
nnoremap <silent><leader>us               :Denite -buffer-name=specs
  \ -path=`getcwd()`/spec
  \ file_rec<cr>
nnoremap <silent><leader>ub               :Denite -buffer-name=buffers
  \ buffer<cr>

" ------------------------------------------------
" The Silver Searcher
" ------------------------------------------------
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" ------------------------------------------------
" NERDtree
" ------------------------------------------------
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>nf :NERDTreeFind<CR>


syntax on
set number
set relativenumber
set expandtab
set shiftwidth=2
set softtabstop=2
