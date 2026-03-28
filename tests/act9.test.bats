#!/usr/bin/env bats

@test "act 9 test 1" {
	run bash -c './act9.out <<EOF
1
101
John
1000.5
EOF'
	[[ "$output" == *"The total salary that must be paid is 1000.500000"* ]]
}

@test "act 9 test 2" {
	run bash -c './act9.out <<EOF
2
101
Alice
2000
102
Bob
1500
EOF'
	[[ "$output" == *"The total salary that must be paid is 3500.000000"* ]]
}

@test "act 9 test 3" {
	run bash -c './act9.out <<EOF
3
1
A
100.25
2
B
200.75
3
C
300.00
EOF'
	[[ "$output" == *"The total salary that must be paid is 601.000000"* ]]
}

@test "act 9 test 4" {
	run bash -c './act9.out <<EOF
2
1
Free1
0
2
Free2
0
EOF'
	[[ "$output" == *"The total salary that must be paid is 0.000000"* ]]
}

@test "act 9 test 5" {
	run bash -c './act9.out <<EOF
4
101
E1
0.1
102
E2
0.2
103
E3
0.3
104
E4
0.4
EOF'
	[[ "$output" == *"The total salary that must be paid is 1.000000"* ]]
}

@test "act 9 test 6" {
	run bash -c './act9.out <<EOF
1
101
ThisIsAVeryLongEmployeeNameWithoutSpaces
5000
EOF'
	[[ "$output" == *"The total salary that must be paid is 5000.000000"* ]]
}

@test "act 9 test 7" {
	run bash -c './act9.out <<EOF
1
999999
MisterX
10.5
EOF'
	[[ "$output" == *"The total salary that must be paid is 10.500000"* ]]
}

@test "act 9 test 8" {
	run bash -c './act9.out <<EOF
5
1
E1
100
2
E2
100
3
E3
100
4
E4
100
5
E5
100
EOF'
	[[ "$output" == *"The total salary that must be paid is 500.000000"* ]]
}

@test "act 9 test 9" {
	run bash -c './act9.out <<EOF
2
1
E1
10.123
2
E2
20.456
EOF'
	[[ "$output" == *"The total salary that must be paid is 30.579000"* ]] || [[ "$output" == *"The total salary that must be paid is 30.578999"* ]]
}

@test "act 9 test 10" {
	run bash -c './act9.out <<EOF
10
1
E1
10
2
E2
10
3
E3
10
4
E4
10
5
E5
10
6
E6
10
7
E7
10
8
E8
10
9
E9
10
10
E10
10
EOF'
	[[ "$output" == *"The total salary that must be paid is 100.000000"* ]]
}
