" to reload, :so %

set nocompatible              " be iMproved, required
filetype off                  " required


" -------------------------------------------------
"  Leader and shortcuts

let g:mapleader = "\<space>"
nnoremap <silent><leader>q :quit<cr>
nnoremap <silent><leader>w :write<cr>

inoremap jj <esc>
inoremap jk <esc>

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
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'Shougo/denite.nvim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ivalkeen/nerdtree-execute'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'w0ng/vim-hybrid'    " hybrid colour scheme 
Plugin 'suan/vim-instant-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-unimpaired'
Plugin 'prettier/vim-prettier'
Plugin 'dense-analysis/ale'
Plugin 'mattn/emmet-vim'
Plugin 'yssl/QFEnter'
 
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

call denite#custom#map('insert', "\<c-j>", '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', "\<c-k>", '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "\<c-p>", '<denite:do_action:preview>', 'noremap')
call denite#custom#map('insert', 'jk', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--hidden', '--glob', '!.git'])
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
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ------------------------------------------------
" Vim Test
" ------------------------------------------------
" run last test ran
nnoremap <leader>tt     :TestLast<cr>
" run current test file
nnoremap <leader>tf     :TestFile<cr>
" run nearest test
nnoremap <leader>tn     :TestNearest<cr>
" run all tests
nnoremap <leader>ta     :TestSuite<cr>
" run all test - fail fast
nnoremap <leader>ts     :TestSuite --next-failure<cr>
" run current test file - fail fast
nnoremap <leader>tg     :TestFile --next-failure<cr>

let test#strategy = "dispatch"
let test#ruby#rspec#executable = 'spring rspec'
" let g:docker_container = ''

" function! DockerTransform(cmd) abort
  " return 'docker exec -it ' . g:docker_container . ' ' . a:cmd
" endfunction

" let g:test#custom_transformations = {'docker':
" function('DockerTransform')}
  " let g:test#transformation = 'docker'
  " ------------------------------------------------

" ------------------------------------------------
" vim-prettier 
" ------------------------------------------------
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

" max line length that prettier will wrap on
let g:prettier#config#print_width = 80
" number of spaces per indentation level
let g:prettier#config#tab_width = 4
" single quotes over double quotes
let g:prettier#config#single_quote = 'true'
" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'
" none|es5|all
let g:prettier#config#trailing_comma = 'none'
" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'flow'

" ------------------------------------------------
" ALE
" ------------------------------------------------
scriptencoding utf-32

let g:ale_linters = {
      \   'Dockerfile': ['hadolint'],
      \   'haml': ['haml_lint'],
      \   'javascript': ['eslint', 'flow'],
      \   'jsx': ['eslint', 'flow'],
      \   'ruby': ['rubocop'],
      \   'vim': ['vint'],
      \   'yaml': ['yamllint'],
      \ }

let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \ }

nnoremap <silent><C-n> :ALENext<cr>
nnoremap <silent><C-p> :ALEPrevious<cr>
nnoremap <silent><localleader>f   :ALEFix<cr>

let g:ale_sign_column_always = 1
let g:ale_sign_error = '••'
let g:ale_sign_warning = '••'

highlight link ALEErrorSign DiffDelete
highlight link ALEError DiffDelete

highlight link ALEWarningSign Todo
highlight link ALEWarning Todo

let g:ale_echo_msg_format = '%linter%: %s'

" ------------------------------------------------
" vim-emmet
" ------------------------------------------------
let g:user_emmet_leader_key='<c-e>'

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}


" ------------------------------------------------
" general
" ------------------------------------------------
 
syntax on
set number
set relativenumber
set expandtab
set shiftwidth=2
set softtabstop=2

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" Show half-typed command
set showcmd

" Don't wrap lines visually
set nowrap

colorscheme hybrid

let g:jsx_ext_required = 0
let g:prettier#autoformat = 0
