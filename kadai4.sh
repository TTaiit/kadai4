#!/bin/bash

# origin  git@github.com:TTaiit/kadai4.git
# ユークリッドの互除法 Euclidean Algorithm = ea
ea() {
    local a=$1
    local b=$2
    while [ $b -ne 0 ]; do
        local temp=$b
        b=$((a % b))
        a=$temp
    done
    echo $a
}

# 引数の確認
if [ $# -ne 2 ]; then
    echo "エラー: 引数が2つではありません" >&2
    exit 1
fi

# 2つの引数が自然数の確認
if ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]; then
    echo "エラー: 引数は2つとも自然数でなけばいけません" >&2
    exit 1
fi

# 引数が0以上であることの確認・・・これがないと引数に0を許容にしてしまう
if [ $1 -le 0 ] || [ $2 -le 0 ]; then
    echo "エラー: 自然数は0より大きい整数でなければいけません" >&2
    exit 1
fi

# eaの演算
ea $1 $2

