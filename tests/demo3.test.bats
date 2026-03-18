#!/usr/bin/env bats

@test "demo 3 test 1" {
  run ./demo3.out <<< "1
5 4"
  [[ "$output" == *"Rectangle 1 has area 20.000000"* ]]
  [[ "$output" == *"largest area has area 20.000000"* ]]
}

@test "demo 3 test 2" {
  run ./demo3.out <<< "2
2 3
5 5"
  [[ "$output" == *"Rectangle 1 has area 6.000000"* ]]
  [[ "$output" == *"Rectangle 2 has area 25.000000"* ]]
  [[ "$output" == *"largest area has area 25.000000"* ]]
}

@test "demo 3 test 3" {
  run ./demo3.out <<< "2
10 2
3 3"
  [[ "$output" == *"Rectangle 1 has area 20.000000"* ]]
  [[ "$output" == *"largest area has area 20.000000"* ]]
}

@test "demo 3 test 4" {
  run ./demo3.out <<< "3
2 5
5 2
1 10"
  [[ "$output" == *"Rectangle 1 has area 10.000000"* ]]
  [[ "$output" == *"Rectangle 2 has area 10.000000"* ]]
  [[ "$output" == *"Rectangle 3 has area 10.000000"* ]]
  [[ "$output" == *"largest area has area 10.000000"* ]]
}

@test "demo 3 test 5" {
  run ./demo3.out <<< "2
0 5
3 0"
  [[ "$output" == *"Rectangle 1 has area 0.000000"* ]]
  [[ "$output" == *"Rectangle 2 has area 0.000000"* ]]
  [[ "$output" == *"largest area has area 0.000000"* ]]
}

@test "demo 3 test 6" {
  run ./demo3.out <<< "2
2.5 4
3.1 2"
  [[ "$output" == *"Rectangle 1 has area 10.000000"* ]]
  [[ "$output" == *"Rectangle 2 has area 6.200000"* ]]
  [[ "$output" == *"largest area has area 10.000000"* ]]
}

@test "demo 3 test 7" {
  run ./demo3.out <<< "2
-2 3
4 5"
  [[ "$output" == *"Rectangle 1 has area -6.000000"* ]]
  [[ "$output" == *"Rectangle 2 has area 20.000000"* ]]
  [[ "$output" == *"largest area has area 20.000000"* ]]
}

@test "demo 3 test 8" {
  run ./demo3.out <<< "1
10000 20000"
  [[ "$output" == *"Rectangle 1 has area 200000000.000000"* ]]
  [[ "$output" == *"largest area has area 200000000.000000"* ]]
}

@test "demo 3 test 9" {
  run ./demo3.out <<< "3
2 2
10 10
3 3"
  [[ "$output" == *"Rectangle 2 has area 100.000000"* ]]
  [[ "$output" == *"largest area has area 100.000000"* ]]
}

@test "demo 3 test 10" {
  run ./demo3.out <<< "4
0 0
0 0
5 5
0 0"
  [[ "$output" == *"Rectangle 3 has area 25.000000"* ]]
  [[ "$output" == *"largest area has area 25.000000"* ]]
}
