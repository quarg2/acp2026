#!/usr/bin/env bats

@test "act 8 test 1" {
	run bash -c './act8.out <<EOF
hello
EOF'
	[[ "$output" == *"The string 'hello' has 2 vowels and 3 consonants"* ]]
}

@test "act 8 test 2" {
	run bash -c './act8.out <<EOF
HELLO
EOF'
	[[ "$output" == *"The string 'HELLO' has 2 vowels and 3 consonants"* ]]
}

@test "act 8 test 3" {
	run bash -c './act8.out <<EOF
Hello World
EOF'
	[[ "$output" == *"The string 'Hello World' has 3 vowels and 7 consonants"* ]]
}

@test "act 8 test 4" {
	run bash -c './act8.out <<EOF
aeiouAEIOU
EOF'
	[[ "$output" == *"The string 'aeiouAEIOU' has 10 vowels and 0 consonants"* ]]
}

@test "act 8 test 5" {
	run bash -c './act8.out <<EOF
bcdfghjklmnpqrstvwxyz
EOF'
	[[ "$output" == *"The string 'bcdfghjklmnpqrstvwxyz' has 0 vowels and 21 consonants"* ]]
}

@test "act 8 test 6" {
	run bash -c './act8.out <<EOF
123!@#
EOF'
	[[ "$output" == *"The string '123!@#' has 0 vowels and 0 consonants"* ]]
}

@test "act 8 test 7" {
	run bash -c './act8.out <<EOF
One 2 Three
EOF'
	[[ "$output" == *"The string 'One 2 Three' has 4 vowels and 4 consonants"* ]]
}

@test "act 8 test 8" {
	run bash -c './act8.out <<EOF

EOF'
	[[ "$output" == *"The string '' has 0 vowels and 0 consonants"* ]]
}

@test "act 8 test 9" {
	run bash -c './act8.out <<EOF
A
EOF'
	[[ "$output" == *"The string 'A' has 1 vowels and 0 consonants"* ]]
}

@test "act 8 test 10" {
	run bash -c './act8.out <<EOF
Z
EOF'
	[[ "$output" == *"The string 'Z' has 0 vowels and 1 consonants"* ]]
}
