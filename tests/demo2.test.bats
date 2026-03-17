#!/usr/bin/env bats

@test "demo2 test 1" {
    run bash -c './demo2.out <<EOF
    3
    2
    5
    6
    2
    3
EOF'

    [ "$output" = "Enter length and width of rectangle: Enter length and width of rectangle: Enter length and width of rectangle: Rectangle 2 has the largest area" ]
}

@test "demo2 test 2" {
	run bash -c './demo2.out <<EOF
	3
	2
	3
	2
	3
	2
EOF'

	[ "$output" = "Enter length and width of rectangle: Enter length and width of rectangle: Enter length and width of rectangle: The rectangles have equal areas" ]

}

@test "demo2 test 3" {
	run bash -c './demo2.out <<EOF
	0
	3
	0
	0
	2
	1
EOF'

	[ "$output" = "Enter length and width of rectangle: Enter length and width of rectangle: Enter length and width of rectangle: Rectangle 3 has the largest area" ]
}
