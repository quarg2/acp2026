#!/usr/bin/env bats

@test "act 10 test 1" {
	run bash -c './act10.out <<EOF
1
101
London
550.5
EOF'
	[[ "$output" == *"The most expensive flight is 101 to London at price 550.500000"* ]]
}

@test "act 10 test 2" {
	run bash -c './act10.out <<EOF
2
101
New_York
1000
102
Paris
800
EOF'
	[[ "$output" == *"The most expensive flight is 101 to New_York at price 1000.000000"* ]]
}

@test "act 10 test 3" {
	run bash -c './act10.out <<EOF
2
101
Paris
800
102
New_York
1000
EOF'
	[[ "$output" == *"The most expensive flight is 102 to New_York at price 1000.000000"* ]]
}

@test "act 10 test 4" {
	run bash -c './act10.out <<EOF
3
101
Delhi
200
102
Mumbai
400
103
Bangalore
300
EOF'
	[[ "$output" == *"The most expensive flight is 102 to Mumbai at price 400.000000"* ]]
}

@test "act 10 test 5" {
	run bash -c './act10.out <<EOF
2
101
CityA
500
102
CityB
500
EOF'
	# Usually the first one encountered is kept.
	[[ "$output" == *"The most expensive flight is 101 to CityA at price 500.000000"* ]]
}

@test "act 10 test 6" {
	run bash -c './act10.out <<EOF
1
505
San_Francisco
1200.75
EOF'
	[[ "$output" == *"The most expensive flight is 505 to San_Francisco at price 1200.750000"* ]]
}

@test "act 10 test 7" {
	run bash -c './act10.out <<EOF
5
1
A
10
2
B
20
3
C
30
4
D
40
5
E
50
EOF'
	[[ "$output" == *"The most expensive flight is 5 to E at price 50.000000"* ]]
}

@test "act 10 test 8" {
	run bash -c './act10.out <<EOF
2
101
A
100.01
102
B
100.02
EOF'
	[[ "$output" == *"The most expensive flight is 102 to B at price 100.019997"* ]] || [[ "$output" == *"The most expensive flight is 102 to B at price 100.020000"* ]] || [[ "$output" == *"The most expensive flight is 102 to B at price 100.02"* ]]
}

@test "act 10 test 9" {
	run bash -c './act10.out <<EOF
4
11
X
100
22
Y
200
33
Z
50
44
W
150
EOF'
	[[ "$output" == *"The most expensive flight is 22 to Y at price 200.000000"* ]]
}

@test "act 10 test 10" {
	run bash -c './act10.out <<EOF
1
9999
Mars
1000000.0
EOF'
	[[ "$output" == *"The most expensive flight is 9999 to Mars at price 1000000.000000"* ]]
}
