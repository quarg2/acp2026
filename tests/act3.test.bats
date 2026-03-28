#!/usr/bin/env bats

@test "act 3 test 1" {
	run bash -c './act3.out <<EOF
1
101
100
5.5
EOF'
	[[ "$output" == *"The highest bill is from id 101, with 100.000000 units consumed and 550.000000 amount"* ]]
}

@test "act 3 test 2" {
	run bash -c './act3.out <<EOF
2
101
150
4
102
50
4
EOF'
	[[ "$output" == *"The highest bill is from id 101, with 150.000000 units consumed and 600.000000 amount"* ]]
}

@test "act 3 test 3" {
	run bash -c './act3.out <<EOF
2
101
50
4
102
150
4
EOF'
	[[ "$output" == *"The highest bill is from id 102, with 150.000000 units consumed and 600.000000 amount"* ]]
}

@test "act 3 test 4" {
	run bash -c './act3.out <<EOF
3
101
100
2
102
200
5
103
150
3
EOF'
	[[ "$output" == *"The highest bill is from id 102, with 200.000000 units consumed and 1000.000000 amount"* ]]
}

@test "act 3 test 5" {
	run bash -c './act3.out <<EOF
2
201
100
10
202
100
10
EOF'
	[[ "$output" == *"The highest bill is from id 201, with 100.000000 units consumed and 1000.000000 amount"* ]]
}

@test "act 3 test 6" {
	run bash -c './act3.out <<EOF
1
999999
10
2.5
EOF'
	[[ "$output" == *"The highest bill is from id 999999, with 10.000000 units consumed and 25.000000 amount"* ]]
}

@test "act 3 test 7" {
	run bash -c './act3.out <<EOF
2
1
25.5
1.5
2
10.2
3.2
EOF'
	[[ "$output" == *"The highest bill is from id 1, with 25.500000 units consumed and 38.250000 amount"* ]]
}

@test "act 3 test 8" {
	run bash -c './act3.out <<EOF
2
1
0
10
2
0
20
EOF'
	[[ "$output" == *"The highest bill is from id 1, with 0.000000 units consumed and 0.000000 amount"* ]]
}

@test "act 3 test 9" {
	run bash -c './act3.out <<EOF
5
1
10
1
2
20
1
3
30
1
4
40
1
5
50
1
EOF'
	[[ "$output" == *"The highest bill is from id 5, with 50.000000 units consumed and 50.000000 amount"* ]]
}

@test "act 3 test 10" {
	run bash -c './act3.out <<EOF
3
300
1.1
100
100
50.5
2
200
99.9
1
EOF'
	[[ "$output" == *"The highest bill is from id 300, with 1.100000 units consumed and 110.000000 amount"* ]]
}
