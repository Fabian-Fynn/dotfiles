let mapleader = ","

source ~/.vim/config/plugins.vim

source ~/.vim/config/settings.vim
"source ~/.vim/config/statusline.vim"
source ~/.vim/config/mappings.vim
source ~/.vim/config/snippets.vim

execute pathogen#infect()
syntax on
filetype plugin indent on

" Set no max file limit
let g:ctrlp_max_files = 0
 " Search from current directory instead of project root
 let g:ctrlp_working_path_mode = 0

 " Ignore these directories
 set wildignore+=*/node_modules/**
 set wildignore+=*/vendor/**

