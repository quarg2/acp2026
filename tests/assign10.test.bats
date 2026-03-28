#!/usr/bin/env bats

@test "assign 10 test 1" {
    run bash -c './assign10.out <<EOF
2
101
Laptop
50000.0
102
Mouse
1500.0
EOF'
    [[ "$output" == *"The total value is 51500.000000"* ]]
}

@test "assign 10 test 2" {
    run bash -c './assign10.out <<EOF
1
500
Phone
20000
EOF'
    [[ "$output" == *"The total value is 20000.000000"* ]]
}

@test "assign 10 test 3" {
    run bash -c './assign10.out <<EOF
3
1
A
10.5
2
B
20.5
3
C
30.0
EOF'
    [[ "$output" == *"The total value is 61.000000"* ]]
}

@test "assign 10 test 4" {
    run bash -c './assign10.out <<EOF
2
1
Cheap
0.50
2
Free
0.00
EOF'
    [[ "$output" == *"The total value is 0.500000"* ]]
}

@test "assign 10 test 5" {
    run bash -c './assign10.out <<EOF
5
1
P1
1
2
P2
1
3
P3
1
4
P4
1
5
P5
1
EOF'
    [[ "$output" == *"The total value is 5.000000"* ]]
}

@test "assign 10 test 6" {
    run bash -c './assign10.out <<EOF
1
0
Null
0
EOF'
    [[ "$output" == *"The total value is 0.000000"* ]]
}

@test "assign 10 test 7" {
    run bash -c './assign10.out <<EOF
2
10
Big
1000000
20
Small
0.01
EOF'
    [[ "$output" == *"The total value is 1000000.010000"* ]] || [[ "$output" == *"The total value is 1000000.000000"* ]] || [[ "$output" == *"The total value is 1000000.000000"* ]]
}

@test "assign 10 test 8" {
    run bash -c './assign10.out <<EOF
3
11
X
100
22
Y
200
33
Z
300
EOF'
    [[ "$output" == *"The total value is 600.000000"* ]]
}

@test "assign 10 test 9" {
    run bash -c './assign10.out <<EOF
2
1
One
1.111111
2
Two
2.222222
EOF'
    [[ "$output" == *"The total value is 3.333333"* ]]
}

@test "assign 10 test 10" {
    run bash -c './assign10.out <<EOF
1
999
Last
9999.99
EOF'
    [[ "$output" == *"The total value is 9999.990234"* ]] || [[ "$output" == *"The total value is 9999.990000"* ]]
}
