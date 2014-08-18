call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"" Colors
syntax enable
colorscheme badwolf
set colorcolumn=120

"" Folding
set foldmethod=syntax
set nofoldenable "Don't fold by default

"" Fonts
if has('gui_running')
  if has('gui_win32')
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
let mapleader = ','

"" Hide abandoned buffers instead of unloading (preserves undo history)
set hidden

"" Airline
let g:airline_powerline_fonts = 1 "Add powerline fonts to the dictionary
let g:airline_section_y = ""      "Hide the file encoding info
let g:bufferline_echo = 0
set laststatus=2                  "Have airline show up without having to split
set noshowmode                    "Hide default mode display

"" Indent Guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"" Nerdtree
nmap <silent> <Leader>nt :NERDTreeToggle<CR>
nmap <silent> <Leader>nc :NERDTreeCWD<CR>

"" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"Allow yank history searching
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory = '~/.vim/.cache/unite'
let g:unite_enable_start_insert = 1
"Use Silver Searcher for grepping
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
"Ignore patterns
call unite#custom_source('file_rec,file_rec/async,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.svn/',
      \ '\.yardoc/',
      \ 'doc/.*/.*\.html',
      \ '.*\.log',
      \ 'tags/',
      \ 'tmp/',
      \ '.*/translations.js',
      \ ], '\|'))
call unite#custom_source('file_rec,file_rec/async', 'max_candidates', 0)
"r = Find file by name
nnoremap <silent> <Leader>r :Unite file_rec/async<CR>
"b = List buffers
nnoremap <silent> <Leader>b :Unite buffer bookmark<CR>
"g = Grep
nnoremap <silent> <Leader>g :Unite grep:.<CR>
"o = Outline
nnoremap <silent> <Leader>o :Unite -start-insert -vertical -auto-preview outline<CR>
"y = Yank history
nnoremap <silent> <Leader>y :Unite history/yank<CR>

"" Session
"Auto-save on exit
let g:session_autosave = 'yes'
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

"" Jump through history (default vim behavior)
" <C-o> - Jump to previous
" <C-i> - Jump forward

"" XML editing
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
map <Leader>fx !%xmllint --format --recover -

"" Disable toolbar and menu
set guioptions-=mcheme
set guioptions-=T
set guioptions-=m
set guioptions-=M
