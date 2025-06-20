call plug#begin('~/.vim/plugged')

Plug 'yegappan/grep'
Plug 'preservim/nerdtree'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/emmet-vim'
Plug 'keith/swift.vim'

call plug#end()

let g:syntastic_swift_checkers = ['swiftpm']

filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType swift setlocal omnifunc=lsp#complete
autocmd FileType swift nnoremap <C-j> :LspDefinition<CR>

set mouse=r
set relativenumber
set nu
set hls is

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nmap <F6> :NERDTreeToggle<CR>
nmap <F10> :q!<CR>

