#!/usr/bin/env bats

@test "demo 6 test 1" {
  run ./demo6.out <<EOF
3
100
200
300
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"100"*"200"*"300"* ]]
}

@test "demo 6 test 2" {
  run ./demo6.out <<EOF
1
5
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"5"* ]]
}

@test "demo 6 test 3" {
  run ./demo6.out <<EOF
2
10
20
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"10"*"20"* ]]
}

@test "demo 6 test 4" {
  run ./demo6.out <<EOF
4
1
2
3
4
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"1"*"2"*"3"*"4"* ]]
}

@test "demo 6 test 5" {
  run ./demo6.out <<EOF
5
0
0
0
0
0
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"0"*"0"*"0"*"0"*"0"* ]]
}

@test "demo 6 test 6" {
  run ./demo6.out <<EOF
2
-5
-10
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"-5"*"-10"* ]]
}

@test "demo 6 test 7" {
  run ./demo6.out <<EOF
3
1
0
-1
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"1"*"0"*"-1"* ]]
}

@test "demo 6 test 8" {
  run ./demo6.out <<EOF
1
0
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"0"* ]]
}

@test "demo 6 test 9" {
  run ./demo6.out <<EOF
2
999
111
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"999"*"111"* ]]
}

@test "demo 6 test 10" {
  run ./demo6.out <<EOF
6
1
2
3
4
5
6
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"1"*"2"*"3"*"4"*"5"*"6"* ]]
}
