" ><><><><><><><><><><><><
" <<┏━┓┏┳┓┏┓╻╻╻ ╻╻╻  ┏━┓<<
" >>┃ ┃┃┃┃┃┗┫┃┣━┫┃┃  ┗━┓>>
" <<┗━┛╹ ╹╹ ╹╹╹ ╹╹┗━╸┗━┛<<
" >>                    >>
" <<  ╻┏┓╻╻╺┳╸ ╻ ╻╻┏┳┓  <<
" >>  ┃┃┗┫┃ ┃  ┃┏┛┃┃┃┃  >>
" <<  ╹╹ ╹╹ ╹ ╹┗┛ ╹╹ ╹  <<
" ><><><><><><><><><><><><


" Vim-Plug

call plug#begin()

" Aesthetics - Main
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'zaki/zazen'
Plug 'morhetz/gruvbox'
" Aethetics - Additional
Plug 'yuttie/hydrangea-vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'heavenshell/vim-pydocstring'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'amix/vim-zenroom2'
Plug 'sjl/badwolf'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
" Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'kana/vim-textobj-entire'
Plug 'hallison/vim-markdown'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'
Plug 'hhatto/autopep8'
Plug 'vimwiki/vimwiki'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-rails'
"Ruby on Rails power tools
Plug 'skywind3000/asyncrun.vim'
Plug 'neomake/neomake'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/forth.vim'
Plug 'shougo/deoplete.nvim'
Plug 'andmarti1424/sc-im'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
" Spellcheck
Plug 'kamykn/spelunker.vim'
" Snippets Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" grouping
augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType textile call litecorrect#init()
  augroup END

augroup pencil
autocmd!
autocmd FileType markdown,mkd call pencil#init()
autocmd FileType text call pencil#init()
augroup END


let g:spacegray_use_italics = 1
let g:spacegray_underline_search = 1

""" Coloring
syntax on
color gruvbox 
" color desert
"" highlight Pmenu guibg=white guifg=black gui=bold highlight Comment gui=bold highlight Normal gui=none highlight NonText guibg=none
" Opaque Background (Comment out to use terminal's profile)
set termguicolors
" Transparent Background (For i3 and compton) highlight Normal guibg=NONE ctermbg=NONE highlight LineNr guibg=NONE ctermbg=NONE

""" Other Configurations
" filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set number
set title
set nocompatible
set hidden
"change buffer without saving
" autocmd FileType *
setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" new line not with comment marks
""" Plugin Configurations
" Deoplete etc
let g:deoplete#enable_at_startup = 1
"" vimwiki
let g:vimwiki_list = [{'path': '~HIER_WUNSCHPFAD_EINTRAGEN'}]
let g:vimwiki_ext = '.md'
" set extension to .md
let g:vimwiki_global_ext = 0
" make sure vimwiki doesn't own all .md files
let g:vimwiki_autowriteall = 1
" autosaves modified wiki buffer
"" vim-workspace
nnoremap <leader><space> :ToggleWorkspace<CR>
let g:workspace_session_name = 'Omnihil.vim'
" let g:workspace_session_directory = $HOME . '/.neovim/sessions/'
let g:workspace_autosave_always = 1
"" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
"let g:airline#extensions#tabline#enabled = 1

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Disable documentation window
set completeopt-=preview

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" " Ultisnips
" let g:UltiSnipsExpandTrigger="<C-Space>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<C-x>"
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" TagBar
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" fzf neovim
" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme=''
    color dracula
    IndentLinesEnable
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorSeoul256()
    let g:airline_theme='silver'
    color seoul256
    IndentLinesDisable
endfunction

" Forgotten Mode (Light)
function! ColorForgotten()
    " Light airline themes: tomorrow, silver, alduin
    " Light colors: forgotten-light, nemo-light
    let g:airline_theme='tomorrow'
    color forgotten-light
    IndentLinesDisable
endfunction

" Zazen Mode (Black & White)
function! ColorZazen()
    let g:airline_theme='badcat'
    color zazen
    IndentLinesEnable
endfunction

""" Custom Mappings

let mapleader=","
nmap <leader>q :NERDTreeToggle<CR>
nmap \ <leader>q
nmap <leader>w :TagbarToggle<CR>
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme 
nmap <leader>e1 :call ColorDracula()<CR>
nmap <leader>e2 :call ColorSeoul256()<CR>
nmap <leader>e3 :call ColorForgotten()<CR>
nmap <leader>e4 :call ColorZazen()<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
nmap <leader>d <Plug>(pydocstring)
nmap <leader>f :Files<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
nmap <leader>d :call deoplete#toggle()
" Follow link under word in :help etc with t
nnoremap t <C-]>
nnoremap <F2> :Startify <CR>

" insert empty lines with Shift-Enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
                            \ | call lexical#init()
                            \ | call litecorrect#init()
                            \ | call textobj#quote#init()
                            \ | call textobj#sentence#init()
augroup END

" fzy
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>

" STARTIFY
" Mofo'kin fancy header:


let g:startify_custom_header = [
  \ '  ',
  \ '  ┏┓    ╻ ╻   ╻   ┏┳┓',
  \ '  ┃┗┓   ┃┏┛   ┃   ┃┃┃',
  \ '  ╹ ╹   ┗┛    ╹   ╹ ╹',
  \ '   ',
  \
  \ ]


" 'Most Recent Files' number
let g:startify_files_number           = 10

" Update session automatically as you exit vim
let g:startify_session_persistence    = 1

" Lists
let g:startify_lists = [
        \ { 'type': 'files',        'header': ['   MRU']    },
        \ { 'type': 'dir',          'header': ['   MRU.loc ',   getcwd()] },
        \ { 'type': 'sessions',     'header': ['   Sessions'] },
        \ { 'type': 'bookmarks',    'header': ['   Bookmarks'] },
        \ ]

let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, {'z': '~/.zshrc'} ]

let g:startify_session_dir = '~/.config/nvim/sessions'


" Spellcheck
map <F5> :setlocal spell! spelllang=de,en<CR>


" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" Goyo limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Automatically save the view, e.g. the folds
" will be saved
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" C-c and C-v - Copy/Paste to global clipboard
vmap <C-c> "+yi
imap <C-v> <esc>"+gpi

" SPLIT
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" neomake
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
" call neomake#configure#automake('nw', 750)
" without delay: 
call neomake#configure#automake('w')
nnoremap <C-x> :w<cr>:Neomake<cr>


