#include <stdio.h>
#include <string.h>

// Swap two integer arrays

void read_array(int n, int arr[]);
void print_array(int n, int arr[]);
void swap_array(int n, int a[], int b[]);

int main(void) {
    int n;
    printf("Enter number of values: ");
    scanf("%d", &n);

    int a[n], b[n];
    printf("For array a:\n");
    read_array(n, a);
    printf("For array b:\n");
    read_array(n, b);

    swap_array(n, a, b);

    printf("After swapping\n");

    printf("Array a\n");
    print_array(n, a);
    printf("Array b\n");
    print_array(n, b);

    return 0;
}

// Swap contents of the array
void swap_array(int n, int a[], int b[]) {
    // int temp[n];

    // memcpy(temp, a, sizeof(int) * n);
    // memcpy(a, b, sizeof(int) * n);
    // memcpy(b, temp, sizeof(int) * n);

    int temp;

    for (int i = 0; i < n; i++) {
        temp = a[i];
        a[i] = b[i];
        b[i] = temp;
    }
}

// Prints an array with a newline after each entry
void print_array(int n, int arr[]) {
    for (int i = 0; i < n; i++) printf("%d\n", arr[i]);
    printf("\n");
}

// Read elements of an array from the user
void read_array(int n, int arr[]) {
    for (int i = 0; i < n; i++) {
        printf("Enter %d element: ", i + 1);
        scanf("%d", &arr[i]);
    }
}
