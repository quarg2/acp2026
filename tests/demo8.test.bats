#!/usr/bin/env bats

@test "demo 8 test 1" {
  run ./demo8.out <<EOF
hello
world
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"helloworld"* ]]
}

@test "demo 8 test 2" {
  run ./demo8.out <<EOF
The quick 
brown fox
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"The quick brown fox"* ]]
}

@test "demo 8 test 3" {
  run ./demo8.out <<EOF
abc

EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"abc"* ]]
}

@test "demo 8 test 4" {
  run ./demo8.out <<EOF

xyz
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"xyz"* ]]
}

@test "demo 8 test 5" {
  run ./demo8.out <<EOF
123
456
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"123456"* ]]
}

@test "demo 8 test 6" {
  run ./demo8.out <<EOF
first
last
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"firstlast"* ]]
}

@test "demo 8 test 7" {
  run ./demo8.out <<EOF
test
ing
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"testing"* ]]
}

@test "demo 8 test 8" {
  run ./demo8.out <<EOF
A
B
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"AB"* ]]
}

@test "demo 8 test 9" {
  run ./demo8.out <<EOF
long_string_part_1
long_string_part_2
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"long_string_part_1long_string_part_2"* ]]
}

@test "demo 8 test 10" {
  run ./demo8.out <<EOF
_
_
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"__"* ]]
}
