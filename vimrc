runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

if has('gui_running')
	syntax enable
	"colorscheme solarized
else
	syntax on
	set t_Co=256
    "let g:molokai_original = 1
    colorscheme molokai "jellybeans
    set mouse=a
endif

set encoding=utf-8
filetype plugin indent on
syntax enable
set background=dark
" colorscheme solarized
" colorscheme molokai

" set tabs to spaces
" use Ctrl+V<tab> to insert a real tab
" use :retab to change all tabs to the new format (if required)
" use :set shiftwidt=n to change all tabs to n spaces
set tabstop=4 shiftwidth=4 expandtab
" set smarttab    " sets use real tabs when not in the start of a line
" visualizing tabs
" syntax match Tab /\t/
" hi Tab gui=underline guifg=blue ctermbg=blue

set tags=tags;/ " move up looking for tags
set number " show line numbers on the left side (use :set nonumber to disable it
set guioptions-=T " removes the toolbar
set visualbell " no more beeps
set hidden " allows unsaved buffers to go to the background
" set pastetoggle=<F10> " set the paste toogle key

map <F3> :bp<cr>
map <F4> :bn<cr>
map <F5> :tabprevious<cr>
map <F6> :tabnext<cr>

" quick insertion of a newline
nmap <CR> O<Esc>

" I can't make my mind...
inoremap jk <Esc>
inoremap jj <Esc>

" Let's make it easy to switch buffers without saving them first
set hidden

" reminder: Ctrl+^ switches back and forth between two buffers
nnoremap <F8> :buffers<CR>:buffer<Space>

" show the registers from things cut/yanked
nmap <leader>r :registers<CR>

" map the various registers to a leader shortcut for pasting from them
nmap <leader>0 "0p
nmap <leader>1 "1p
nmap <leader>2 "2p
nmap <leader>3 "3p
nmap <leader>4 "4p
nmap <leader>5 "5p
nmap <leader>6 "6p
nmap <leader>7 "7p
nmap <leader>8 "8p
nmap <leader>9 "9p

" Re-select the block just pasted
" Reminder: 'gv' re-selects the previous select block
nmap gp `[v`]

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
    if &wrap
        return "g" . a:movement
    else
        return a:movement
    endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" Highlights the 'cursor line' to easily spot the current line
" and disables it when in insert mode.
set cursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
