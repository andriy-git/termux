"##############################################################
"# __     ___                           _                     #
"# \ \   / (_)_ __ ___           __   _(_)_ __ ___  _ __ ___  #
"#  \ \ / /| | '_ ` _ \   _____  \ \ / / | '_ ` _ \| '__/ __| #
"#   \ V / | | | | | | | |_____|  \ V /| | | | | | | | | (__  #
"#    \_/  |_|_| |_| |_|         (_)_/ |_|_| |_| |_|_|  \___| #
"#                                                            #
"##############################################################
"
" Make sure to have a full fetured vim in installed:
" Ubuntu/Deb will be " vim-gtk "
"
"
" Brief help
" " :PlugList       - lists configured plugins, *Doesn't seem to work anymore*
" " :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
" " :PlugSearch foo - searches for foo; append `!` to refresh local cache
" " :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"
call plug#begin('~/.vim/plugged')

  Plug 'vimwiki/vimwiki'
  Plug 'ap/vim-css-color'
  Plug 'morhetz/gruvbox'
  Plug 'itchyny/lightline.vim'
  Plug 'dense-analysis/ale'

call plug#end()
"
" Sets default wiki folder
  let g:vimwiki_list = [{'path': '~/.vim/VimWiki/Zet', 'syntax': 'markdown', 'ext': '.md' }]
  let g:vimwiki_list = [{'path': '~/.vim/VimWiki/VimWiki', 'syntax': 'markdown', 'ext': '.md' }]
  let g:vimwiki_list = [{'path': '~/.vim/VimWiki/Argumentation', 'syntax': 'markdown', 'ext': '.md' }]
  let g:netrw_liststyle = 3         " Sets Lex/Netrw in tree style
  let g:netrw_winsize = 20          " Sets Lex/Netrw size to # spaces
  let g:rehash256 = 1
  let g:lightline = {'colorscheme': 'seoul256' }

  " In ALE: Must install shellcheck
  " I = information (opportunity for improvement)
  " W = warning (potential problem that may cause unexpected behavior)
  " E = error (critical issues or violation of syntax)
  " S = style (violation of coding style guidelines)

 if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

  syntax on
  filetype plugin on
  set syntax=sh " Added this as part of plugin that I'm not using anymore
  set nocompatible
  set t_Co=256                    " Set if term supports 256 colors.
  set clipboard=unnamedplus       " Copy/paste between vim and other programs.
  set number relativenumber       " Shows number and relative position
  set spell                       " Spell checker, press z than = over the word
  set wildmenu
  set wildmode=list:longest,full  " Enables autocompletion
  set smartindent                 " Tries to indent for you
  set expandtab                   " Replace tabs with spaces automatically
  set tabstop=2                   " Makes tab 2 spaces
  set softtabstop=2               " # of spaces per tab when editing
  set shiftwidth=2                " Spaces to insert or remove using indent commands
  set smarttab
  set icon
  set hlsearch                    " Highlights searches
  set incsearch                   " Start search when typing
  set linebreak                   " Breaks line at the end of word instead at exact #
  set wrapscan                    " Searches include line breaks
  set ttyfast                     " Faster scrolling
  set showmode
  set showcmd                     " Shows commands being typed
  set autowrite                   " Writes files when multiple files are open
  set mouse=a                     " Allows you to use a mouse
  set laststatus=2                " This is for lightline plugin to work
  set viminfo='20,<1000,s1000     " Increase vim buffer
  set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

" # Highlights Line and Column
  set cursorline
  highlight CursorLine ctermbg=235 cterm=Bold guibg=#2b2b2b
  set cursorcolumn
  highlight CursorColumn ctermbg=236 cterm=Bold guibg=#2b2b2b

" :hi shows all current highlight settings 
" # Base default color changes (gruvbox dark friendly)
  hi StatusLine ctermfg=black ctermbg=NONE
  hi StatusLineNC ctermfg=black ctermbg=NONE
  hi Normal ctermbg=NONE
  hi Special ctermfg=cyan
  hi LineNr ctermfg=DarkGrey ctermbg=NONE
  hi SpecialKey ctermfg=black ctermbg=NONE
  hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
  hi MoreMsg ctermfg=black ctermbg=NONE
  hi NonText ctermfg=black ctermbg=NONE
  hi vimGlobal ctermfg=black ctermbg=NONE
  hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
  hi Error ctermbg=234 ctermfg=darkred cterm=NONE
  hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
  hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
  hi Search ctermbg=236 ctermfg=darkred
  hi vimTodo ctermbg=236 ctermfg=darkred
  hi Todo ctermbg=236 ctermfg=darkred
  hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
  hi MatchParen ctermbg=236 ctermfg=darkred

" # Color overrides
  au FileType * hi StatusLine ctermfg=DarkGrey ctermbg=NONE
  au FileType * hi StatusLineNC ctermfg=black ctermbg=NONE
  au FileType * hi Normal ctermbg=NONE
  au FileType * hi Special ctermfg=cyan
  " Color of hyperlinks
  au FileType * hi Underlined ctermfg=Blue
  " Color of number line
  au FileType * hi LineNr ctermfg=DarkYellow ctermbg=NONE
  au FileType * hi SpecialKey ctermfg=DarkGrey ctermbg=NONE
  au FileType * hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
  au FileType * hi MoreMsg ctermfg=black ctermbg=NONE
  au FileType * hi NonText ctermfg=black ctermbg=NONE
  au FileType * hi vimGlobal ctermfg=black ctermbg=NONE
  au FileType * hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
  au FileType * hi Error ctermbg=234 ctermfg=darkred cterm=NONE
  au FileType * hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
  " Bothered me forever because made a light blue background
  au FileType * hi SpellCap ctermbg=234 ctermfg=darkred cterm=NONE
  au FileType * hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
  au FileType * hi Search ctermbg=DarkMagenta ctermfg=darkred
  au FileType * hi vimTodo ctermbg=236 ctermfg=darkred
  au FileType * hi Todo ctermbg=236 ctermfg=darkred
  au FileType * hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
  au FileType * hi MatchParen ctermbg=236 ctermfg=darkred
  " The fallowing are for ALE plug in
  au FileType * hi SignColumn ctermbg=Black
  au FileType * hi ALEErrorSign ctermfg=DarkGrey
  au FileType * hi ALEWarningSign ctermfg=DarkGrey
  au FileType * hi ALEInfoSign ctermfg=DarkGrey
  au FileType * hi ALEStyleSign ctermfg=DarkGrey
  au FileType * hi ALETypeSign ctermfg=DarkGrey
  """"""""""""
  au FileType markdown,pandoc hi Title ctermfg=yellow ctermbg=NONE
  au FileType markdown,pandoc hi Operator ctermfg=yellow ctermbg=NONE
  au FileType markdown,pandoc  noremap j gj
  au FileType markdown,pandoc  noremap k gk

  " Leader key bindings "\" <-- Leader Key
  map <leader>n :!bash<space>~/.local/scripts/clinotes<space>edit<space>
  map <leader>ns :!bash<space>~/.local/scripts/clinotes<space>view<cr>
  map <leader>f :Lex<cr>
  map <leader>l :set list!<cr>
  map <leader>mb :.!bash<space>~/.local/scripts/vim/mkbreak<space>
  map <leader>c :nohlsearch<cr>
  map <leader>? :!bash<space>~/.local/scripts/vim/vimscut<cr>
  map <leader>bs i#!/data/data/com.termux/files/usr/bin/bash<CR><ESC>
