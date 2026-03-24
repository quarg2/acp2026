#include <stdio.h>

void inputTemperatures(int n, float temps[]);
float findHighest(int n, float temps[]);
float findLowest(int n, float temps[]);
void output(float max, float min);

// Read temperatures for each day of the week, store them in an array
// Find the maximum and minimum

int main(void) {
    int n;
    float max, min;
    
    printf("Enter number of temperature readings: ");
    scanf("%d", &n);

    float temps[n];

    inputTemperatures(n, temps);
    max = findHighest(n, temps);
    min = findLowest(n, temps);
    output(max, min);
    
    return 0;
}

void output(float max, float min) {
    printf("The lowest temperature is %f and the highest is %f\n",
           min, max);
}

float findLowest(int n, float temps[]) {
    int min = 0;
    for (int i = 0; i < n; i++) {
        min = (temps[i] < temps[min]) ? i : min;
    }

    return temps[min];
}

float findHighest(int n, float temps[]) {
    int max = 0;
    for (int i = 0; i < n; i++) {
        max = (temps[i] > temps[max]) ? i : max;
    }

    return temps[max];
}



void inputTemperatures(int n, float temps[]) {
    for (int i = 0; i < n; i++) {
        printf("Enter temperature %d: ", i + 1);
        scanf("%f", &temps[i]);
    }
}
