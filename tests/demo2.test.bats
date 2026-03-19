#!/usr/bin/env bats

@test "demo 2 test 1" {
    run bash -c './demo2.out <<EOF
    3 2
    5 6
    2 3
EOF'
    [[ "$output" == *"Rectangle 2 has the largest area"* ]]
}

@test "demo 2 test 2" {
	run bash -c './demo2.out <<EOF
	3 2
	3 2
	3 2
EOF'
	[[ "$output" == *"The rectangles have equal areas"* ]]
}

@test "demo 2 test 3" {
	run bash -c './demo2.out <<EOF
	0 3
	0 0
	2 1
EOF'
	[[ "$output" == *"Rectangle 3 has the largest area"* ]]
}

@test "demo 2 test 4" {
	run bash -c './demo2.out <<EOF
	10 10
	1 1
	1 1
EOF'
	[[ "$output" == *"Rectangle 1 has the largest area"* ]]
}

@test "demo 2 test 5" {
	run bash -c './demo2.out <<EOF
	5 5
	10 2
	8 3
EOF'
	[[ "$output" == *"Rectangle 1 has the largest area"* ]]
}

@test "demo 2 test 6" {
	run bash -c './demo2.out <<EOF
	2 3
	4 5
	6 7
EOF'
	[[ "$output" == *"Rectangle 3 has the largest area"* ]]
}

@test "demo 2 test 7" {
	run bash -c './demo2.out <<EOF
	1 1
	2 2
	1.5 1.5
EOF'
	[[ "$output" == *"Rectangle 2 has the largest area"* ]]
}

@test "demo 2 test 8" {
	run bash -c './demo2.out <<EOF
	10 5
	25 2
	50 1
EOF'
	[[ "$output" == *"The rectangles have equal areas"* ]]
}

@test "demo 2 test 9" {
	run bash -c './demo2.out <<EOF
	100 0.1
	1 1
	0.5 2
EOF'
	[[ "$output" == *"Rectangle 1 has the largest area"* ]] || [[ "$output" == *"The rectangles have equal areas"* ]]
}

@test "demo 2 test 10" {
	run bash -c './demo2.out <<EOF
	-2 3
	4 5
	1 1
EOF'
	[[ "$output" == *"Rectangle 2 has the largest area"* ]]
}
