# Environment variable configuration
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

## prompt
PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) " # Linux bashと同じ形式
#PS1="[@${HOST%%.*} %1~]%(!.#.$) "
#PROMPT=" %{${fg[yellow]}%}%~%{${reset_color}%}
#[%n]$ "
#PROMPT2='[%n]> '

# 右側に時間表示
RPROMPT="%T"

# 右側まで入力がきたら時間表示を消す
setopt transient_rprompt

# 変数展開など便利なプロント
setopt prompt_subst

# 日本語環境
export LANG=ja_JP.UTF-8

## 基本設定
# エディタはvim
if type vi > /dev/null 2>&1; then
  # vimを優先
  export EDITOR="vim"
else
  # vim が無かったらvi を使う
  export EDITOR="vi"
fi

# ページャはlv
if type lv > /dev/null 2>&1; then
  # lvを優先
  export PAGER="lv"
else
  # lv が無かったらless を使う
  export PAGER="less"
fi

# 単に lv とした時にいい感じに動く用に設定
if [ "$PAGER" = "lv" ]; then
  # -la で自動判別して、 -Ou8 でUTF8決め打ち出力 -c で色付け
  export LV="-la -c -Ou8"
else
  # lv が無くても、lv でページャを起動
  alias lv="$PAGER"
fi

# Use Color
autoload -U colors; colors

# 補完機能
autoload -Uz compinit
# 補完を賢くする
compinit -u

# cdの履歴表示、cd - で
setopt autopushd

# ディレクトリ名のみでcd
#setopt auto_cd

# リストを詰めて表示
#setopt list_packed

# 補完一覧をファイル種別に表示
setopt list_types

# コマンドのスペルチェックを有効に
#setopt correct

## History
# historyファイル
HISTFILE=~/.zsh_history
HISTFILESIZE=1000000

# ファイルサイズ
HISTSIZE=1000000

# saveする量
SAVEHIST=1000000

# 重複を記録しない
setopt hist_ignore_dups

# スペース排除
setopt hist_reduce_blanks

# 履歴ファイルを共有
setopt share_history

# zshの開始終了を記録
setopt EXTENDED_HISTORY

# History manipulator
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## alias
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# vi で vim 起動
#alias vi=vim
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias less='less -iM'
# -la で自動判別して、 -Ou8 でUTF8決め打ち出力 -c で色付け
alias lv='lv -la -c -Ou8'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# todo.txt
alias t='~/src/todo.txt-cli/todo.sh -a -t'
# tmux と libevent を繋ぐalias
alias tmux=LD_LIBRARY_PATH=/usr/local/lib\ /usr/local/bin/tmux
# sudo にenvPATHを引き継ぐ
# export PATH=/usr/local/bin:$PATH
# alias sudo='sudo env PATH=$PATH'

# 設定ファイルのinclude
[ -f ~/.zshrc.include ] && source ~/.zshrc.include 

# Ctrl + s = STOP の解除
stty stop undef

# 改行無しの行を表示させる(zshの仕様。変なバグにつながるとかなんとか)
# http://dqn.sakusakutto.jp/2012/08/zsh_unsetopt_promptcr_zshrc.html#more
unsetopt promptcr

## rbenvのインストール用環境パス
## http://mukaer.com/archives/2012/03/12/rubyrbenv/
if [ -d ${HOME}/.rbenv ] ; then
	PATH=${HOME}/.rbenv/bin:${PATH}
	export PATH
	eval "$(rbenv init -)"
fi

