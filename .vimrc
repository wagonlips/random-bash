" System vimrc file for Mac OS X
" Author:  Benji Fisher <benji@member.AMS.org>
" Last modified:  23 February 2004

" TODO:  Is there any way to test whether Vim.app was started from the Finder? 
if has("gui_running")
  " Get the value of $PATH from a login shell.
  " If your shell is not on this list, it may be just because we have not
  " tested it.  Try adding it to the list and see if it works.  If so,
  " please post a note to the vim-mac list!
  if $SHELL =~ '/\(sh\|csh\|bash\|tcsh\|zsh\)$'
    let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
    let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
  endif
  " Change directory on startup.
  autocmd VimEnter * if getcwd()=="/" | if strlen(@%) | cd %:p:h | else | cd | endif | endif
" If running in a Terminal window, set the terminal type to allow syntax
" highlighting.
" else
"   set term=ansi
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

imap <t> <f>

  map + <C-W>+
  map - <C-W>-
  map > <C-W>>
  map < <C-W><
  nnoremap \th :set invhls hls?<CR>
  nmap <F2> \th
  imap <F2> <C-O>\th

set nowrap

set ruler

set autoindent

set nocompatible

set backspace=eol,start,indent

set et
set sw=2
set smarttab 

autocmd BufNewFile,BufRead *.mxml compiler flex

autocmd BufRead *.as set filetype=actionscript

autocmd BufRead *.mxml set filetype=xml
