#include <stdio.h>

void input(int n, float arr[]);
int find_max_index(int n, float arr[]);
void output(float arr[], int max_index);

// Read n float values from the user, store them in an array
// and find the largest.

int main(void) {
    int n, max;
    printf("Enter number of values: ");
    scanf("%d", &n);

    float arr[n];

    input(n, arr);
    max = find_max_index(n, arr);
    output(arr, max);

    return 0;
}

// Gets the index of the largest value
int find_max_index(int n, float arr[]) {
    int max = 0;

    for (int i = 0; i < n; i++)
        max = (arr[i] > arr[max]) ? i : max;
    return max;
}

// Print
void output(float arr[], int max_index) {
    printf("The maximum value is %f at index %d\n", arr[max_index], max_index);
}

// Get n floats into arr
void input(int n, float arr[]) {
    for (int i = 0; i < n; i++) {
        printf("Enter %d value: ", i + 1);
        scanf("%f", &arr[i]);
    }
}
