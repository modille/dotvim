call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Colors
syntax enable
colorscheme badwolf

"Fonts
if has("gui_running")
  if has("gui_win32")
    set guifont=Bitstream_Vera_Sans_Mono:h16:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif
endif

"Tab spacing = 4, soft
set tabstop=4 shiftwidth=4 expandtab

"Show line numbers
set number

"Airline
let g:bufferline_echo = 0
set noshowmode
set laststatus=2
