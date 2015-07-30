 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required!
 Bundle 'gmarik/vundle'

 Bundle 'scrooloose/nerdtree'
 Bundle 'vim-scripts/bufexplorer.zip'
 Bundle 'git://git.wincent.com/command-t.git'

"Bundle 'Lokaltog/vim-powerline'
 Bundle 'altercation/vim-colors-solarized'

 Bundle 'scrooloose/nerdcommenter'
 Bundle 'scrooloose/syntastic'
 Bundle 'tpope/vim-surround'
" Bundle 'ervandew/supertab'
 Bundle 'Valloric/YouCompleteMe'

 Bundle 'ack.vim'

 filetype plugin indent on     " required!

" markdown
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
" let g:vim_markdown_folding_disabled=1
" let g:vim_markdown_no_default_key_mappings=1


 let mapleader = ","
 set number
 set mouse=a
 set autoread

 set expandtab
 set shiftwidth=2
 set softtabstop=2
 set tabstop=2

 " https://github.com/karma-runner/karma/issues/199/
 set backupcopy=yes

 map <F2> :NERDTreeToggle<CR>
 "Change current directory when changing root node
 let NERDTreeChDirMode=2
"autocmd vimenter * if !argc() | NERDTree | endif

let g:syntastic_javascript_checkers = ['jshint', 'jscs']

" Limit length to 72 characters
" http://blog.jeffscudder.com/2008/11/vim-line-length.html
" match ErrorMsg /.\%>72v/

set colorcolumn=72,80

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
" Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
" Do the business:
    %s/\s\+$//e
" Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" templates
au BufNewFile *.html 0r ~/.vim/templates/html5

" Highlight current line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

"if $TERM =~ '256color'
"  colorscheme solarized
"endif

" Julien's config
" http://www.xorcode.com/2011/04/11/solarized-vim-eclipse-ubuntu/
"syntax enable
" if has('gui_running')
"   set background=light
" else
"   set background=dark
" endif
" set t_Co=16
" let g:solarized_termcolors=16
syntax enable
colorscheme monokai
