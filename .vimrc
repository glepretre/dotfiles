 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 " let Vundle manage Vundle
 " required!
 Plugin 'VundleVim/Vundle.vim'

 Plugin 'scrooloose/nerdtree'
 Plugin 'vim-scripts/bufexplorer.zip'

 Plugin 'junegunn/fzf'
 Plugin 'junegunn/fzf.vim'

 Plugin 'morhetz/gruvbox'

 " Plugin 'ryanoasis/vim-devicons'

 Plugin 'scrooloose/nerdcommenter'
 Plugin 'scrooloose/syntastic'
 Plugin 'tpope/vim-surround'
 Plugin 'eapache/rainbow_parentheses.vim'
 Plugin 'Valloric/YouCompleteMe'
 " Plugin 'ludovicchabant/vim-gutentags'
 Plugin 'majutsushi/tagbar'
 Plugin 'tpope/vim-fugitive'

 Plugin 'ack.vim'

 " Clojure plugins
 Plugin 'vim-scripts/paredit.vim'
 Plugin 'tpope/vim-fireplace'

 " Elm
 Plugin 'elmcast/elm-vim'

 " Rust
 Plugin 'rust-lang/rust.vim'

 " Git
 Plugin 'airblade/vim-gitgutter'

 Plugin 'vim-airline/vim-airline'

 call vundle#end()

 syntax on

 filetype plugin indent on     " required!

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

 map <F8> :TagbarToggle<CR>

 let g:syntastic_asciidoc_asciidoc_exec = 'asciidoctor'
 let g:syntastic_javascript_checkers = ['jshint', 'jscs']

 let g:gutentags_ctags_exclude = ['node_modules']

 " Limit length to 72 characters
 " http://blog.jeffscudder.com/2008/11/vim-line-length.html
 "match ErrorMsg /.\%>72v/

 set colorcolumn=72,80

 " Invisible characters
 set list
 set listchars=tab:▸\ ,eol:¬

 " Folding
 set foldmethod=indent
 set foldlevelstart=99

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
au BufNewFile *.rb 0r ~/.vim/templates/ruby

" Highlight current line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Clojure
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:paredit_electric_return = 0

" Execute current file shortcut
nnoremap <leader>r :!%:p<Enter>

" Remove search highlight
nnoremap ,<space> :nohlsearch<CR>

" Command-T
"nmap <silent> <Leader>l <Plug>(CommandTLine)
"nmap <silent> <Leader>c <Plug>(CommandTTag)

" fzf
nmap <silent> <Leader>f :Files<CR>
nmap <silent> <Leader>g :GitFiles<CR>
nmap <silent> <Leader>t :Tags<CR>
nmap <silent> <Leader>b :Buffers<CR>
nmap <Leader>s :Rg<space>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"if $TERM =~ 'rxvt'
"  colorscheme Tomorrow-Night-Bright
"endif
" https://github.com/morhetz/gruvbox/wiki/Terminal-specific
" https://github.com/neovim/neovim/wiki/FAQ#how-can-i-use-true-colors-in-the-terminal
" https://gist.github.com/XVilka/8346728
if $TERM =~ '256color'
" not OK with terminator
  set termguicolors
endif
set background=dark
"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox
colorscheme monokai
