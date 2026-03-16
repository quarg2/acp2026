#!/usr/bin/env bats

@test "demo1 test 1" {
	run bash -c './demo1.out <<EOF
	3
	3.2
	-2.4
	0.46
EOF'

#	echo $output >&3

	[ "$output" = "Enter number of values: Enter 1 value: Enter 2 value: Enter 3 value: The maximum value is 3.200000 at index 0" ]
}

@test "demo1 test 2" {
	run bash -c './demo1.out <<EOF
	3
	0
	0
	0
EOF'

	[ "$output" = "Enter number of values: Enter 1 value: Enter 2 value: Enter 3 value: The maximum value is 0.000000 at index 0" ]
}

@test "demo1 test 3" {
	run bash -c './demo1.out <<EOF
	3
	-5
	-3.24561
	-9
EOF'

	echo $output >&3

	[ "$output" = "Enter number of values: Enter 1 value: Enter 2 value: Enter 3 value: The maximum value is -3.245610 at index 1" ]
}
