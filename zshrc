### Environment variable configuration

# 漢のZSHで紹介している、$UID=0 で判断するcase 文は
# root でログインしているかどうかしか判断していない。
# ので・ターミナル環境で変える様にした。
# teraTerm からログインすると 'xterm' 扱いになっている模様。

case $TERM in
  linux) LANG=C ;;
  *) LANG=ja_JP.UTF-8 ;;
esac

#

### PROMPT

PROMPT='[%n@%m]%# '
PROMPT2=''
# Linux bashと同じ形式
#PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) "

#
# Show branch name in Zsh's right prompt
# - note ----
# 作業ディレクトリがクリーンな時      「緑」
# 追跡されていないファイルがある時    「黄」
# 追跡さているファイルに変更がある時  「赤」
# 変更有り かつ 未追跡ファイル有り    「太字の赤」
# merge , rebase の途中なら、カッコ内に表示
# -----------
#

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

setopt prompt_subst

function rprompt-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
          color=%F{green}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
          color=%F{yellow}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
          color=%B%F{red}
        else
          color=%F{red}
         fi

        echo "$color$name$action%f%b "
}

RPROMPT='[`rprompt-git-current-branch`%~]'

##

# 右側まで入力がきたら右プロンプトを消す
setopt transient_rprompt

# 変数展開など便利なプロンプト
setopt prompt_subst

#

### 基本設定

# noBeep
setopt nolistbeep

# Ctrl + s = STOP の解除
stty stop undef

# EDITOR にはvim を優先
if type vi > /dev/null 2>&1; then
  export EDITOR="vim"
else
  # vim が無かったらvi を使う
  export EDITOR="vi"
fi

# PAGER にはlvを 優先
if type lv > /dev/null 2>&1; then
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

# 補完機能 & 賢くする
autoload -Uz compinit
compinit -u

# cdの履歴表示、cd - で戻るれろ
setopt autopushd

# 補完一覧をファイル種別に表示
setopt list_types

# 改行無しの行を表示させる(zshの仕様。変なバグにつながるとかなんとか)
# http://dqn.sakusakutto.jp/2012/08/zsh_unsetopt_promptcr_zshrc.html#more
unsetopt promptcr

# ディレクトリ名のみでcd
#setopt auto_cd

# リストを詰めて表示
#setopt list_packed

# コマンドのスペルチェックを有効に
#setopt correct

#

### History

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

# History manipulator (謎
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#

### Alias

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias less='less -iM'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# todo.txt
alias t='~/src/todo.txt-cli/todo.sh -a -t'

# tmux と libevent を繋ぐalias
alias tmux=LD_LIBRARY_PATH=/usr/local/lib\ /usr/local/bin/tmux

# 設定ファイルのinclude ,,,これいるん？
[ -f ~/.zshrc.include ] && source ~/.zshrc.include 

## rbenvのインストール用環境パス
## http://mukaer.com/archives/2012/03/12/rubyrbenv/
if [ -d ${HOME}/.rbenv ] ; then
  PATH=${HOME}/.rbenv/bin:${PATH}
  export PATH
  eval "$(rbenv init -)"
fi

# sudo にenvPATHを引き継ぐ
# export PATH=/usr/local/bin:$PATH
# alias sudo='sudo env PATH=$PATH'

