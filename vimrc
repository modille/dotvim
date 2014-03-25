call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"" Colors
syntax enable
colorscheme badwolf
set colorcolumn=120

"" Folding
set foldmethod=syntax
set nofoldenable "don't fold by default

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

"" Airline
let g:airline_powerline_fonts = 1 "Add powerline fonts to the dictionary
let g:airline_section_y = ""      "Hide the file encoding info
let g:bufferline_echo = 0
set laststatus=2                  "Have airline show up without having to split
set noshowmode                    "Hide default mode display

"" Nerdtree
nmap <silent> <Leader>nt :NERDTreeToggle<CR>
nmap <silent> <Leader>nc :NERDTreeCWD<CR>

"" Unite
"Similar to Control-Shift-R in Eclipse
nnoremap r :Unite -start-insert file_rec/async<CR>
nnoremap <silent> <leader>b :<C-u>Unite buffer bookmark<CR>
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom_source('file_rec,file_rec/async', 'max_candidates', 0)
call unite#custom_source('file_rec,file_rec/async,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.svn/',
      \ '\.yardoc/',
      \ 'tmp/',
      \ 'tags',
      \ '.*\.log',
      \ 'doc/.*/.*\.html',
      \ ], '\|'))

"" Session
"Auto-save on exit
let g:session_autosave = "yes"
"Save every minute (just in case...)
let g:session_autosave_periodic = 1
"Open most recent session, instead of default
let g:session_default_to_last = 1

"" Markdown highlighting
au BufRead,BufNewFile *.md set syntax=markdown

"" Miscellaneous shortcuts
"Ctrl-C for Copy, etc.
source $VIMRUNTIME/mswin.vim
behave mswin
"Change cwd to current file
map <Leader>cd :cd %:p:h<CR>
"F7 to toggle spellcheck
imap <F7> <C-o>:setlocal spell! spelllang=en_us<CR>
nn <F7> :setlocal spell! spell? spelllang=en_us<CR>

"" Make auto-complete behave more *nix-like
set wildmode=longest:full
set wildmenu

"" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter *.rb match ExtraWhitespace /\s\+$/
autocmd InsertEnter *.rb match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave *.rb match ExtraWhitespace /\s\+$/
autocmd BufWinLeave *.rb call clearmatches()

"" Bookmarks (default vim behavior)
" mA - Creates a bookmark called A
" `A - Jump to the exact location (line and column) of the bookmark A
" ‘A - Jump to the beginning of the line of the bookmark A
" :marks - Display all the bookmarks
" Note: Upper-case bookmark names are global, else local

