#!/usr/bin/env bats

@test "assign 7 test 1" {
    run bash -c './assign7.out <<EOF
Hello World
EOF'
    [[ "$output" == *"contains 2 words"* ]]
}

@test "assign 7 test 2" {
    run bash -c './assign7.out <<EOF
This is a test case
EOF'
    [[ "$output" == *"contains 5 words"* ]]
}

@test "assign 7 test 3" {
    run bash -c './assign7.out <<EOF
   Multiple   spaces   between   words   
EOF'
    [[ "$output" == *"contains 4 words"* ]]
}

@test "assign 7 test 4" {
    run bash -c './assign7.out <<EOF

EOF'
    # Empty input (just newline from EOF)
    [[ "$output" == *"contains 0 words"* ]]
}

@test "assign 7 test 5" {
    run bash -c './assign7.out <<EOF
One
EOF'
    [[ "$output" == *"contains 1 words"* ]]
}

@test "assign 7 test 6" {
    run bash -c './assign7.out <<EOF
Trailing spaces    
EOF'
    [[ "$output" == *"contains 2 words"* ]]
}

@test "assign 7 test 7" {
    run bash -c './assign7.out <<EOF
    Leading spaces
EOF'
    [[ "$output" == *"contains 2 words"* ]]
}

@test "assign 7 test 8" {
    run bash -c './assign7.out <<EOF
Words	with	tabs
EOF'
    [[ "$output" == *"contains 3 words"* ]]
}

@test "assign 7 test 9" {
    run bash -c './assign7.out <<EOF
        
EOF'
    # Only spaces
    [[ "$output" == *"contains 0 words"* ]]
}

@test "assign 7 test 10" {
    run bash -c './assign7.out <<EOF
123 456 789!
EOF'
    [[ "$output" == *"contains 3 words"* ]]
}
