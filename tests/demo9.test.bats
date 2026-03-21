#!/usr/bin/env bats

@test "demo 9 test 1" {
	run bash -c './demo9.out <<EOF
1
Alice
10
95.5
EOF'
	[[ "$output" == *"Student 1"* ]]
	[[ "$output" == *"name: Alice"* ]]
	[[ "$output" == *"class: 10"* ]]
	[[ "$output" == *"Marks: 95.500000"* ]]
}

@test "demo 9 test 2" {
	run bash -c './demo9.out <<EOF
2
Bob
11
85.0
Charlie
12
75.5
EOF'
	[[ "$output" == *"Student 1"* ]]
	[[ "$output" == *"name: Bob"* ]]
	[[ "$output" == *"class: 11"* ]]
	[[ "$output" == *"Marks: 85.000000"* ]]
	[[ "$output" == *"Student 2"* ]]
	[[ "$output" == *"name: Charlie"* ]]
	[[ "$output" == *"class: 12"* ]]
	[[ "$output" == *"Marks: 75.500000"* ]]
}

@test "demo 9 test 3" {
	run bash -c './demo9.out <<EOF
3
Dave
9
100
Eve
12
0
Frank
10
88.88
EOF'
	[[ "$output" == *"name: Dave"* ]]
	[[ "$output" == *"Marks: 100.000000"* ]]
	[[ "$output" == *"name: Eve"* ]]
	[[ "$output" == *"Marks: 0.000000"* ]]
	[[ "$output" == *"name: Frank"* ]]
	[[ "$output" == *"Marks: 88.879997"* ]] || [[ "$output" == *"Marks: 88.880005"* ]] || [[ "$output" == *"Marks: 88.880000"* ]]
}

@test "demo 9 test 4" {
	run bash -c './demo9.out <<EOF
4
Grace
5
90
Heidi
6
80
Ivan
7
70
Judy
11
66.6
EOF'
	[[ "$output" == *"name: Grace"* ]]
	[[ "$output" == *"name: Heidi"* ]]
	[[ "$output" == *"name: Ivan"* ]]
	[[ "$output" == *"name: Judy"* ]]
}

@test "demo 9 test 5" {
	run bash -c './demo9.out <<EOF
5
Kevin
3
50.5
Leo
4
40.4
Mallory
10
12.34
Sybil
1
100.0
Trent
2
99.9
EOF'
	[[ "$output" == *"name: Kevin"* ]]
	[[ "$output" == *"name: Leo"* ]]
	[[ "$output" == *"name: Mallory"* ]]
	[[ "$output" == *"name: Sybil"* ]]
	[[ "$output" == *"name: Trent"* ]]
}

@test "demo 9 test 6" {
	run bash -c './demo9.out <<EOF
1
Oscar
8
88.5
EOF'
	[[ "$output" == *"name: Oscar"* ]]
	[[ "$output" == *"class: 8"* ]]
	[[ "$output" == *"Marks: 88.500000"* ]]
}

@test "demo 9 test 7" {
	run bash -c './demo9.out <<EOF
2
Peggy
9
90.1
Quentin
10
90.2
EOF'
	[[ "$output" == *"name: Peggy"* ]]
	[[ "$output" == *"name: Quentin"* ]]
}

@test "demo 9 test 8" {
	run bash -c './demo9.out <<EOF
1
Romeo
11
11.11
EOF'
	[[ "$output" == *"name: Romeo"* ]]
	[[ "$output" == *"Marks: 11.110000"* ]] || [[ "$output" == *"Marks: 11.110001"* ]]
}

@test "demo 9 test 9" {
	run bash -c './demo9.out <<EOF
1
Steve
12
12.12
EOF'
	[[ "$output" == *"name: Steve"* ]]
	[[ "$output" == *"Marks: 12.120000"* ]] || [[ "$output" == *"Marks: 12.120001"* ]]
}

@test "demo 9 test 10" {
	run bash -c './demo9.out <<EOF
10
Victor
1
1.1
Ursula
2
2.2
Walter
3
3.3
Xavier
4
4.4
Yasmine
5
5.5
Zane
6
6.6
Alfie
7
7.7
Bertie
8
8.8
Cathy
9
9.9
Daisy
10
10.0
EOF'
	[[ "$output" == *"name: Victor"* ]]
	[[ "$output" == *"name: Ursula"* ]]
	[[ "$output" == *"name: Walter"* ]]
	[[ "$output" == *"name: Xavier"* ]]
	[[ "$output" == *"name: Yasmine"* ]]
	[[ "$output" == *"name: Zane"* ]]
	[[ "$output" == *"name: Alfie"* ]]
	[[ "$output" == *"name: Bertie"* ]]
	[[ "$output" == *"name: Cathy"* ]]
	[[ "$output" == *"name: Daisy"* ]]
}
