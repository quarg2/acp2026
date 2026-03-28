#!/usr/bin/env bats

@test "assign 6 test 1" {
    run bash -c './assign6.out <<EOF
2
1001
Paracetamol
2025
1002
Ibuprofen
2026
EOF'
    [[ "$output" == *"Medicine ID: 1001"* ]]
    [[ "$output" == *"Name: Paracetamol"* ]]
    [[ "$output" == *"Expiration date: 2025"* ]]
    [[ "$output" == *"Medicine ID: 1002"* ]]
    [[ "$output" == *"Name: Ibuprofen"* ]]
    [[ "$output" == *"Expiration date: 2026"* ]]
}

@test "assign 6 test 2" {
    run bash -c './assign6.out <<EOF
1
500
Amoxicillin
2024
EOF'
    [[ "$output" == *"Medicine ID: 500"* ]]
    [[ "$output" == *"Expiration date: 2024"* ]]
}

@test "assign 6 test 3" {
    run bash -c './assign6.out <<EOF
3
1
A
2022
2
B
2023
3
C
2024
EOF'
    [[ "$output" == *"Medicine ID: 1"* ]]
    [[ "$output" == *"Medicine ID: 2"* ]]
    [[ "$output" == *"Medicine ID: 3"* ]]
}

@test "assign 6 test 4" {
    run bash -c './assign6.out <<EOF
2
999
Cough Syrup
2023
888
Vitamin C
2027
EOF'
    [[ "$output" == *"Cough Syrup"* ]]
    [[ "$output" == *"Vitamin C"* ]]
}

@test "assign 6 test 5" {
    run bash -c './assign6.out <<EOF
1
12345
Insulin
2028
EOF'
    [[ "$output" == *"Medicine ID: 12345"* ]]
}

@test "assign 6 test 6" {
    run bash -c './assign6.out <<EOF
2
10
M1
2020
20
M2
2021
EOF'
    [[ "$output" == *"Expiration date: 2020"* ]]
    [[ "$output" == *"Expiration date: 2021"* ]]
}

@test "assign 6 test 7" {
    run bash -c './assign6.out <<EOF
4
1
P1
2025
2
P2
2025
3
P3
2025
4
P4
2025
EOF'
    [[ "$output" == *"P1"* ]]
    [[ "$output" == *"P4"* ]]
}

@test "assign 6 test 8" {
    run bash -c './assign6.out <<EOF
1
0
Nothing
0
EOF'
    [[ "$output" == *"Medicine ID: 0"* ]]
}

@test "assign 6 test 9" {
    run bash -c './assign6.out <<EOF
2
777
Aspirin
3000
666
Metformin
2022
EOF'
    [[ "$output" == *"Expiration date: 3000"* ]]
}

@test "assign 6 test 10" {
    run bash -c './assign6.out <<EOF
3
111
D1
2022
222
D2
2023
333
D3
2024
EOF'
    [[ $(echo "$output" | grep -c "Medicine ID:") -eq 3 ]]
}
