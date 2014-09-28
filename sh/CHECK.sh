### シェル関数 ###
# 1. コマンドの実行に失敗したらその場で終了する
# 2. また、どのようなコマンド列が実行されたかを表示する
# 3. しかもカラー分け
# 4. CHECK command という風に使う。
# http://www.clear-code.com/blog/2012/10/11.html

red=31
yellow=33
cyan=36

colored() {
  color=$1
  shift
  echo -e "\033[1;${color}m$@\033[0m"
}

CHECK() {
  "$@"
  result=$?
  
  if [ $result -ne 0 ]
  then 
  # ステータスコードが 0以外であった場合の処理
  # Not Equal ですね。
    # 赤いエラーメッセージ
    echo -n $(colored $red "Failed: ")
    # 水色で引数を表示する。
    # $@ は、シェルスクリプト自体に渡されたすべての引数を参照する変数
    echo -n $(colored $cyan "$@")
    # 黄色で、どの部分が作業ディレクトリのパスなのかを表示。
    echo $(colored $yellow " [$PWD]") >&2
    exit $result
  fi

  return 0
}

