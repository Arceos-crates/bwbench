#!/bin/bash

APP=
ROOT=$(realpath $(dirname $0))/../../
TIMEOUT=60s
EXIT_STATUS=0

S_PASS=0
S_FAILED=1
S_TIMEOUT=2
S_BUILD_FAILED=3

RED_C="\x1b[31;1m"
GREEN_C="\x1b[32;1m"
YELLOW_C="\x1b[33;1m"
CYAN_C="\x1b[36;1m"
BLOD_C="\x1b[1m"
END_C="\x1b[0m"

if [ -z "$ARCH" ]; then
    ARCH=x86_64
fi
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "riscv64" ] && [ "$ARCH" != "aarch64" ]; then
    echo "Unknown architecture: $ARCH"
    exit $S_FAILED
fi

function compare() {
    local actual=$1
    local expect=$2
    local i=1
    local lines_matched=0

    # 逐行比较前175行
    while [ $i -le 175 ]; do
        local actual_line=$(sed "${i}q;d" "$actual")
        local expect_line=$(sed "${i}q;d" "$expect")
        local diff_count=$(diff -U 0 <(echo "$actual_line") <(echo "$expect_line") | grep -E "^\+|^-|^@@ " | grep -vE "^(@@ )|(^[-+][[:space:]]*\\$)" | wc -l)
        if [ "$diff_count" -lt 10 ]; then
            ((lines_matched++))
        fi
        ((i++))
    done

    # 如果前175行中成功比对的行数等于175，则返回成功
    if [ $lines_matched -eq 175 ]; then
        return $S_PASS
    else
        MSG="only $lines_matched lines matched out of 175"
        return $S_FAILED
    fi
}

function run_and_compare() {
    local args=$1
    local expect=$2
    local actual=$3

    echo -ne "    run with \"${BLOD_C}$args${END_C}\": "
    make -C "$ROOT" A="$APP" $args > "$actual" 2>&1
    if [ $? -ne 0 ]; then
        return $S_BUILD_FAILED
    fi

    TIMEFORMAT='%3Rs'
    RUN_TIME=$( { time { timeout --foreground $TIMEOUT make -C "$ROOT" A="$APP" $args justrun > "$actual" 2>&1; }; } 2>&1 )
    local res=$?
    if [ $res == 124 ]; then
        return $S_TIMEOUT
    elif [ $res -ne 0 ]; then
        return $S_FAILED
    fi

    compare "$actual" "$expect"
    if [ $? -ne 0 ]; then
        return $S_FAILED
    else
        return $S_PASS
    fi
}

function test_one() {
    local args=$1
    local expect="$APP/$2"
    local actual="$APP/actual.out"
    args="$args ARCH=$ARCH ACCEL=n"
    rm -f "$actual"

    MSG=
    run_and_compare "$args" "$expect" "$actual"
    local res=$?

    if [ $res -ne $S_PASS ]; then
        EXIT_STATUS=$res
        if [ $res == $S_FAILED ]; then
            echo -e "${RED_C}failed!${END_C} $RUN_TIME"
        elif [ $res == $S_TIMEOUT ]; then
            echo -e "${YELLOW_C}timeout!${END_C} $RUN_TIME"
        elif [ $res == $S_BUILD_FAILED ]; then
            echo -e "${RED_C}build failed!${END_C}"
        fi
        if [ ! -z "$MSG" ]; then
            echo -e "        $MSG"
        fi
        echo -e "${RED_C}actual output${END_C}:"
        cat "$actual"
    else
        echo -e "${GREEN_C}passed!${END_C} $RUN_TIME"
        rm -f "$actual"
    fi
}

if [ -z "$1" ]; then
    test_list=(
        "apps/net/bwbench"
    )
else
    test_list="$@"
fi

for t in ${test_list[@]}; do
    if [ -z "$1" ]; then
        APP=$(realpath "$ROOT/$t")
    else
        APP=$(realpath "$(pwd)/$t")
    fi
    echo -e "${CYAN_C}Testing${END_C} $t:"
    source "$APP/test_cmd"
done

echo -e "test script exited with: $EXIT_STATUS"
exit $EXIT_STATUS
