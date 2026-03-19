#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

// Using dynamic memory allocation
// create an array, populate it with values, print it, then free it.

int* create_array(int n);
void initialize_array(int* arr, int n);
void print_array(int* arr, int n);
void delete_array(int** arr);

int main(void) {
    int n;
    printf("Enter number of elements: ");
    scanf("%d", &n);

    int* a = create_array(n);
    initialize_array(a, n);
    print_array(a, n);
    delete_array(&a);

    return 0;
}

// Allocate memory for an array
// Exits if malloc returns NULL (malloc fails)
int* create_array(int n) {
    int* arr = malloc(sizeof(int) * n);
    assert(arr != NULL);  // Exit if malloc returns a nullptr
    return arr;
}

// Get elements of the array from the user
void initialize_array(int* arr, int n) {
    for (int i = 0; i < n; i++) {
        printf("Enter %d element of array: ", i + 1);
        scanf("%d", &arr[i]);
    }
}

// Print contents of the array
void print_array(int* arr, int n) {
    for (int i = 0; i < n; i++) printf("%d\n", arr[i]);
}

// Free memory used by pointer and set the pointer to NULL
void delete_array(int** arr) {
    free(*arr);
    *arr = NULL;
}
