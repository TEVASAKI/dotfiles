"
"                                ___           ___           ___
"      ___                      /\  \         /\  \         /\__\
"     /\  \        ___         |::\  \       /::\  \       /:/  /
"     \:\  \      /\__\        |:|:\  \     /:/\:\__\     /:/  /
"      \:\  \    /:/__/      __|:|\:\  \   /:/ /:/  /    /:/  /  ___
"  ___  \:\__\  /::\  \     /::::|_\:\__\ /:/_/:/__/___ /:/__/  /\__\
" /\  \ |:|  |  \/\:\  \__  \:\~~\  \/__/ \:\/:::::/  / \:\  \ /:/  /
" \:\  \|:|  |   ~~\:\/\__\  \:\  \        \::/~~/~~~~   \:\  /:/  /
"  \:\__|:|__|      \::/  /   \:\  \        \:\~~\        \:\/:/  /
"   \::::/__/       /:/  /     \:\__\        \:\__\        \::/  /
"    ~~~~           \/__/       \/__/         \/__/         \/__/
"
"
""""""""""""""""""""""""""""""""""""""""""
" Response to the Japanese character code
" 日本語入力対応
""""""""""""""""""""""""""""""""""""""""""
:set fenc=utf-8
":set fencs=iso-2022-jp,euc-jp,cp932,utf-8
":set enc=utf-8
:set encoding=utf-8
:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
""""""""""""""""""""""""""""""""""""""""""
"-----------------------------------------------------------------------------------------------------
" 基本
"-----------------------------------------------------------------------------------------------------
" line number display
set number
" syntax highlighting
syntax		on

" Backspace の挙動を改善する。
" eol: 改行文字の削除を許可する
" indent: 自動インデントが行われた場合、インデント部分の削除を許可する
" start: インサートモードの開始位置よりも前の文字列の削除を許可する
set backspace=eol,indent,start

" 検索における大文字小文字の無視
set ignorecase
" その上で検索における大文字小文字の区別の改善
set smartcase
" | 小文字 | 大文字 | パターン例 | 大小文字の区別 |
" |------------------------------------------------
" |   ○   |   Ｘ   | foobar     | されない       |
" |------------------------------------------------
" |   Ｘ   |   ○   | FOOBAR     | される         |
" |------------------------------------------------
" |   ○   |   ○   | FooBar     | される         |
" |------------------------------------------------

" 検索パターンマッチ箇所の強調表示
set hlsearch
" 現在のモードの表示
set showmode
" コマンド入力状況の表示
set showcmd
" タブ入力を複数の空白入力に置き換える
set expandtab
" TAB width of 4
set tabstop=2
" Shift width of 4
set shiftwidth=2
" If you type the Tab in the margin of the beginning of a line, to indent the number of 'shiftwidth'.
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

" View closing parenthesis the corresponding
set showmatch
" Shift-jis support
set fileencodings=sjis,utf-8

"-----------------------------------------------------------------------------------------------------
" Indent
"-----------------------------------------------------------------------------------------------------
" To perform advanced automatic indentation when you made the new line
" 新しい行を作ったときに高度な自動インデントを行う
" 新しい行を開始した時に、新しい行のインデントを現在行と同じ量にするという事。
set smartindent
" 自動でインデント
set autoindent
" ペースト時にautoindent を無効に(ONにするとautocomplpop.vimが動かない(謎) 
set paste
" Cソースの自動インデントを始める
set cindent

" 連続インデント(謎
" ビジュアルモードで<- -> キーによるインデント後にビジュアルモードが解除されないようにする
vnoremap < <gv
vnoremap > >gv

if has("autocmd")
	" ファイルタイプの検索を有効にする
	filetype plugin on
	" そのファイルタイプに合わせたインデントを利用する
	filetype indent on
	" これらのfiletypeではインデントを無効に
	" autocmd FileType php filetype indent off

	autocmd FileType apache		setlocal sw=4 sts=4 ts=4 et
	autocmd FileType c			setlocal sw=4 sts=4 ts=4 et
	autocmd FileType css		setlocal sw=2 sts=2 ts=2 et
	autocmd FileType html		setlocal sw=2 sts=2 ts=2 et
	autocmd FileType java		setlocal sw=4 sts=4 ts=4 et
	autocmd FileType php		setlocal sw=4 sts=4 ts=4 et
	autocmd FileType ruby		setlocal sw=2 sts=2 ts=2 et
	autocmd FileType sh			setlocal sw=4 sts=4 ts=4 et
	autocmd FileType vim		setlocal sw=2 sts=2 ts=2 et
endif

"-----------------------------------------------------------------------------------------------------
" neobundle
"-----------------------------------------------------------------------------------------------------

set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" add plugins
filetype plugin on
filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundleCheck

" originalrepos on github
"NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'VimClojure'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/unite.vim'      " ファイラとして利用
NeoBundle 'Shougo/neocomplcache'  " 入力補完機能を提供する
"NeoBundle 'Shougo/neosnippet'     " スニペット入力サポート
"NeoBundle 'jpalardy/vim-slime'
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'tpope/vim-surround'    " HTMLタグなど、囲まれているもの の編集補助
"NeoBundle 'itchyny/lightline.vim'    " ステータスライン表示をオシャレに
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

" modifi------(;