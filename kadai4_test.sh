#!/bin/bash

# 正解が出てくることを試すパターン
run_test() {
    local a=$1
    local b=$2
    local c=$3

    result=$(./kadai4.sh $a $b)
    if [ "$result" -eq "$c" ]; then
        echo "成功: 引数($a, $b) == $c"
    else
        echo "失敗: 次のケースで異なる結果が出力されました。引数($a, $b) != $c (got $result)"
        exit 1
    fi
}

# 不正解が出てくることを試すパターン
run_invalid_test() {
    local a=$1
    local b=$2

    ./kadai4.sh $a $b 2>/dev/null
    if [ $? -ne 1 ]; then
        echo "失敗: 引数が足りないケース($a, $b)でエラーを検出できませんでした。"
        exit 1
    else
        echo "成功: 引数が足りないケース($a, $b) で適切にエラーを検出しました。"
    fi
}

# 正解ケース
run_test 48 18 6
run_test 101 103 1
run_test 56 98 14
run_test 270 192 6

# 不正解ケース
run_invalid_test 48
run_invalid_test "a" 18
run_invalid_test 48 "b"
run_invalid_test " " " "
run_invalid_test 48 -18

echo "全テストケースの検証が完了しました"

