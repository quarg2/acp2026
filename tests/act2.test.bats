#!/usr/bin/env bats

@test "act 2 test 1" {
    run bash -c './act2.out <<EOF
40
5.0
EOF'
    [[ "$output" == *"The total bill amount is 0.000000"* ]]
}

@test "act 2 test 2" {
    run bash -c './act2.out <<EOF
50
10.0
EOF'
    [[ "$output" == *"The total bill amount is 500.000000"* ]]
}

@test "act 2 test 3" {
    run bash -c './act2.out <<EOF
100
10.0
EOF'
    [[ "$output" == *"The total bill amount is 1000.000000"* ]]
}

@test "act 2 test 4" {
    run bash -c './act2.out <<EOF
110
10.0
EOF'
    # 100 * 10 + 10 * 15 = 1150
    [[ "$output" == *"The total bill amount is 1150.000000"* ]]
    [[ "$output" == *"High consumption alert! Extra charge applied."* ]]
}

@test "act 2 test 5" {
    run bash -c './act2.out <<EOF
200
5.0
EOF'
    # 100 * 5 + 100 * 10 = 1500
    [[ "$output" == *"The total bill amount is 1500.000000"* ]]
    [[ "$output" == *"High consumption alert! Extra charge applied."* ]]
}

@test "act 2 test 6" {
    run bash -c './act2.out <<EOF
0
20.0
EOF'
    [[ "$output" == *"The total bill amount is 0.000000"* ]]
}

@test "act 2 test 7" {
    run bash -c './act2.out <<EOF
49
1.0
EOF'
    [[ "$output" == *"The total bill amount is 0.000000"* ]]
}

@test "act 2 test 8" {
    run bash -c './act2.out <<EOF
101
10.0
EOF'
    # 100*10 + 1*15 = 1015
    [[ "$output" == *"The total bill amount is 1015.000000"* ]]
}

@test "act 2 test 9" {
    run bash -c './act2.out <<EOF
150
0.0
EOF'
    # 100*0 + 50*5 = 250
    [[ "$output" == *"The total bill amount is 250.000000"* ]]
}

@test "act 2 test 10" {
    run bash -c './act2.out <<EOF
75
2.5
EOF'
    # 75 * 2.5 = 187.5
    [[ "$output" == *"The total bill amount is 187.500000"* ]]
}
