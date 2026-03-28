#!/usr/bin/env bats

@test "assign 5 test 1" {
    run bash -c './assign5.out <<EOF
Alice
25
Bob
30
EOF'
    # Before
    [[ "$output" == *"Before swapping"* ]]
    # After
    [[ "$output" == *"After swapping"* ]]
    # Verify order in After
    # The last "Age: 25" should be associated with Alice, but she is now p2.
    # Wait, the code prints p1 then p2.
    # p1=Alice, p2=Bob. After swap p1=Bob, p2=Alice.
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | grep -c "Name: Bob	Age: 30") -eq 1 ]]
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | grep -c "Name: Alice	Age: 25") -eq 1 ]]
}

@test "assign 5 test 2" {
    run bash -c './assign5.out <<EOF
User1
10
User2
20
EOF'
    # p1=User1, p2=User2 -> After swap p1=User2, p2=User1
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | head -n 2 | grep "Name: User2") ]]
}

@test "assign 5 test 3" {
    run bash -c './assign5.out <<EOF
SameName
10
SameName
20
EOF'
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | head -n 2 | grep "Age: 20") ]]
}

@test "assign 5 test 4" {
    run bash -c './assign5.out <<EOF
A
50
B
50
EOF'
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | grep -c "Age: 50") -eq 2 ]]
}

@test "assign 5 test 5" {
    run bash -c './assign5.out <<EOF
First
1
Second
2
EOF'
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | head -n 2 | grep "Name: Second") ]]
}

@test "assign 5 test 6" {
    run bash -c './assign5.out <<EOF
Longer Name Support
100
Short
1
EOF'
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | head -n 2 | grep "Name: Short") ]]
}

@test "assign 5 test 7" {
    run bash -c './assign5.out <<EOF
X
0
Y
99
EOF'
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | head -n 2 | grep "Age: 99") ]]
}

@test "assign 5 test 8" {
    run bash -c './assign5.out <<EOF
John Doe
45
Jane Doe
42
EOF'
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | head -n 2 | grep "Name: Jane Doe") ]]
}

@test "assign 5 test 9" {
    run bash -c './assign5.out <<EOF
Left
11
Right
22
EOF'
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | head -n 2 | grep "Name: Right") ]]
}

@test "assign 5 test 10" {
    run bash -c './assign5.out <<EOF
Alpha
1000
Beta
2000
EOF'
    [[ $(echo "$output" | sed -n '/After swapping/, $p' | head -n 2 | grep "Age: 2000") ]]
}
