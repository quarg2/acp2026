#!/usr/bin/env bats

@test "demo 5 test 1" {
  run ./demo5.out <<EOF
3
1
2
3
4
5
6
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array a"*"4"*"5"*"6"*"Array b"*"1"*"2"*"3"* ]]
}

@test "demo 5 test 2" {
  run ./demo5.out <<EOF
2
10
20
30
40
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array a"*"30"*"40"*"Array b"*"10"*"20"* ]]
}

@test "demo 5 test 3" {
  run ./demo5.out <<EOF
1
100
200
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array a"*"200"*"Array b"*"100"* ]]
}

@test "demo 5 test 4" {
  run ./demo5.out <<EOF
4
1
1
1
1
0
0
0
0
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array a"*"0"*"0"*"0"*"0"*"Array b"*"1"*"1"*"1"*"1"* ]]
}

@test "demo 5 test 5" {
  run ./demo5.out <<EOF
2
-1
-2
-3
-4
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array a"*"-3"*"-4"*"Array b"*"-1"*"-2"* ]]
}

@test "demo 5 test 6" {
  run ./demo5.out <<EOF
3
0
0
0
1
2
3
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array a"*"1"*"2"*"3"*"Array b"*"0"*"0"*"0"* ]]
}

@test "demo 5 test 7" {
  run ./demo5.out <<EOF
1
0
0
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array a"*"0"*"Array b"*"0"* ]]
}

@test "demo 5 test 8" {
  run ./demo5.out <<EOF
2
99
88
77
66
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array a"*"77"*"66"*"Array b"*"99"*"88"* ]]
}

@test "demo 5 test 9" {
  run ./demo5.out <<EOF
5
1
2
3
4
5
6
7
8
9
10
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array a"*"6"*"7"*"8"*"9"*"10"*"Array b"*"1"*"2"*"3"*"4"*"5"* ]]
}

@test "demo 5 test 10" {
  run ./demo5.out <<EOF
2
123
456
789
0
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Array a"*"789"*"0"*"Array b"*"123"*"456"* ]]
}
