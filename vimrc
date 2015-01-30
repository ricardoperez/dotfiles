call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set encoding=utf-8
set mouse=a
set nu
set ignorecase
set smartcase           "ignore case if search pattern is all in lowercase
set undolevels=1000
set hidden              "hide buffers instead of closing them when you :q, keeping their undo history
set hlsearch            "highlight all the matches in search
set incsearch           "show search matches as you type

"Don't let Vim write backup files, I used GIT to backup! ;)
set nobackup
set noswapfile

" Forget about shitt+; to use : to run commands ;)
nnoremap ; :

" To save a file that must be need a sudo permission! eg. /etc/hosts
cmap w!! w !sudo tee % >/dev/null

"Colorscheme
set background=dark
set t_Co=256
colorscheme molokai

if has("gui_macvim")
  colorscheme railscasts
endif

syntax on

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"Indent Settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
filetype plugin indent on
autocmd BufNewFile,BufRead *.json set ft=javascript

" Highlight Whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
map <leader>ctw :%s/\s\+$//<CR>

" ==== VIM PLUGINS CONFIG ====
source ~/.dotfiles/vim_custom/vimrc_indent_guides
source ~/.dotfiles/vim_custom/vimrc_crtlp
source ~/.dotfiles/vim_custom/vimrc_powerline
source ~/.dotfiles/vim_custom/vimrc_snipmate
source ~/.dotfiles/vim_custom/vimrc_rspec
source ~/.dotfiles/vim_custom/vimrc_tabularize
source ~/.dotfiles/vim_custom/vimrc_taglist
source ~/.dotfiles/vim_custom/vimrc_ctrl_space

" ==== VIM MAPS ====

map <F4> :NERDTreeToggle<CR>
map <F2> :set paste!<CR>

" CTRL+X e CRTL+C to cut and copy in OSX
vmap <C-x> :!pbcopy<cr>
vmap <C-c> :w !pbcopy<cr><cr>

" To break a line from Normal mode
:nnoremap <NL> i<CR><ESC>

"This mapping make a closed tag with a new line with tab indent
inoremap ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O<Tab>

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

" Tab mappings.
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" TODO List
noremap <Leader>td :noautocmd vimgrep /TODO/j **/*.*<CR>:cw<CR>

" Print current path
cmap <C-e> <C-r>=expand('%:p:h')<CR>/

" Select a text in Visual Mode and type <C+R> them text the substitution and
" type enter
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

map <leader>tt :set noet ci pi sts=0 sw=4 ts=4<cr>
