#!/usr/bin/env bats

@test "assign 1 test 1" {
    run bash -c './assign1.out <<EOF
2
85.5
92.0
EOF'
    [[ "$output" == *"The maximum marks is 92.000000"* ]]
    [[ "$output" == *"The minimum marks is 85.500000"* ]]
}

@test "assign 1 test 2" {
    run bash -c './assign1.out <<EOF
1
50.0
EOF'
    [[ "$output" == *"The maximum marks is 50.000000"* ]]
    [[ "$output" == *"The minimum marks is 50.000000"* ]]
}

@test "assign 1 test 3" {
    run bash -c './assign1.out <<EOF
3
75.0
75.0
75.0
EOF'
    [[ "$output" == *"The maximum marks is 75.000000"* ]]
    [[ "$output" == *"The minimum marks is 75.000000"* ]]
}

@test "assign 1 test 4" {
    run bash -c './assign1.out <<EOF
3
100.0
90.0
80.0
EOF'
    [[ "$output" == *"The maximum marks is 100.000000"* ]]
    [[ "$output" == *"The minimum marks is 80.000000"* ]]
}

@test "assign 1 test 5" {
    run bash -c './assign1.out <<EOF
3
10.0
20.0
30.0
EOF'
    [[ "$output" == *"The maximum marks is 30.000000"* ]]
    [[ "$output" == *"The minimum marks is 10.000000"* ]]
}

@test "assign 1 test 6" {
    run bash -c './assign1.out <<EOF
2
0.0
0.0
EOF'
    [[ "$output" == *"The maximum marks is 0.000000"* ]]
    [[ "$output" == *"The minimum marks is 0.000000"* ]]
}

@test "assign 1 test 7" {
    run bash -c './assign1.out <<EOF
2
0.0
50.0
EOF'
    [[ "$output" == *"The maximum marks is 50.000000"* ]]
    [[ "$output" == *"The minimum marks is 0.000000"* ]]
}

@test "assign 1 test 8" {
    run bash -c './assign1.out <<EOF
10
1
2
3
4
5
6
7
8
9
10
EOF'
    [[ "$output" == *"The maximum marks is 10.000000"* ]]
    [[ "$output" == *"The minimum marks is 1.000000"* ]]
}

@test "assign 1 test 9" {
    run bash -c './assign1.out <<EOF
2
85.500001
85.500002
EOF'
    [[ "$output" == *"The maximum marks is 85.500002"* ]] || [[ "$output" == *"The maximum marks is 85.50000"* ]]
    [[ "$output" == *"The minimum marks is 85.50000"* ]]
}

@test "assign 1 test 10" {
    run bash -c './assign1.out <<EOF
3
9999.99
9999.98
10000.0
EOF'
    [[ "$output" == *"The maximum marks is 10000.000000"* ]]
    [[ "$output" == *"The minimum marks is 9999.980"* ]]
}
