" カラースキーマはicebergを使う
syntax on
colorscheme iceberg
set termguicolors

" swapfileは使わない
set noswapfile
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータスに以下を表示する
  "ファイル名
  "変更有無
  "文字コード
  "読み込み専用か
  "ヘルプか
  "プレビューか
  "文字コード
  "改行コード
  "カーソルが何行目/全行
  "カーソルが何列目
  "表示している位置がファイル内の何%の位置か
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=(%l/%L,%c%V)%8P

" ファイルエンコード
set encoding=utf-8
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,shift-jis,iso-2022-jp-3,iso-2022-jp-2,euc-jisx0213,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" タブの代わりにスペースを使う
set expandtab
" タブ幅
set tabstop=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 自動インデントでずれる幅
set shiftwidth=2
" 不可視文字を表示
set list
" タブなどの表示を変更
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" 対応する括弧を強調表示
set showmatch
" Cっぽいインデントに
set cindent

" 行番号を表示
set number
" 現在の行をハイライト
set cursorline

" 行末・行頭から次の行へ移動可能に
set whichwrap=b,s,h,l,<,>,[,],~
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" InsertモードでBackspaceがいい感じに使えるように
set backspace=indent,eol,start

" 大文字小文字を無視
set ignorecase
" ignorecaseがonのとき、小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" ESCキー連打でハイライトを消す
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" コピペ時のインデント崩れを防ぐ
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
