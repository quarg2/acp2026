#!/usr/bin/env bats

@test "act 7 test 1" {
	run bash -c './act7.out <<EOF
Alice
Bo
EOF'
	[[ "$output" == *"Name 1, Alice, is longer with 5 characters"* ]]
}

@test "act 7 test 2" {
	run bash -c './act7.out <<EOF
Bo
Alice
EOF'
	[[ "$output" == *"Name 2, Alice, is longer with 5 characters"* ]]
}

@test "act 7 test 3" {
	run bash -c './act7.out <<EOF
Alice
Bobbi
EOF'
	[[ "$output" == *"Both names, Alice, and Bobbi, are equally long with 5 characters"* ]]
}

@test "act 7 test 4" {
	run bash -c './act7.out <<EOF
Alice Smith
Bob Brown
EOF'
	[[ "$output" == *"Name 1, Alice Smith, is longer with 11 characters"* ]]
}

@test "act 7 test 5" {
	run bash -c './act7.out <<EOF
A
B
EOF'
	[[ "$output" == *"Both names, A, and B, are equally long with 1 characters"* ]]
}

@test "act 7 test 6" {
	run bash -c './act7.out <<EOF
$(printf "a%.0s" {1..100})
$(printf "b%.0s" {1..50})
EOF'
	[[ "$output" == *"is longer with 100 characters"* ]]
}

@test "act 7 test 7" {
	run bash -c './act7.out <<EOF
User123
Admin
EOF'
	[[ "$output" == *"Name 1, User123, is longer with 7 characters"* ]]
}

@test "act 7 test 8" {
	run bash -c './act7.out <<EOF

Alice
EOF'
	[[ "$output" == *"Name 2, Alice, is longer with 5 characters"* ]]
}

@test "act 7 test 9" {
	run bash -c './act7.out <<EOF
@!!
#$
EOF'
	[[ "$output" == *"Name 1, @!!, is longer with 3 characters"* ]]
}

@test "act 7 test 10" {
	run bash -c './act7.out <<EOF
ABCDE
abcde
EOF'
	[[ "$output" == *"Both names, ABCDE, and abcde, are equally long with 5 characters"* ]]
}
