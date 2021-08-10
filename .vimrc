call plug#begin('~/.vim/plugged')
"For R
Plug 'jalvesaq/Nvim-R'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'



Plug 'preservim/nerdtree'
Plug 'Raimondi/delimitMate' 
"auto-fill parathesis"
Plug 'patstockwell/vim-monokai-tasty'
Plug 'itchyny/lightline.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'fisadev/vim-isort' " not support ?!
Plug 'preservim/nerdcommenter'


" For Python
"Plug 'gmarik/Vundle.vim'
"Plug 'ncm2/ncm2'  " awesome autocomplete plugin
"Plug 'HansPinckaers/ncm2-jedi'  " fast python completion (use ncm2 if you want type info or snippet support)
"Plug 'ncm2/ncm2-bufword'  " buffer keyword completion
"Plug 'ncm2/ncm2-path'  " filepath completion
"Plug 'jupyter-vim/jupyter-vim'
"Plug 'roxma/nvim-yarp'

" Optional: better Rnoweb support (LaTeX completion)
Plug 'lervag/vimtex'

call plug#end()

" my map
nmap <C-w>r :vertical resize 

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree
"
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Set a Local Leader

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


" Plugin Related Settings

" NCM2
"autocmd BufEnter * call ncm2#enable_for_buffer()    " To enable ncm2 for all buffers.
"set completeopt=noinsert,menuone,noselect           " :help Ncm2PopupOpen for more
                                                    " information.

" NERD Tree
map <leader>nn :NERDTreeToggle<CR>                  " Toggle NERD tree.

" Monokai-tasty
let g:vim_monokai_tasty_italic = 1                  " Allow italics.
colorscheme vim-monokai-tasty                       " Enable monokai theme.

" LightLine.vim
set laststatus=2              " To tell Vim we want to see the statusline.
let g:lightline = {
   \ 'colorscheme':'monokai_tasty',
   \ }


" General NVIM/VIM Settings

" Mouse Integration
set mouse=i                   " Enable mouse support in insert mode.

" Tabs & Navigation
map <leader>nt :tabnew<cr>    " To create a new tab.
map <leader>to :tabonly<cr>     " To close all other tabs (show only the current tab).
map <leader>tc :tabclose<cr>    " To close the current tab.
map <leader>tm :tabmove<cr>     " To move the current tab to next position.
map <leader>tn :tabn<cr>        " To swtich to next tab.
map <leader>tp :tabp<cr>        " To switch to previous tab.


" Line Numbers & Indentation
set backspace=indent,eol,start  " To make backscape work in all conditions.
set ma                          " To set mark a at current cursor location.
set number                      " To switch the line numbers on.
set expandtab                   " To enter spaces when tab is pressed.
set smarttab                    " To use smart tabs.
set autoindent                  " To copy indentation from current line
                                " when starting a new line.
set si                          " To switch on smart indentation.


" Search
set ignorecase                  " To ignore case when searching.
set smartcase                   " When searching try to be smart about cases.
set hlsearch                    " To highlight search results.
set incsearch                   " To make search act like search in modern browsers.
set magic                       " For regular expressions turn magic on.


" Brackets
set showmatch                   " To show matching brackets when text indicator
                                " is over them.
set mat=2                       " How many tenths of a second to blink
                                " when matching brackets.

" enable all Python syntax highlighting features
let python_highlight_all = 1


" Errors
set noerrorbells                " No annoying sound on errors.


" Color & Fonts
syntax enable                   " Enable syntax highlighting.
set encoding=utf8                " Set utf8 as standard encoding and
                                 " en_US as the standard language.

" Enable 256 colors palette in Gnome Terminal.
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry


" Files & Backup
set nobackup                     " Turn off backup.
set nowb                         " Don't backup before overwriting a file.
set noswapfile                   " Don't create a swap file.
set ffs=unix,dos,mac             " Use Unix as the standard file type.


" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ncm2 settings
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=menuone,noselect,noinsert
"set shortmess+=c
"inoremap <c-c> <ESC>
"" make it fast
"let ncm2#popup_delay = 5
"let ncm2#complete_length = [[1, 1]]
"" Use new fuzzy based matches
"let g:ncm2#matcher = 'substrfuzzy'
