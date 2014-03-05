call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"" Colors
syntax enable
colorscheme badwolf

"" Fonts
if has("gui_running")
  if has("gui_win32")
    set guifont=Bitstream_Vera_Sans_Mono:h16:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
  endif
endif

"" Tab spacing = 2, soft
set tabstop=2 shiftwidth=2 expandtab

"" Show line numbers
set number

"" Leader key
let mapleader = ","

"" Disable toolbar
set guioptions-=T
"set guioptions-=m

"" Airline
"Add powerline fonts to the dictionary
let g:airline_powerline_fonts = 1
"Hide the file encoding info
let g:airline_section_y = ""
let g:bufferline_echo = 0
"Have airline show up without having to split
set laststatus=2
"Hide default mode display
set noshowmode

"" Unite
"Similar to Control-Shift-R in Eclipse
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap r :Unite -start-insert file_rec<CR>
nnoremap <silent> <leader>b :<C-u>Unite buffer bookmark<CR>

"" Session
"Auto-save on exit
let g:session_autosave = "yes"
"Save every minute (just in case...)
let g:session_autosave_periodic = 1
"Open most recent session, instead of default
let g:session_default_to_last = 1

"" Markdown highlighting
augroup mkd
  autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

"" Miscellaneous shortcuts
"Ctrl-C for Copy, etc.
source $VIMRUNTIME/mswin.vim
behave mswin

"" Make auto-complete behave more *nix-like
set wildmode=longest:full
set wildmenu

"" Bookmarks (default vim behavior)
" mA - Creates a bookmark called A
" `A - Jump to the exact location (line and column) of the bookmark A
" ‘A - Jump to the beginning of the line of the bookmark A
" :marks - Display all the bookmarks
" Note: Upper-case bookmark names are global, else local

