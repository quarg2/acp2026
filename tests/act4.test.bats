#!/usr/bin/env bats

@test "act 4 test 1" {
	run bash -c './act4.out <<EOF
P1
1
10
P2
2
10
P3
3
10
P4
4
10
P5
5
10
P6
6
10
P7
7
10
P8
8
10
P9
9
10
P10
10
10
P11
11
10
EOF'
	[[ "$output" == *"The average runs is 10.000000"* ]]
}

@test "act 4 test 2" {
	run bash -c './act4.out <<EOF
P1
1
0
P2
2
10
P3
3
20
P4
4
30
P5
5
40
P6
6
50
P7
7
60
P8
8
70
P9
9
80
P10
10
90
P11
11
100
EOF'
	[[ "$output" == *"The average runs is 50.000000"* ]]
}

@test "act 4 test 3" {
	run bash -c './act4.out <<EOF
P1
1
0
P2
2
0
P3
3
0
P4
4
0
P5
5
0
P6
6
0
P7
7
0
P8
8
0
P9
9
0
P10
10
0
P11
11
0
EOF'
	[[ "$output" == *"The average runs is 0.000000"* ]]
}

@test "act 4 test 4" {
	run bash -c './act4.out <<EOF
P1
1
100
P2
2
200
P3
3
300
P4
4
400
P5
5
500
P6
6
600
P7
7
700
P8
8
800
P9
9
900
P10
10
1000
P11
11
1100
EOF'
	[[ "$output" == *"The average runs is 600.000000"* ]]
}

@test "act 4 test 5" {
	run bash -c './act4.out <<EOF
P1
1
1
P2
2
1
P3
3
1
P4
4
1
P5
5
1
P6
6
1
P7
7
1
P8
8
1
P9
9
1
P10
10
1
P11
11
2
EOF'
	[[ "$output" == *"The average runs is 1.090909"* ]]
}

@test "act 4 test 6" {
	run bash -c './act4.out <<EOF
P1
1
1000
P2
2
0
P3
3
0
P4
4
0
P5
5
0
P6
6
0
P7
7
0
P8
8
0
P9
9
0
P10
10
0
P11
11
0
EOF'
	[[ "$output" == *"The average runs is 90.909088"* ]] || [[ "$output" == *"The average runs is 90.909091"* ]]
}

@test "act 4 test 7" {
	run bash -c './act4.out <<EOF
Sachin T
10
100
Virat K
18
50
Rohit S
45
30
MS Dhoni
7
70
Hardik P
33
20
Shikhar D
42
10
KL Rahul
1
15
R Pant
17
45
R Jadeja
8
60
B Kumar
15
5
J Bumrah
93
2
EOF'
	# Total = 100+50+30+70+20+10+15+45+60+5+2 = 407. 407/11 = 37.0
	[[ "$output" == *"The average runs is 37.000000"* ]]
}

@test "act 4 test 8" {
	run bash -c './act4.out <<EOF
P1
999
11
P2
888
11
P3
777
11
P4
666
11
P5
555
11
P6
444
11
P7
333
11
P8
222
11
P9
111
11
P10
100
11
P11
123
11
EOF'
	[[ "$output" == *"The average runs is 11.000000"* ]]
}

@test "act 4 test 9" {
	run bash -c './act4.out <<EOF
P1
1
-11
P2
2
0
P3
3
0
P4
4
0
P5
5
0
P6
6
0
P7
7
0
P8
8
0
P9
9
0
P10
10
0
P11
11
0
EOF'
	[[ "$output" == *"The average runs is -1.000000"* ]]
}

@test "act 4 test 10" {
	run bash -c './act4.out <<EOF
A
1
10
B
2
20
C
3
30
D
4
40
E
5
50
F
6
60
G
7
70
H
8
80
I
9
90
J
10
100
K
11
110
EOF'
	[[ "$output" == *"The average runs is 60.000000"* ]]
}
