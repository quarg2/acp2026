#!/usr/bin/env bats

@test "demo 10 test 1" {
	run bash -c './demo10.out <<EOF
1
101
Alice
95.5
EOF'
	[[ "$output" == *"Roll number: 101"* ]]
	[[ "$output" == *"Name: Alice"* ]]
	[[ "$output" == *"Marks: 95.500000"* ]]
}

@test "demo 10 test 2" {
	run bash -c './demo10.out <<EOF
2
101
Alice
95.5
102
Bob
88.0
EOF'
	[[ "$output" == *"Roll number: 101"* ]]
	[[ "$output" == *"Name: Alice"* ]]
	[[ "$output" == *"Marks: 95.500000"* ]]
	[[ "$output" == *"Roll number: 102"* ]]
	[[ "$output" == *"Name: Bob"* ]]
	[[ "$output" == *"Marks: 88.000000"* ]]
}

@test "demo 10 test 3" {
	run bash -c './demo10.out <<EOF
3
1
Charlie
75.25
2
David
82.5
3
Eve
91.0
EOF'
	[[ "$output" == *"Roll number: 1"* ]]
	[[ "$output" == *"Name: Charlie"* ]]
	[[ "$output" == *"Roll number: 2"* ]]
	[[ "$output" == *"Name: David"* ]]
	[[ "$output" == *"Roll number: 3"* ]]
	[[ "$output" == *"Name: Eve"* ]]
}

@test "demo 10 test 4" {
	run bash -c './demo10.out <<EOF
1
500
Frank Castle
100.0
EOF'
	[[ "$output" == *"Roll number: 500"* ]]
	[[ "$output" == *"Name: Frank Castle"* ]]
	[[ "$output" == *"Marks: 100.000000"* ]]
}

@test "demo 10 test 5" {
	run bash -c './demo10.out <<EOF
2
10
Grace Hopper
99.9
20
Heidi Klum
92.1
EOF'
	[[ "$output" == *"Roll number: 10"* ]]
	[[ "$output" == *"Name: Grace Hopper"* ]]
	[[ "$output" == *"Roll number: 20"* ]]
	[[ "$output" == *"Name: Heidi Klum"* ]]
}

@test "demo 10 test 6" {
	run bash -c './demo10.out <<EOF
1
999
Inspector Gadget
0.0
EOF'
	[[ "$output" == *"Roll number: 999"* ]]
	[[ "$output" == *"Name: Inspector Gadget"* ]]
	[[ "$output" == *"Marks: 0.000000"* ]]
}

@test "demo 10 test 7" {
	run bash -c './demo10.out <<EOF
4
1
John Doe
70.0
2
Jane Smith
80.0
3
Jim Beam
90.0
4
Jack Daniels
60.0
EOF'
	[[ "$output" == *"Name: John Doe"* ]]
	[[ "$output" == *"Name: Jane Smith"* ]]
	[[ "$output" == *"Name: Jim Beam"* ]]
	[[ "$output" == *"Name: Jack Daniels"* ]]
}

@test "demo 10 test 8" {
	run bash -c './demo10.out <<EOF
1
7
Lucky Seven
77.77
EOF'
	[[ "$output" == *"Roll number: 7"* ]]
	[[ "$output" == *"Name: Lucky Seven"* ]]
	[[ "$output" == *"Marks: 77.769997"* ]] || [[ "$output" == *"Marks: 77.770000"* ]] || [[ "$output" == *"Marks: 77.770004"* ]]
}

@test "demo 10 test 9" {
	run bash -c './demo10.out <<EOF
1
123
Marvin Martian
42.0
EOF'
	[[ "$output" == *"Roll number: 123"* ]]
	[[ "$output" == *"Name: Marvin Martian"* ]]
	[[ "$output" == *"Marks: 42.000000"* ]]
}

@test "demo 10 test 10" {
	run bash -c './demo10.out <<EOF
10
1
S1
10
2
S2
20
3
S3
30
4
S4
40
5
S5
50
6
S6
60
7
S7
70
8
S8
80
9
S9
90
10
S10
100
EOF'
	[[ "$output" == *"Name: S1"* ]]
	[[ "$output" == *"Name: S5"* ]]
	[[ "$output" == *"Name: S10"* ]]
}
