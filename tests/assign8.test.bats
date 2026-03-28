#!/usr/bin/env bats

@test "assign 8 test 1" {
    run bash -c './assign8.out <<EOF
ValidPass1
EOF'
    [[ "$output" == *"is valid"* ]]
}

@test "assign 8 test 2" {
    run bash -c './assign8.out <<EOF
short
ValidPass1
EOF'
    [[ "$output" == *"is invalid"* ]]
    [[ "$output" == *"is valid"* ]]
}

@test "assign 8 test 3" {
    run bash -c './assign8.out <<EOF
nouppercase1
ValidPass1
EOF'
    [[ "$output" == *"is invalid"* ]]
}

@test "assign 8 test 4" {
    run bash -c './assign8.out <<EOF
NOLOWERCASE1
ValidPass1
EOF'
    [[ "$output" == *"is invalid"* ]]
}

@test "assign 8 test 5" {
    run bash -c './assign8.out <<EOF
NoDigitsHere
ValidPass1
EOF'
    [[ "$output" == *"is invalid"* ]]
}

@test "assign 8 test 6" {
    run bash -c './assign8.out <<EOF
12345678
ValidPass1
EOF'
    [[ "$output" == *"is invalid"* ]]
}

@test "assign 8 test 7" {
    run bash -c './assign8.out <<EOF
A1b2C3d4
EOF'
    [[ "$output" == *"is valid"* ]]
}

@test "assign 8 test 8" {
    run bash -c './assign8.out <<EOF
VeryLongPassword123ABC
EOF'
    [[ "$output" == *"is valid"* ]]
}

@test "assign 8 test 9" {
    run bash -c './assign8.out <<EOF
a
b
c
ValidPass1
EOF'
    [[ $(echo "$output" | grep -c "is invalid") -eq 3 ]]
    [[ "$output" == *"is valid"* ]]
}

@test "assign 8 test 10" {
    run bash -c './assign8.out <<EOF
Pass 123
EOF'
    # Includes space, but logic only checks for upper/lower/digit/length
    [[ "$output" == *"is valid"* ]]
}
