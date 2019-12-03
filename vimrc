"Crtl+pでスクリプト実行
function! s:ExecThisScript()
  exe "!" . &ft . " %"
:endfunction
command! ExecThisScript call <SID>ExecThisScript()
map <silent> <C-P> :call <SID>ExecThisScript()<CR>

"複数行ペーストでインデントが崩壊しないうえにセミコロンが消えない設定
set paste

syntax on
colorscheme ron
set cursorline
highlight CursorLine term=reverse cterm=none ctermbg=darkblue
"ステータスラインの色
highlight StatusLine ctermfg=blue
"コメントの色
highlight Comment ctermfg=darkgreen

nohlsearch
set nolist
set guicursor=a:blinkon0
set nobackup
set noswapfile
set fileformat=unix
set laststatus=2
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set textwidth=0
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" Windowの切り替えエスケープ。
" 上: ctrl+k -> k
" 下: ctrl+k -> j
" 右: ctrl+k -> l
" 左: ctrl+k -> h
nmap  
" 行頭に移動 [[ は元々 gg と同じ機能
nmap [ 0
" 行末に移動 ]] は元々 G と同じ機能
nmap ] $
"screenでもマウス使える！
set mouse=a
set ttymouse=xterm2


" osc52.vim
vmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>


function! HTMLSetting()
    setl autoindent
    setl smartindent
endfunction!


function! PythonSetting()
    setl cinwords=if,elif,else,for,while,try,except,finally,def,class
    "autocmd FileType python setl textwidth=80
    "autocmd FileType python setl smartindent
    "autocmd FileType python colorscheme ron
    "autocmd FileType python colorscheme elflord
endfunction!

"autocmd BufNewFile,BufRead * call OtherSetting()
autocmd BufNewFile,BufRead *.html setl autoindent smartindent filetype=jinja
autocmd BufNewFile,BufRead *.jinja2 setl autoindent smartindent filetype=jinja

autocmd FileType python call PythonSetting()
autocmd FileType jinja call HTMLSetting()


"bufferlist.vim
map <silent> ; :call BufferList()<CR>
hi BufferNormal term=NONE ctermfg=white ctermbg=black cterm=NONE
