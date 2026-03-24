#!/usr/bin/env bats

@test "act 1 test 1" {
	run bash -c './act1.out <<EOF
7
25.5
26.0
24.8
27.2
23.5
28.1
25.0
EOF'
	[[ "$output" == *"The lowest temperature is 23.500000 and the highest is 28.100000"* ]]
}

@test "act 1 test 2" {
	run bash -c './act1.out <<EOF
3
20.0
20.0
20.0
EOF'
	[[ "$output" == *"The lowest temperature is 20.000000 and the highest is 20.000000"* ]]
}

@test "act 1 test 3" {
	run bash -c './act1.out <<EOF
5
10
20
30
40
50
EOF'
	[[ "$output" == *"The lowest temperature is 10.000000 and the highest is 50.000000"* ]]
}

@test "act 1 test 4" {
	run bash -c './act1.out <<EOF
5
50
40
30
20
10
EOF'
	[[ "$output" == *"The lowest temperature is 10.000000 and the highest is 50.000000"* ]]
}

@test "act 1 test 5" {
	run bash -c './act1.out <<EOF
3
-5.5
-10.2
-2.1
EOF'
	[[ "$output" == *"The lowest temperature is -10.200000 and the highest is -2.100000"* ]]
}

@test "act 1 test 6" {
	run bash -c './act1.out <<EOF
4
-10
0 
10
5
EOF'
	[[ "$output" == *"The lowest temperature is -10.000000 and the highest is 10.000000"* ]]
}

@test "act 1 test 7" {
	run bash -c './act1.out <<EOF
1
100
EOF'
	[[ "$output" == *"The lowest temperature is 100.000000 and the highest is 100.000000"* ]]
}

@test "act 1 test 8" {
	run bash -c './act1.out <<EOF
2
10.5
5.5
EOF'
	[[ "$output" == *"The lowest temperature is 5.500000 and the highest is 10.500000"* ]]
}

@test "act 1 test 9" {
	run bash -c './act1.out <<EOF
3
1.111111
2.222222
3.333333
EOF'
	[[ "$output" == *"The lowest temperature is 1.111111 and the highest is 3.333333"* ]]
}

@test "act 1 test 10" {
	run bash -c './act1.out <<EOF
3
9999.9
0.1
5000.5
EOF'
	[[ "$output" == *"The lowest temperature is 0.100000 and the highest is 9999.900000"* ]] || [[ "$output" == *"The lowest temperature is 0.100000 and the highest is 9999.900391"* ]]
}
