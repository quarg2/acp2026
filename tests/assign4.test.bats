#!/usr/bin/env bats

@test "assign 4 test 1" {
    run bash -c './assign4.out <<EOF
101
Tesla Model 3
2023
45000.0
102
Ford Mustang
2021
35000.0
103
Toyota Camry
2022
28000.0
104
Hyundai Ioniq 5
2024
52000.0
EOF'
    [[ "$output" == *"Tesla Model 3"* ]]
    [[ "$output" == *"Hyundai Ioniq 5"* ]]
    [[ "$output" != *"Ford Mustang"* ]]
    [[ "$output" != *"Toyota Camry"* ]]
}

@test "assign 4 test 2" {
    run bash -c './assign4.out <<EOF
1
Old Car
2000
1000
2
Old Car
2010
2000
3
Old Car
2020
3000
4
Old Car
2022
4000
EOF'
    # None should be displayed as all <= 2022
    [[ "$output" != *"Old Car"* ]]
}

@test "assign 4 test 3" {
    run bash -c './assign4.out <<EOF
1
New Car
2023
10000
2
New Car
2024
20000
3
New Car
2025
30000
4
New Car
2026
40000
EOF'
    # All should be displayed
    [[ "$output" == *"2023"* ]]
    [[ "$output" == *"2024"* ]]
    [[ "$output" == *"2025"* ]]
    [[ "$output" == *"2026"* ]]
}

@test "assign 4 test 4" {
    run bash -c './assign4.out <<EOF
1
Mix
2022
1
2
Mix
2023
2
3
Mix
2022
3
4
Mix
2023
4
EOF'
    # 2 and 4 should be displayed
    [[ $(echo "$output" | grep -c "Car ID: 2") -eq 1 ]]
    [[ $(echo "$output" | grep -c "Car ID: 4") -eq 1 ]]
    [[ $(echo "$output" | grep -c "Car ID: 1") -eq 0 ]]
}

@test "assign 4 test 5" {
    run bash -c './assign4.out <<EOF
100
Edge
2023
1
0
None
0
0
0
None
0
0
0
None
0
0
EOF'
    [[ "$output" == *"Edge"* ]]
}

@test "assign 4 test 6" {
    run bash -c './assign4.out <<EOF
1
C1
2023
100
2
C2
2023
200
3
C3
2023
300
4
C4
2022
400
EOF'
    [[ "$output" == *"C1"* ]]
    [[ "$output" == *"C2"* ]]
    [[ "$output" == *"C3"* ]]
    [[ "$output" != *"C4"* ]]
}

@test "assign 4 test 7" {
    run bash -c './assign4.out <<EOF
1
A
2021
1
2
B
2021
1
3
C
2023
1
4
D
2021
1
EOF'
    [[ "$output" == *"C"* ]]
    [[ "$output" != *"A"* ]]
}

@test "assign 4 test 8" {
    run bash -c './assign4.out <<EOF
1
Z
2023
1
2
Y
2024
1
3
X
2025
1
4
W
2026
1
EOF'
    [[ "$output" == *"Z"* ]]
    [[ "$output" == *"Y"* ]]
    [[ "$output" == *"X"* ]]
    [[ "$output" == *"W"* ]]
}

@test "assign 4 test 9" {
    run bash -c './assign4.out <<EOF
10
X
2022
1
20
Y
2022
2
30
Z
2022
3
40
W
2023
4
EOF'
    [[ "$output" == *"W"* ]]
}

@test "assign 4 test 10" {
    run bash -c './assign4.out <<EOF
11
Future
2030
1
22
Past
2022
2
33
Future
2031
3
44
Past
2020
4
EOF'
    [[ "$output" == *"2030"* ]]
    [[ "$output" == *"2031"* ]]
    [[ "$output" != *"2022"* ]]
}
