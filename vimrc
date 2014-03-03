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
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
  endif
endif

"Tab spacing = 2, soft
set tabstop=2 shiftwidth=2 expandtab

"Show line numbers
set number

"Airline
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:bufferline_echo = 0
set laststatus=2
set noshowmode
