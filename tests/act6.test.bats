#!/usr/bin/env bats

@test "act 6 test 1" {
	run bash -c './act6.out <<EOF
1
100
EOF'
	[[ "$output" == *"Player 1	Score 100"* ]]
	[[ "$output" == *"The total score is 100"* ]]
}

@test "act 6 test 2" {
	run bash -c './act6.out <<EOF
2
50
75
EOF'
	[[ "$output" == *"Player 1	Score 50"* ]]
	[[ "$output" == *"Player 2	Score 75"* ]]
	[[ "$output" == *"The total score is 125"* ]]
}

@test "act 6 test 3" {
	run bash -c './act6.out <<EOF
3
10
20
30
EOF'
	[[ "$output" == *"The total score is 60"* ]]
}

@test "act 6 test 4" {
	run bash -c './act6.out <<EOF
2
0
0
EOF'
	[[ "$output" == *"The total score is 0"* ]]
}

@test "act 6 test 5" {
	run bash -c './act6.out <<EOF
2
-10
10
EOF'
	[[ "$output" == *"The total score is 0"* ]]
}

@test "act 6 test 6" {
	run bash -c './act6.out <<EOF
5
1
2
3
4
5
EOF'
	[[ "$output" == *"The total score is 15"* ]]
}

@test "act 6 test 7" {
	run bash -c './act6.out <<EOF
1
1000000
EOF'
	[[ "$output" == *"The total score is 1000000"* ]]
}

@test "act 6 test 8" {
	run bash -c './act6.out <<EOF
4
100
-50
25
0
EOF'
	[[ "$output" == *"The total score is 75"* ]]
}

@test "act 6 test 9" {
	run bash -c './act6.out <<EOF
3
99
99
99
EOF'
	[[ "$output" == *"The total score is 297"* ]]
}

@test "act 6 test 10" {
	run bash -c './act6.out <<EOF
10
1
1
1
1
1
1
1
1
1
1
EOF'
	[[ "$output" == *"The total score is 10"* ]]
}
