filetype off

if has('vim_starting')
  set encoding=utf8
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
call dein#begin('/Users/noto/.cache/dein')

call dein#add('Shougo/dein.vim')
call dein#add('tomasr/molokai')
call dein#add('bling/vim-airline')
call dein#add('scrooloose/syntastic')
call dein#add('thinca/vim-quickrun')
call dein#add('tyru/open-browser.vim')
call dein#add('vim-jp/vimdoc-ja.git')
call dein#add('godlygeek/tabular')
call dein#add('glidenote/memolist.vim')
call dein#add('scrooloose/nerdcommenter')
call dein#add('joonty/vdebug')
call dein#add('vim-scripts/gtags.vim')
call dein#add('easymotion/vim-easymotion')

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

let s:is_gui = has('gui_running')

" Basic
let mapleader = ','                           " キーマップリーダー
set scrolloff=5                               " カーソルの上または下に表示する最小限の行数
set nowrap                                    " 行の折り返しはしない
set textwidth=0                               " 入力されているテキストの最大幅 「0」で無効
set backup
set backupdir=~/.vim/tmp
"set nobackup                                  " バックアップの作成は行わない
"set nowritebackup
set swapfile
set directory=~/.vim/tmp
"set noswapfile                                " スワップファイルの作成は行わない
set autoread                                  " Vimの外部で変更されたことが判明したとき、自動的に読み直す
set hidden                                    " 保存しないで他のファイルを表示することが出来るようにする
set backspace=indent,eol,start                " バックスペースでインデントや改行を削除できるようにする
set formatoptions=lmoq                        " 自動整形の実行方法
set novisualbell                              " ビープ音 ビジュアルベル制御
set noerrorbells
set vb t_vb=
set noequalalways                             " ウィンドウサイズの自動調整を無効にする
autocmd FileType * setlocal formatoptions-=ro " 改行後の自動コメントアウト禁止
set ttyfast                                   " 高速ターミナル接続
set browsedir=buffer                          " ファイルブラウザの初期ディレクトリ
set whichwrap=b,s,<,>,[,],~                   " 特定のキーに行頭および行末の回りこみ移動を許可する設定
set showcmd                                   " コマンド (の一部) を画面の最下行に表示する
set ruler                                     " カーソルが何行目の何列目に置かれているかを表示する
set rulerformat=%l,%v
set laststatus=2                              " ステータス行を常に表示する
set statusline=%<%f\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P
set cmdheight=3                               " コマンドラインに使われる画面上の行数
set showmode                                  " 現在のモードの表示
set nomodeline                                " モードラインの無効化
set modelines=0
set clipboard+=unnamed                        " OSのクリップボードを使用

" Vimを終了しても undo 履歴を復元する Vim >= 7.3 {{{
" http://vim-users.jp/2010/07/hack162/
if has('persistent_undo')
  set undodir=./.vimundo,~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif
" }}}

set fileformats=unix,mac,dos
set ambiwidth=double

set list                                      " 不可視文字の表示
set listchars=tab:▸\ ,eol:¬
set mouse=a                                   " マウスの有効化
set guioptions+=a
set ttymouse=xterm2
set helplang=ja                               " helpを日本語優先に
set shellslash

set autoindent                                " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set smartindent                               " 新しい行を作ったときに高度な自動インデントを行う
set tabstop=4                                 " <Tab> が対応する空白の数。
set softtabstop=4                             " <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数。
set shiftwidth=4                              " インデントの各段階に使われる空白の数
set expandtab                                 " Insertモードで <Tab> を挿入するのに、適切な数の空白を使う
set smarttab                                  " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set relativenumber
set number                                    " 行番号を表示する。

set showmatch                                 " 対応する括弧をハイライト
set matchtime=1
set timeout timeoutlen=1000 ttimeoutlen=50    "マッピング待ち時間設定

" タイトル設定
set title
let &titlestring = hostname() . " [ Vim ( " . expand("%:t") . " ) ]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

autocmd BufWritePre * :%s/\s\+$//e            " 保存時に行末の空白を除去する

" 英数字以外を全て制御文字と認識
"nnoremap / /\v
"vnoremap / /\v
set wrapscan                                  " 循環検索
set hlsearch                                  " 検索文字をハイライト
set incsearch                                 " 検索コマンドを打ち込んでいる間にも、打ち込んだところまでのパターンがマッチするテキストを、すぐに表示する
set ignorecase                                " 検索時に大文字小文字を無視
set smartcase                                 " 大文字小文字の両方が含まれている場合は大文字小文字を区別
nnoremap <ESC><ESC> :nohlsearch<CR>           " ハイライト解除

set wildmenu                                  "補完候補を表示する
set completeopt=menuone                       "補完ウィンドウの設定
set wildmode=list:longest,full                " 補完モード
set nrformats=

if has('path_extra')
  set tags+=tags;
endif

set t_Co=256
syntax on
colorscheme molokai

" --------------------------------------------------------------------------
" key binding: {{{
"

nnoremap ; :

" カーソル行を封印
nnoremap <UP> <Nop>
nnoremap <DOWN> <Nop>
nnoremap <LEFT> <Nop>
nnoremap <RIGHT> <Nop>
inoremap <UP> <Nop>
inoremap <DOWN> <Nop>
inoremap <LEFT> <Nop>
inoremap <RIGHT> <Nop>

" カーソルを表示行で移動
nnoremap j gj
nnoremap k gk

" 移動範囲拡大
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" 画面分割時の移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 検索結果を画面中央に表示
nnoremap * *zz
nnoremap # #zz
nnoremap n nzz
nnoremap N Nzz

" Quick tab creation and navigation.
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tm :tabmove
nnoremap <leader>te :tabedit

" move tabs
nnoremap tl gt
nnoremap th gT

" ノーマルモード時でも改行を有効に
nnoremap <CR> o<ESC>

" カンマの後に自動的にスペースを追加
inoremap , ,<Space>

" 全選択
nnoremap <Leader>a ggVG

" 縦に分割し、分割したスクリーンをアクティブに
nnoremap <leader>w <C-w>v<C-w>l

" help設定
" via https://github.com/linyows/.vim/blob/master/.vimrc
" nnoremap <C-i> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

" vimrcの編集
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
" vimrcの反映
nnoremap <leader>rv :source $MYVIMRC<CR>

" }}}


" --------------------------------------------------------------------------
" 全角スペースのハイライト化 {{{
"

function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" }}}


" --------------------------------------------------------------------------
" カレント行、列に罫線を引く {{{
"
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinLeave * set nocursorcolumn
  autocmd WinEnter,BufRead * set cursorline
  autocmd WinEnter,BufRead * set cursorcolumn
augroup END

" }}}


" --------------------------------------------------------------------------
" 編集ファイルのカレントディレクトリを自動的に移動 {{{
" from Vimテクニックバイブル
"

augroup grlcd
  autocmd!
  autocmd BufEnter * lcd %:p:h
augroup END

" }}}


" --------------------------------------------------------------------------
" ペーストしたテキストをビジュアルモードで再選択: {{{
" from Vimテクニックバイブル
"

nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" }}}


" --------------------------------------------------------------------------
" Restore cursor position upon reopening files: {{{
" カーソル位置の復元
"

autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" }}}


" --------------------------------------------------------------------------
" ペーストモードの切り替え {{{
"

let paste_mode = 0
function! Paste_on_off()
  if g:paste_mode == 0
    set paste
    let g:paste_mode = 1
  else
    set nopaste
    let g:paste_mode = 0
  endif
  return
endfunction
" }}}
nnoremap <F8> :call Paste_on_off()<CR>
set pastetoggle=<F8>

" }}}


" --------------------------------------------------------------------------
" memolist: {{{
"
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

let g:memolist_path = "~/Dropbox/document"

"}}}


" --------------------------------------------------------------------------
" NERDCommenter: {{{
"

let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle
nmap <Leader>/a <Plug>NERDCommenterAppend

" }}}


" --------------------------------------------------------------------------
" insert-statusline: {{{
" 挿入モード時の色指定
" https://github.com/fuenor/vim-statusline/blob/master/insert-statusline.vim
"

if !exists('g:hi_insert')
  let g:hi_insert = 'highlight StatusLine guifg=White guibg=DarkCyan gui=none ctermfg=White ctermbg=DarkCyan cterm=none'
endif

if has('unix') && !has('gui_running')
  inoremap <silent> <ESC> <ESC>
  inoremap <silent> <C-[> <ESC>
endif

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" }}}

" --------------------------------------------------------------------------
" syntastic: {{{
"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open       = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_balloons     = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump           = 0
let g:syntastic_loc_list_height     = 5
let g:syntastic_phpcs_disable       = 0

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['html', 'javascript', 'php'],
                           \ 'passive_filetypes': [] }

let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

" }}}


" --------------------------------------------------------------------------
" smartword: {{{
"

"nmap w  <Plug>(smartword-w)
"nmap b  <Plug>(smartword-b)
"nmap ge  <Plug>(smartword-ge)
"xmap w  <Plug>(smartword-w)
"xmap b  <Plug>(smartword-b)
"xmap e  <Plug>(smartword-e)

" }}}


" --------------------------------------------------------------------------
" easy motion: {{{
"
"
let g:EasyMotion_leader_key = '<Leader>'

" }}}


" --------------------------------------------------------------------------
" Tabularize {{{
"

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a== :Tabularize /=><CR>
vmap <Leader>a== :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" }}}

" --------------------------------------------------------------------------
" open-browser.vim: {{{
"
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" }}}

" --------------------------------------------------------------------------
" gtags:"{{{
" requier brew install global

" 検索結果Windowを閉じる
nmap <C-q> <C-w><C-w><C-w>q
" Grep 準備
nmap <C-g> :Gtags -g
" このファイルの関数一覧
nmap <C-l> :Gtags -f %<CR>
" カーソル以下の定義元を探す
nmap <C-i> :Gtags <C-r><C-w><CR>
" カーソル以下の使用箇所を探す
nmap <C-@> :Gtags -r <C-r><C-w><CR>
" 次の検索結果
nmap <C-n> :cn<CR>
" 前の検索結果
nmap <C-p> :cp<CR>

" }}}

" --------------------------------------------------------------------------
" quickrun:"{{{
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
  \ 'outputter' : 'null',
  \ 'command'   : 'open',
  \ 'cmdopt'    : '-a',
  \ 'args'      : 'Marked',
  \ 'exec'      : '%c %o %a %s',
  \ }

