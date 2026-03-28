#!/usr/bin/env bats

@test "act 5 test 1" {
    run bash -c './act5.out <<EOF
Hello
World
EOF'
    [[ "${lines[0]}" == "World" ]]
    [[ "${lines[1]}" == "Hello" ]]
}

@test "act 5 test 2" {
    run bash -c './act5.out <<EOF

Test
EOF'
    [[ "${lines[0]}" == "Test" ]]
    [[ "${lines[1]}" == "" ]]
}

@test "act 5 test 3" {
    run bash -c './act5.out <<EOF
Alpha
 
EOF'
    [[ "${lines[0]}" == " " ]]
    [[ "${lines[1]}" == "Alpha" ]]
}

@test "act 5 test 4" {
    run bash -c './act5.out <<EOF


EOF'
    [[ "${lines[0]}" == "" ]]
    [[ "${lines[1]}" == "" ]]
}

@test "act 5 test 5" {
    run bash -c './act5.out <<EOF
New York
Los Angeles
EOF'
    [[ "${lines[0]}" == "Los Angeles" ]]
    [[ "${lines[1]}" == "New York" ]]
}

@test "act 5 test 6" {
    run bash -c './act5.out <<EOF
!@#$
1234
EOF'
    [[ "${lines[0]}" == "1234" ]]
    [[ "${lines[1]}" == "!@#$" ]]
}

@test "act 5 test 7" {
    run bash -c './act5.out <<EOF
This is a very long string indeed.
Short
EOF'
    [[ "${lines[0]}" == "Short" ]]
    [[ "${lines[1]}" == "This is a very long string indeed." ]]
}

@test "act 5 test 8" {
    run bash -c './act5.out <<EOF
ABC
ABCDEFGHIJKLMNOPQRSTUVWXYZ
EOF'
    [[ "${lines[0]}" == "ABCDEFGHIJKLMNOPQRSTUVWXYZ" ]]
    [[ "${lines[1]}" == "ABC" ]]
}

@test "act 5 test 9" {
    run bash -c './act5.out <<EOF
Repeat
Repeat
EOF'
    [[ "${lines[0]}" == "Repeat" ]]
    [[ "${lines[1]}" == "Repeat" ]]
}

@test "act 5 test 10" {
    run bash -c './act5.out <<EOF
abc
ABC
EOF'
    [[ "${lines[0]}" == "ABC" ]]
    [[ "${lines[1]}" == "abc" ]]
}
