"行番号の表示
set number

"vi互換をオフ
set nocompatible

"新しい行のインデントを現在行と同じにする
set autoindent

"インクリメンタルサーチ設定
set incsearch

"タブ文字、行末など不可視文字を表示
set list

"可視化した空白文字の表示形式設定
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"シフト移動幅
set shiftwidth=2

"行頭の余白内でTabを打ち込むと、shiftwidthの数だけインデントする
set smartindent

"タブ幅をスペース４つ分
set tabstop=4

:syntax on
":colorscheme jellybeans

" 矢印キーを無効にする
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
