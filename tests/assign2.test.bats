#!/usr/bin/env bats

@test "assign 2 test 1" {
    run bash -c './assign2.out <<EOF
Living Room
4.0
5.0
150.0
Kitchen
3.0
3.0
200.0
Bedroom
3.0
4.0
100.0
EOF'
    # 3000, 1800, 1200
    [[ "$output" == *"Living Room is the most expensive, with a price of 3000.000000"* ]]
}

@test "assign 2 test 2" {
    run bash -c './assign2.out <<EOF
Floor A
10.0
10.0
1.0
Floor B
10.0
10.0
2.0
Floor C
10.0
10.0
1.0
EOF'
    # 100, 200, 100
    [[ "$output" == *"Floor B is the most expensive, with a price of 200.000000"* ]]
}

@test "assign 2 test 3" {
    run bash -c './assign2.out <<EOF
Small
1.0
1.0
10.0
Medium
5.0
5.0
10.0
Large
10.0
10.0
10.0
EOF'
    # 10, 250, 1000
    [[ "$output" == *"Large is the most expensive, with a price of 1000.000000"* ]]
}

@test "assign 2 test 4" {
    run bash -c './assign2.out <<EOF
Standard1
5.0
4.0
50.0
Standard2
10.0
2.0
50.0
Standard3
4.0
5.0
50.0
EOF'
    # 1000, 1000, 1000
    [[ "$output" == *"All floors cost the same"* ]]
}

@test "assign 2 test 5" {
    run bash -c './assign2.out <<EOF
Office
10.0
10.0
50.0
Hall
50.0
1.0
100.0
Patio
20.0
5.0
40.0
EOF'
    # 5000, 5000, 4000
    [[ "$output" == *"Office and Hall are the most expensive, with a price of 5000.000000"* ]]
}

@test "assign 2 test 6" {
    run bash -c './assign2.out <<EOF
Entrance
10.0
2.0
10.0
SuiteB
20.0
20.0
2.0
SuiteC
40.0
10.0
2.0
EOF'
    # 200, 800, 800
    [[ "$output" == *"SuiteB and SuiteC are the most expensive, with a price of 800.000000"* ]]
}

@test "assign 2 test 7" {
    run bash -c './assign2.out <<EOF
Penthouse
10.0
10.0
100.0
Basement
10.0
10.0
1.0
Attic
100.0
10.0
10.0
EOF'
    # 10000, 100, 10000
    [[ "$output" == *"Penthouse and Attic are the most expensive, with a price of 10000.000000"* ]]
}

@test "assign 2 test 8" {
    run bash -c './assign2.out <<EOF
Alpha
0.0
10.0
100.0
Beta
10.0
0.0
10.0
Gamma
5.0
5.0
0.0
EOF'
    # 0, 0, 0
    [[ "$output" == *"All floors cost the same"* ]]
}

@test "assign 2 test 9" {
    run bash -c './assign2.out <<EOF
P1
1.1
1.1
1.0
P2
1.1
1.2
1.0
P3
1.0
1.0
1.0
EOF'
    # 1.21, 1.32, 1.00
    [[ "$output" == *"P2 is the most expensive, with a price of 1.320000"* ]]
}

@test "assign 2 test 10" {
    run bash -c './assign2.out <<EOF
Gold
10.0
10.0
10.0
Silver
10.0
10.0
10.0
Bronze
10.0
10.0
0.0
EOF'
    # 1000, 1000, 0
    [[ "$output" == *"Gold and Silver are the most expensive, with a price of 1000.000000"* ]]
}
