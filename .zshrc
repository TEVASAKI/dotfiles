# Environment variable configuration
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

# prompt
#PS1="[@${HOST%%.*} %1~]%(!.#.$) "
PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) " # Linux bashと同じ形式
#PROMPT=" %{${fg[yellow]}%}%~%{${reset_color}%}
#[%n]$ "
#PROMPT2='[%n]> '

RPROMPT="%T" # 右側に時間表示
setopt transient_rprompt # 右側まで入力がきたら時間表示を消す
setopt prompt_subst # 変数展開など便利なプロント
export LANG=ja_JP.UTF-8 # 日本語環境
export EDITOR=vim # エディタはvi
export MANPAGER='lv -laOu8c'
# Use Color
autoload -U colors; colors

# Completion
autoload -U compinit # 補完機能
compinit -u # 補完を賢くする
setopt autopushd # cdの履歴表示、cd - で
#setopt auto_cd # ディレクトリ名のみでcd
#setopt list_packed # リストを詰めて表示
setopt list_types # 補完一覧をファイル種別に表示
#setopt correct # コマンドのスペルチェックを有効に

# History
HISTFILE=~/.zsh_history # historyファイル
HISTFILESIZE=1000000
HISTSIZE=1000000 # ファイルサイズ
SAVEHIST=1000000 # saveする量
setopt hist_ignore_dups # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history # 履歴ファイルを共有
setopt EXTENDED_HISTORY # zshの開始終了を記録

# History manipulator
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# alias
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
alias vi=vim # vi で vim 起動
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias less='less -iM'
# -la で自動判別して、 -Ou8 でUTF8決め打ち出力
alias lv='lv -laOu8c'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias t='~/src/todo.txt_cli-2.10/todo.sh -a -t'

[ -f ~/.zshrc.include ] && source ~/.zshrc.include # 設定ファイルのinclude

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

