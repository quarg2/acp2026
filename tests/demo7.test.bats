#!/usr/bin/env bats

@test "demo 7 test 1" {
  run ./demo7.out <<EOF
hello
hello
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Strings 1 and 2 are equal"* ]]
}

@test "demo 7 test 2" {
  run ./demo7.out <<EOF
apple
banana
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"String 1 is lesser than string 2"* ]]
}

@test "demo 7 test 3" {
  run ./demo7.out <<EOF
zebra
ant
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"String 1 is greater than string 2"* ]]
}

@test "demo 7 test 4" {
  run ./demo7.out <<EOF
abc
abcd
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"String 1 is lesser than string 2"* ]]
}

@test "demo 7 test 5" {
  run ./demo7.out <<EOF
abcd
abc
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"String 1 is greater than string 2"* ]]
}

@test "demo 7 test 6" {
  run ./demo7.out <<EOF
HELLO
hello
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"String 1 is lesser than string 2"* ]]
}

@test "demo 7 test 7" {
  run ./demo7.out <<EOF
123
123
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Strings 1 and 2 are equal"* ]]
}

@test "demo 7 test 8" {
  run ./demo7.out <<EOF
123
456
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"String 1 is lesser than string 2"* ]]
}

@test "demo 7 test 9" {
  run ./demo7.out <<EOF
test
test
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Strings 1 and 2 are equal"* ]]
}

@test "demo 7 test 10" {
  run ./demo7.out <<EOF
A
B
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"String 1 is lesser than string 2"* ]]
}
