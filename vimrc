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
"------------------------------------------------------------------------------------------
" Environment
"------------------------------------------------------------------------------------------
if has('win64') || has('win32')
  set shellslash
  let $VIMDIR = expand('D:\Home\Tool\vim74-kaoriya-win64\.vim')
  let $NAREAI = expand('D:\Home\Tool\public_html-2\diary\template')
else
  let $VIMDIR = expand('~/.vim')
  let $NAREAI = expand('~/nareaiba/diary/template')
endif

"------------------------------------------------------------------------------------------
" 基本
"------------------------------------------------------------------------------------------

" 日本語入力対応
:set fenc=utf-8
:set enc=utf-8
:set fencs=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
:set fencs=iso-2022-jp,euc-jp,cp932,utf-8

" 改行コード自動認識
set fileformats=unix,dos,mac

" 強制全保存終了を無効化
nnoremap  ZZ  <Nop>

" スクロール時の余白確保
set scrolloff=7

" line number display
set number
" 相対行表示
set rnu!

" syntax highlighting
syntax    on

" Tab , 行末の半角スペースを明示的に表示
set list
set listchars=tab:>-,trail:~

" Backspace の挙動を改善する。
"   eol: 改行文字の削除を許可する
"   indent: 自動インデントが行われた場合、インデント部分の削除を許可する
"   start: インサートモードの開始位置よりも前の文字列の削除を許可する
set backspace=eol,indent,start

" 検索における大文字小文字の無視
set ignorecase

" ignorecase 且つ、検索における大文字小文字の区別の改善
"   |------------------------------------------------
"   | 小文字 | 大文字 | パターン例 | 大小文字の区別 |
"   |------------------------------------------------
"   |   ○    |   Ｘ   | foobar     | されない       |
"   |------------------------------------------------
"   |   Ｘ   |   ○    | FOOBAR     | される         |
"   |------------------------------------------------
"   |   ○    |   ○    | FooBar     | される         |
"   |------------------------------------------------
set smartcase

" 検索パターンマッチ箇所の強調表示
" そして検索結果のハイライトをさり気なく消す。
" 最後にnohlsearch と付いてるのがポイント、これが無いとEscを一回叩いた後におかしくなる
set hlsearch
nnoremap <Esc><Esc>  :<C-u>nohlsearch<CR>
" Disable Beep
set novisualbell
set noerrorbells
set vb t_vb=

" 現在のモードの表示
set showmode

" コマンド入力状況の表示
set showcmd

" タブ入力を複数の空白入力に置き換える
set expandtab

" TAB width of 2
set tabstop=2

" Shift width of 2
set shiftwidth=2

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

" View closing parenthesis the corresponding
set showmatch

" Shift-jis support
set fileencodings=sjis,utf-8

" コマンドライン補完強化
set wildmenu

" backup , swap の出力先を設定
set backup
set backupdir=$VIMDIR/backup-files
let &directory = &backupdir

" undo ファイルの出力先を一箇所にまとめる(Kaoriya版対応
if has('win64') || has('win32')
  set undodir=$VIMDIR\undo-files
endif

" vim-hier のハイライト削除
"nmap  <silent><Esc><Esc>  :<C-u>nohlsearch<CR>:HierClear<CR>:redraw!<CR><Esc>

" vi 互換モード
" 不要。
" 規定ではオン、vimrc か gvimrc が発見されたらオフ。
" つまり、vimrc を書いた時点で nocompatibleになるのである。
"set nocompatible

"------------------------------------------------------------------------------------------
" 拡張
"------------------------------------------------------------------------------------------
" Space + . で、_vimrc を編集出来るようにする。
nnoremap <Space>.   :<C-u>edit $MYVIMRC<CR>

" Space + s . で、vimrc をリロード
nnoremap <Space>s.  :<C-u>source $MYVIMRC<CR>

" クリップボードを有効にする
if has("clipboard")
  vmap ,y "+y
  nmap ,p "+gp
  if has("gui_running") || has("xterm_clipboard")
    silent! set clipboard^=unnamedplus
    set clipboard^=unnamed
  endif
endif

" v * 2 で行末まで選択
vnoremap v $h

" インサートモードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ヤンクレジスタのペースト
noremap PP "0p

" Window 分割関連
" insert mode 時でもCtrl + w,v を押すと縦分割され、 
" Ctrl + w,h を押すと横分割される。
" map <C-W><C-V>  :Vexplore!<CR>
" map <C-W><C-H>  :Hexplore<CR>
" map! <C-W><C-V>  <Esc>:Vexplore!<CR>
" map! <C-W><C-H>  <Esc>:Hexplore<CR>
" let g:netrw_sort_sequence="[\\/]$,*,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*[\\/]$,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*$,\\.o$,\\.info$,\\.swp$,\\.obj$ "

"------------------------------------------------------------------------------------------
" Indent
"------------------------------------------------------------------------------------------
" 新しい行を作ったときに高度な自動インデントを行う
" 新しい行を開始した時に、新しい行のインデントを現在行と同じ量にするという事。
set smartindent

" 自動でインデント
set autoindent

" ペースト時にautoindent を無効に(ONにするとautocomplpop.vimが動かない(謎)
set paste

" 連続インデント
" ビジュアルモードで < , > キーによるインデント後にビジュアルモードが解除されないようにする
vnoremap < <gv
vnoremap > >gv

" Cソースの自動インデントを始める
" 不要。
" smartindent はcindent かindentexpr が有効な時は意味が無い
" :help smartindent
"set cindent


" NeoBundle 使用前バージョンチェック
" Vim7.3以上である事。
if v:version > 703

  "------------------------------------------------------------------------------------
  " Start NeoBundle Settings.
  "------------------------------------------------------------------------------------
  " Fisrs of all RUN this script for .vim directory
  " git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  " curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

  " bundle で管理するディレクトリを指定
  if has('vim_starting')
    set runtimepath+=$VIMDIR/bundle/neobundle.vim/
  endif

  call neobundle#begin(expand('$VIMDIR/bundle'))

  " NeoBundle 自体をNeoBundleで管理
  NeoBundleFetch 'Shougo/NeoBundle.vim'



  "
  " 共通設定
  "

  " # 非同期プラグインのvimproc のダウンロードとコンパイル
  NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \   'mac' : 'make -f make_mac.mak',
        \   'unix' : 'make -f make_unix.mak',
        \   },
        \ }
  " windows は自分でコンパイルする事にするー
  "  \   'windows' : 'mingw32-make.exe -f make_mingw64.mak',
  "  \   'cygwin' : 'make -f make_cygwin.mak',

  " Color scheme
  NeoBundle 'vim-scripts/phd.git'

  " # HTMLタグなど、囲まれているもの の編集補助
  NeoBundle 'tpope/vim-surround'

  " # ステータスライン表示をオシャレに
  NeoBundle 'itchyny/lightline.vim'
    set laststatus=2
    let g:lightline = { 'colorscheme': 'solarized' }

  " # Markdown, textfile のリアルタイムプレビュー
  " :PrevimOpen を実行してブラウザで開くのです。
  NeoBundle 'kannokanno/previm'
    augroup PrevimSettings
      autocmd!
      autocmd BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    augroup END

    " ファイル保存時リアルタイムプレビュー
    let g:previm_enable_realtime = 1

    " デフォルトのCSSを使わず、独自のCSSのみ適用する
    let g:previm_disable_default_css = 1
    let g:previm_custom_css_path = '$NAREAI/markdown-style.css'

  " # 名前の通り、ブラウザでプレビュー 
  NeoBundle 'tyru/open-browser.vim'

  " ctrlP
  NeoBundle 'ctrlpvim/ctrlp.vim'

  " diffChar
  NeoBundle 'vim-scripts/diffchar.vim'

  " NERDtree
  NeoBundle 'scrooloose/nerdtree'

  "
  " Linux系 固有
  "
" 
"   if has('unix')
"     " # vim上で簡単に Compile & Run!
"     "   <\-r> で実行、らしい。
"     NeoBundle 'thinca/vim-quickrun'
"       "autocmd InsertEnter *   set shellslash
"       "autocmd InsertLeave *   set noshellslash
"       " 垂直分割
"       let g:quickrun_config={'*': {'split': 'vertical'}}
"       " 水平分割
"       "let g:quickrun_config={'*': {'split': ''}}
"       "set splitbelow
" 
"       " vim-quickrunでの実行結果を出力する先をファイルにする。
"       let g:quickrun_config = {}
"       let g:quickrun_config['markdown'] = {}
"       let g:quickrun_config['markdown']['outputter'] = 'file'
"       let g:quickrun_config['markdown']['outputter/name'] = tempname() . '.html'
" 
"     " コマンドが存在すれば
"     if executable('w3m')
"       " # w3mでPreview
"       NeoBundle 'yuratomo/w3m.vim'
" 
"       "----------------------------------------------------------------------
"       " vim-quickrun のhookを利用して、実行結果ファイルを作成後、w3m.vimで読み込む
"       "----------------------------------------------------------------------
"       let t:outputter_w3m_vim_bufname = ''
"       let s:hook = {
"             \ 'name': 'outputter_w3m_vim',
"             \ 'kind': 'hook',
"             \ 'is_success': 0,
"             \ 'config': { 'enable': 1 }
"             \ , '_bufname': 'hogeee'
"             \}
"       function! s:hook.on_success(session, context)
"         if a:session.config.outputter != 'file' || !match(a:session.config['outputter/name'], '.html$\c')
"           return
"         endif
" 
"         let mode = g:w3m#OPEN_SPLIT
"         let target = 'local'
"         let fname = a:session.outputter._file
"         let bufname = t:outputter_w3m_vim_bufname
"         if bufname != '' && bufwinnr(bufname) != -1
"           execute bufwinnr(bufname) 'wincmd w'
"           let mode = g:w3m#OPEN_NORAML
"           silent call w3m#Open( mode, target, fname )
"         else
"           silent call w3m#Open( mode, target, fname )
"           let t:outputter_w3m_vim_bufname = b:w3m_bufname
"         endif
"       endfunction
" 
"       call quickrun#module#register(s:hook, 1)
"       unlet s:hook
" 
"       " vim-markdown はftype=mkd として読み込むため、対策。
"       "let g:quickrun_config['mkd'] = copy(g:quickrun_config['markdown'])
"       "----------------------------------------------------------------------
"       " End w3m.vim setting
"       "----------------------------------------------------------------------
"     endif
"   endif


  "
  " win系 固有
  "

  if has('win64') || has('win32')
    " # Simplenote
    NeoBundle 'mrtazz/simplenote.vim'
      " let g:SimplenoteUsername = "xxxx"
      " let g:SimplenotePassword = "yyyy"
      " login 情報は別ファイル
      source $VIMDIR/bundle/simplenote.vim/simplenoterc
      " Set the default vim filetype for notes.
      let g:SimplenoteFiletype="markdown"
      " Sets the sort order by which notes should be listed.
      let g:SimplenoteSortOrder="pinned,modifydate"
  endif

  " Install Check.
  NeoBundleCheck

  "------------------------------------------------------------------------------------
  " End NeoBundle Settings.
  "------------------------------------------------------------------------------------
  " 2015/05/28 Change Neobundle setting tmp correspondence.
  call neobundle#end()
endif

"
" 読み込んだPluginsを含め、ファイルタイプの検出、
" ファイルタイプ別プラグイン/インデントを有効化する。
filetype  plugin  on
filetype  indent  on

