#!/usr/bin/env bats

@test "demo 4 test 1" {
  run ./demo4.out <<EOF
1
101
NewYork
50
NewYork
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Flight number 101 goes to destination NewYork"* ]]
}

@test "demo 4 test 2" {
  run ./demo4.out <<EOF
2
202
London
100
303
Paris
75
Paris
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Flight number 303 goes to destination Paris"* ]]
}

@test "demo 4 test 3" {
  run ./demo4.out <<EOF
1
404
Tokyo
20
Osaka
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"No flight for destination Osaka"* ]]
}

@test "demo 4 test 4" {
  run ./demo4.out <<EOF
2
101
Berlin
100
102
Munich
50
Berlin
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Flight number 101 goes to destination Berlin"* ]]
}

@test "demo 4 test 5" {
  run ./demo4.out <<EOF
2
101
Berlin
100
102
Munich
50
Munich
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Flight number 102 goes to destination Munich"* ]]
}

@test "demo 4 test 6" {
  run ./demo4.out <<EOF
3
100
Dublin
100
200
Madrid
200
300
Rome
300
Rome
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Flight number 300 goes to destination Rome"* ]]
}

@test "demo 4 test 7" {
  run ./demo4.out <<EOF
1
500
San-Francisco
25
San-Francisco
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Flight number 500 goes to destination San-Francisco"* ]]
}

@test "demo 4 test 8" {
  run ./demo4.out <<EOF
2
1
A
10
2
B
20
C
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"No flight for destination C"* ]]
}

@test "demo 4 test 9" {
  run ./demo4.out <<EOF
1
999
Nowhere
0
Nowhere
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Flight number 999 goes to destination Nowhere"* ]]
}

@test "demo 4 test 10" {
  run ./demo4.out <<EOF
4
11
X
1
22
Y
2
33
Z
3
44
W
4
Z
EOF
  [ "$status" -eq 0 ]
  [[ "$output" == *"Flight number 33 goes to destination Z"* ]]
}
