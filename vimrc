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
"------------------------------------------------------------------------------------------
" 基本
"------------------------------------------------------------------------------------------
" 強制前保存終了を無効化
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
" そして検索結果のハイライトをさり気なく消す。
" 最後にnohlsearch と付いてるのがポイント、これが無いとEscを一回叩いた後におかしくなる
set hlsearch
nnoremap <Esc><Esc>  :<C-u>nohlsearch<CR>
" Disable Beep
set novisualbell
set noerrorbells
set vb t_vb=

" vim-hier のハイライト削除
"nmap  <silent><Esc><Esc>  :<C-u>nohlsearch<CR>:HierClear<CR>:redraw!<CR><Esc>

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

" If you type the Tab in the margin of the beginning of a line, to indent the number of 'shiftwidth'.
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

" View closing parenthesis the corresponding
set showmatch

" Shift-jis support
set fileencodings=sjis,utf-8

" backup , swap の出力先を設定 
if has('win32') || has('win64')
  let $VIMDIR = expand('D:\Home\Tool\vim74-kaoriya-win64\')
else
  let $VIMDIR = expand('~/.vim')
endif
set backup
set backupdir=$VIMDIR/backup-files
let &directory = &backupdir

" undo ファイルの出力先を一箇所にまとめる(Kaoriya版対応
if has('win32') || has('win64')
  set undodir=D:\Home\Tool\vim74-kaoriya-win64\undo-files
endif

" Ctrl + n / p の配色設定
" hi  Pmenu ctermbg=4
" hi  Pmenusel ctermbg=1
" hi  PMenuSbar ctermbg=4

"------------------------------------------------------------------------------------------
" 拡張
"------------------------------------------------------------------------------------------
" Window 分割関連
" insert mode 時でもCtrl + w,v を押すと縦分割され、 
" Ctrl + w,h を押すと横分割される。
map <C-W><C-V>  :Vexplore!<CR>
map <C-W><C-H>  :Hexplore<CR>
map! <C-W><C-V>  <Esc>:Vexplore!<CR>
map! <C-W><C-H>  <Esc>:Hexplore<CR>
let g:netrw_sort_sequence="[\\/]$,*,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*[\\/]$,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*$,\\.o$,\\.info$,\\.swp$,\\.obj$ "

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

"------------------------------------------------------------------------------------------
" Indent
"------------------------------------------------------------------------------------------
" To perform advanced automatic indentation when you made the new line
" 新しい行を作ったときに高度な自動インデントを行う
" 新しい行を開始した時に、新しい行のインデントを現在行と同じ量にするという事。
set smartindent

" 自動でインデント
set autoindent

" ペースト時にautoindent を無効に(ONにするとautocomplpop.vimが動かない(謎) 
set paste

" Cソースの自動インデントを始める
" smartindent はcindent かindentexpr が有効な時は意味が無い
" :help smartindent
"set cindent

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

  autocmd FileType apache  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType c       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html    setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java    setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby    setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vim     setlocal sw=2 sts=2 ts=2 et
endif


" バージョンチェック
" Vim7.3以上である事。
if v:version > 703
  "------------------------------------------------------------------------------------
  " Start NeoBundle Settings.
  "------------------------------------------------------------------------------------
  " vi 互換モード
  " 不要。
  " 規定ではオン、vimrc か gvimrc が発見されたらオフ。
  " つまり、vimrc を書いた時点で nocompatibleになるのである。
  "set nocompatible

  " NeoBundle environment
  if has('win32') || has('win64')
    set shellslash
    let $VIMDIR = expand('D:\Home\Tool\vim74-kaoriya-win64\.vim')
  else
    let $VIMDIR = expand('~/.vim')
  endif

  " bundle で管理するディレクトリを指定
  if has('vim_starting')
    set runtimepath+=$VIMDIR/bundle/neobundle.vim/
  endif

  " neobundle.vim の初期化
  call neobundle#rc(expand('$VIMDIR/bundle'))

  " NeoBundle 自体をNeoBundleで管理
  NeoBundleFetch 'Shougo/NeoBundle.vim'


  " ### 今後はここ以降にPluginsを追記していく。
  " original repos on github
  " # 非同期プラグインのvimproc のダウンロードとコンパイル
  NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \   'mac' : 'make -f make_mac.mac',
        \   'unix' : 'make -f make_unix.mak',
        \   },
        \ }
  " windows は自分でコンパイルする事にするー
  "  \   'windows' : 'mingw32-make.exe -f make_mingw64.mak',
  "  \   'cygwin' : 'make -f make_cygwin.mak',


  " # HTMLタグなど、囲まれているもの の編集補助
  NeoBundle 'tpope/vim-surround'    

  " # ステータスライン表示をオシャレに
  NeoBundle 'itchyny/lightline.vim'    
  "let g:lightline = { 'colorscheme':  'landscape', }
  "set laststatus=2

  " # Markdown, textfile のリアルタイムプレビュー
  " :PrevimOpen を実行してブラウザで開くのです。
  NeoBundle 'kannokanno/previm'
  " Previm setting 1
  augroup PrevimSettings
    autocmd!
    autocmd BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  augroup END

  " # 名前の通り、ブラウザでプレビュー 
  NeoBundle 'tyru/open-browser.vim'

  if has('unix') 
    " # vim上で簡単に Compile & Run!
    "   <\-r> で実行、らしい。
    NeoBundle 'thinca/vim-quickrun'
    "autocmd InsertEnter *   set shellslash
    "autocmd InsertLeave *   set noshellslash
    " 垂直分割
    let g:quickrun_config={'*': {'split': 'vertical'}}
    " 水平分割
    "let g:quickrun_config={'*': {'split': ''}}
    "set splitbelow

    " vim-quickrunでの実行結果を出力する先をファイルにする。
    let g:quickrun_config = {}
    let g:quickrun_config['markdown'] = {}
    let g:quickrun_config['markdown']['outputter'] = 'file'
    let g:quickrun_config['markdown']['outputter/name'] = tempname() . '.html'

    " コマンドが存在すれば
    if executable('w3m')
      " # w3mでPreview
      NeoBundle 'yuratomo/w3m.vim'

      "----------------------------------------------------------------------
      " vim-quickrun のhookを利用して、実行結果ファイルを作成後、w3m.vimで読み込む
      "----------------------------------------------------------------------
      let t:outputter_w3m_vim_bufname = ''
      let s:hook = {
            \ 'name': 'outputter_w3m_vim',
            \ 'kind': 'hook',
            \ 'is_success': 0,
            \ 'config': { 'enable': 1 }
            \ , '_bufname': 'hogeee'
            \}
      function! s:hook.on_success(session, context)
        if a:session.config.outputter != 'file' || !match(a:session.config['outputter/name'], '.html$\c')
          return
        endif

        let mode = g:w3m#OPEN_SPLIT
        let target = 'local'
        let fname = a:session.outputter._file
        let bufname = t:outputter_w3m_vim_bufname
        if bufname != '' && bufwinnr(bufname) != -1
          execute bufwinnr(bufname) 'wincmd w'
          let mode = g:w3m#OPEN_NORAML
          silent call w3m#Open( mode, target, fname )
        else
          silent call w3m#Open( mode, target, fname )
          let t:outputter_w3m_vim_bufname = b:w3m_bufname
        endif
      endfunction

      call quickrun#module#register(s:hook, 1)
      unlet s:hook

      " vim-markdown はftype=mkd として読み込むため、対策。
      "let g:quickrun_config['mkd'] = copy(g:quickrun_config['markdown'])
      "----------------------------------------------------------------------
      " End w3m.vim setting
      "----------------------------------------------------------------------
    endif
  endif

  " # Simplenote
  NeoBundle 'mrtazz/simplenote.vim'
  " login 情報は別ファイル
  source $VIMDIR/bundle/simplenote.vim/simplenoterc


  " 読み込んだPluginsを含め、ファイルタイプの検出、
  " ファイルタイプ別プラグイン/インデントを有効化する。
  filetype plugin   on
  filetype indent   on

  " Install Check.
  NeoBundleCheck
  "------------------------------------------------------------------------------------
  " End NeoBundle Settings.
  "------------------------------------------------------------------------------------
endif
"
