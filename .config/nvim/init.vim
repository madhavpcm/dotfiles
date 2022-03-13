call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'famiu/nvim-reload'
Plug 'tpope/vim-eunuch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'puremourning/vimspector'
Plug 'preservim/nerdtree'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mangeshrex/uwu.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'elzr/vim-json'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Raimondi/delimitMate'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'

"" Initialize plugin system
call plug#end()

au ColorScheme * hi Normal ctermbg=none guibg=none

set clipboard+=unnamedplus
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent

set number
set showcmd
set wildmenu
set hidden

source $HOME/.config/nvim/plug/asmx86.vim
source $HOME/.config/nvim/plug/airline.vim
source $HOME/.config/nvim/plug/snippets.vim
source $HOME/.config/nvim/plug/tmux-nav.vim
source $HOME/.config/nvim/plug/vimspector.vim
source $HOME/.config/nvim/plug/coc-tabnine.vim
source $HOME/.config/nvim/plug/uwu.vim

" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
nnoremap <leader>sv source $MYVIMRC<CR>
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.


augroup nasm_ft
    au!
    autocmd BufNewFile,BufRead *.asm set ft=nasm
augroup END
