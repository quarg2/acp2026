#include <stdio.h>

void inputMarks(int n, float marks[]);
float findHighestMark(int n, float marks[]);
float findLowestMark(int n, float marks[]);
void output(float max, float min);

int main(void) {
    int count;
    float max, min;
    
    printf("Enter number of students: ");
    scanf("%d", &count);

    float marks[count];

    inputMarks(count, marks);

    max = findHighestMark(count, marks);
    min = findLowestMark(count, marks);

    output(max, min);
    
    return 0;
}

void output(float max, float min) {
    printf("The maximum marks is %f\nThe minimum marks is %f\n", max, min);
}

float findLowestMark(int n, float marks[]) {
    float min = marks[0];

    for (int i = 0; i < n; i++) {
        min = (marks[i] < min) ? marks[i] : min;
    }

    return min;
}

float findHighestMark(int n, float marks[]) {
    float max = marks[0];
    for (int i = 0; i < n; i++) {
        max = (marks[i] > max) ? marks[i] : max;
    }
    return max;
}

void inputMarks(int n, float marks[]) {
    for (int i = 0; i < n; i++) {
        printf("Enter marks of student %d: ", i + 1);
        scanf("%f", &marks[i]);
    }
}
