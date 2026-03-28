#!/usr/bin/env bats

@test "assign 3 test 1" {
    run bash -c './assign3.out <<EOF
2
4.0
5.0
150.0
3.0
3.0
200.0
EOF'
    # Floor 1: 3000
    # Floor 2: 1800
    [[ "$output" == *"Floor 1 with the highest cost has cost 3000.000000"* ]]
}

@test "assign 3 test 2" {
    run bash -c './assign3.out <<EOF
1
10
10
10
EOF'
    [[ "$output" == *"Floor 1 with the highest cost has cost 1000.000000"* ]]
}

@test "assign 3 test 3" {
    run bash -c './assign3.out <<EOF
3
10
10
10
10
10
10
10
10
10
EOF'
    [[ "$output" == *"Floor 1 with the highest cost has cost 1000.000000"* ]]
}

@test "assign 3 test 4" {
    run bash -c './assign3.out <<EOF
4
1
1
1
2
2
2
3
3
3
4
4
4
EOF'
    # 1, 8, 27, 64
    [[ "$output" == *"Floor 4 with the highest cost has cost 64.000000"* ]]
}

@test "assign 3 test 5" {
    run bash -c './assign3.out <<EOF
2
10
10
200
10
10
100
EOF'
    [[ "$output" == *"Floor 1 with the highest cost has cost 20000.000000"* ]]
}

@test "assign 3 test 6" {
    run bash -c './assign3.out <<EOF
3
10
10
10
20
20
20
15
15
15
EOF'
    # 1000, 8000, 3375
    [[ "$output" == *"Floor 2 with the highest cost has cost 8000.000000"* ]]
}

@test "assign 3 test 7" {
    run bash -c './assign3.out <<EOF
5
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
1
1
1
1
1
EOF'
    [[ "$output" == *"Floor 1 with the highest cost has cost 1.000000"* ]]
}

@test "assign 3 test 8" {
    run bash -c './assign3.out <<EOF
2
0.5
2.0
100.0
1.0
1.0
100.0
EOF'
    # 100, 100
    [[ "$output" == *"Floor 1 with the highest cost has cost 100.000000"* ]]
}

@test "assign 3 test 9" {
    run bash -c './assign3.out <<EOF
3
1
1
10
1
1
100
1
1
10
EOF'
    [[ "$output" == *"Floor 2 with the highest cost has cost 100.000000"* ]]
}

@test "assign 3 test 10" {
    run bash -c './assign3.out <<EOF
3
100
100
1
10
10
10
1
1
100
EOF'
    # 10000, 1000, 100
    [[ "$output" == *"Floor 1 with the highest cost has cost 10000.000000"* ]]
}
