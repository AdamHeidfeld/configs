set nu
"set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

set lbr
set tw=500

set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936 

map <F3> :silent! Tlist<CR> 
let Tlist_Ctags_Cmd='ctags'
let Tlist_Use_Right_Window=0
let Tlist_Show_One_File=0 
let Tlist_File_Fold_Auto_Close=1 
let Tlist_Exit_OnlyWindow=1 
let Tlist_Process_File_Always=0
let Tlist_Inc_Winwidth=0

set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags,./../../../../../../tags,./../../../../../../../tags,./../../../../../../../../tags,./../../../../../../../../../tags,./../../../../../../../../../../tags,./../../../../../../../../tags,./../../../../../../../../../tags

if &diff
	colorscheme pablo
endif

autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g`\"" |
\ endif

filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4

autocmd FileType python setlocal foldmethod=indent
set foldlevel=99

syntax on

set showcmd
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt+=longest
 
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
   
"上下左右键的行为
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"Add for ruby on rails
set nocompatible
set viminfo^=!
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
map <A-p>  :cp 
map <A-n>  :cn 

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

noremap <f2> :bprev<CR>
noremap <f3> :bnext<CR>
noremap <F4> :bdelete<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

nmap <F3> :TagbarToggle<CR>
