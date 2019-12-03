"Crtl+pでスクリプト実行
function! s:ExecThisScript()
  exe "!" . &ft . " %"
:endfunction
command! ExecThisScript call <SID>ExecThisScript()
map <silent> <C-P> :call <SID>ExecThisScript()<CR>

"全体の設定
function! GlobalSetting(colorscheme)
    syntax on

    if a:colorscheme == 'ron'
            colorscheme ron
    elseif a:colorscheme == 'pablo'
            colorscheme pablo
    endif

    set cursorline
    highlight CursorLine term=reverse cterm=none ctermbg=darkblue
    "ステータスラインの色
    highlight StatusLine ctermfg=blue
    "qbufの色
    highlight DiffText ctermbg=blue ctermfg=white
    "コメントの色
    highlight Comment ctermfg=darkgreen
    "autocmd BufNewFile,BufRead * highlight CursorLine term=reverse cterm=none ctermbg=darkblue
    "autocmd BufNewFile,BufRead * highlight StatusLine ctermfg=blue
    "autocmd BufNewFile,BufRead * highlight DiffText ctermbg=blue ctermfg=white
    "autocmd BufNewFile,BufRead * highlight Comment ctermfg=darkgreen
    nohlsearch
    set nolist
    set guicursor=a:blinkon0
    set nobackup
    set noswapfile
    set fileformat=unix
    set laststatus=2
    set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
    set tabstop=2 expandtab shiftwidth=2
    set autoindent
    set textwidth=0
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
    " 英二郎
    nmap E :<C-u>Ref alc<Space>
    let g:ref_alc_start_linenumber = 35 "行目を表示する
    let g:ref_alc_encoding = 'UTF-8' " 文字化けするならここで文字コードを指定してみる
    "screenでもマウス使える！
    set mouse=a
    set ttymouse=xterm2
    "colorscheme pablo
    "colorscheme elflord
    "colorscheme darkblue
    "colorscheme delek
    "colorscheme desert
    "set guifont=Osaka－等幅:h12
    "set lines=48
    "set columns=83

    "複数行ペーストでインデントが崩壊しないうえにセミコロンが消えない設定
    set paste

    " osc52.vim
    vmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>

endfunction!


function! HTMLSetting()
    call GlobalSetting('ron')
    setl autoindent
    setl smartindent
endfunction!


function! PythonSetting()
    call GlobalSetting('ron')
    setl cinwords=if,elif,else,for,while,try,except,finally,def,class
    "autocmd FileType python setl textwidth=80
    "autocmd FileType python setl smartindent
    "autocmd FileType python colorscheme ron
    "autocmd FileType python colorscheme elflord
endfunction!


function! OtherSetting()
    call GlobalSetting('ron')
endfunction!


"autocmd BufNewFile,BufRead * call OtherSetting()
autocmd BufNewFile,BufRead *.html setl autoindent smartindent filetype=jinja
autocmd BufNewFile,BufRead *.jinja2 setl autoindent smartindent filetype=jinja

autocmd FileType python call PythonSetting()
autocmd FileType jinja call HTMLSetting()

call GlobalSetting('ron')

"bufferlist.vim
map <silent> ; :call BufferList()<CR>
hi BufferNormal term=NONE ctermfg=white ctermbg=black cterm=NONE
