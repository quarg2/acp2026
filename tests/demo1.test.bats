#!/usr/bin/env bats

@test "demo 1 test 1" {
	run bash -c './demo1.out <<EOF
	3
	3.2
	-2.4
	0.46
EOF'
	[[ "$output" == *"The maximum value is 3.200000 at index 0"* ]] || [[ "$output" == *"The maximum value is 3.200010 at index 0"* ]]
}

@test "demo 1 test 2" {
	run bash -c './demo1.out <<EOF
	3
	0
	0
	0
EOF'
	[[ "$output" == *"The maximum value is 0.000000 at index 0"* ]]
}

@test "demo 1 test 3" {
	run bash -c './demo1.out <<EOF
	3
	-5
	-3.24561
	-9
EOF'
	[[ "$output" == *"The maximum value is -3.245610 at index 1"* ]]
}

@test "demo 1 test 4" {
	run bash -c './demo1.out <<EOF
	1
	123.456
EOF'
	[[ "$output" == *"The maximum value is 123.456001 at index 0"* ]] || [[ "$output" == *"The maximum value is 123.456000 at index 0"* ]]
}

@test "demo 1 test 5" {
	run bash -c './demo1.out <<EOF
	2
	10
	20
EOF'
	[[ "$output" == *"The maximum value is 20.000000 at index 1"* ]]
}

@test "demo 1 test 6" {
	run bash -c './demo1.out <<EOF
	4
	1
	2
	3
	4
EOF'
	[[ "$output" == *"The maximum value is 4.000000 at index 3"* ]]
}

@test "demo 1 test 7" {
	run bash -c './demo1.out <<EOF
	2
	2.5
	2.5
EOF'
	[[ "$output" == *"The maximum value is 2.500000 at index 0"* ]]
}

@test "demo 1 test 8" {
	run bash -c './demo1.out <<EOF
	3
	10.5
	10.6
	10.4
EOF'
	[[ "$output" == *"The maximum value is 10.600000 at index 1"* ]]
}

@test "demo 1 test 9" {
	run bash -c './demo1.out <<EOF
	5
	-1
	-2
	0
	1
	2
EOF'
	[[ "$output" == *"The maximum value is 2.000000 at index 4"* ]]
}

@test "demo 1 test 10" {
	run bash -c './demo1.out <<EOF
	2
	-100
	-10
EOF'
	[[ "$output" == *"The maximum value is -10.000000 at index 1"* ]]
}
