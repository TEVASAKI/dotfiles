
"---------------------------------------------------------------------------
" カラー設定:
"---------------------------------------------------------------------------
colorscheme industry

"---------------------------------------------------------------------------
" フォント指定
"---------------------------------------------------------------------------
set guifont=Ricty\ Regular:h14

"---------------------------------------------------------------------------
" 初期表示行列
"---------------------------------------------------------------------------
set lines=32  columns=92

"---------------------------------------------------------------------------
" Toolbarの非表示
"---------------------------------------------------------------------------
set guioptions-=T

"---------------------------------------------------------------------------
" 終了時のウィンドウサイズを保存する
"---------------------------------------------------------------------------
let g:save_window_file = expand('D:\Home\Tool\vim74-kaoriya-win64\.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
          \ 'set columns=' . &columns,
          \ 'set lines=' . &lines,
          \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
          \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif

