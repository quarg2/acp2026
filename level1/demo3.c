#include <stdio.h>

// Using an array of structures `Rectangle`
// calculate and display the area of each rectangle and the largest rectangle

typedef struct {
    float length;
    float width;
    float area;
} Rectangle;

void input(int n, Rectangle rects[]);
void calculate_area(int n, Rectangle rects[]);
int findLargestArea(int n, Rectangle rects[]);
void output(int largestIndex, Rectangle rects[]);

int main(void) {
    int n, max;
    printf("Enter number of rectangles: ");
    scanf("%d", &n);

    Rectangle rects[n];

    input(n, rects);
    printf("\n");
    calculate_area(n, rects);
    printf("\n");
    max = findLargestArea(n, rects);
    output(max, rects);
}

// Find the index of the rectangle with the largest area
int findLargestArea(int n, Rectangle rects[]) {
    int max = 0;
    for (int i = 0; i < n; i++) {
        max = (rects[i].area > rects[max].area) ? i : max;
    }
    return max;
}

// Print the rectangle with the largest area
void output(int largestIndex, Rectangle rects[]) {
    printf("The rectangle with the largest area has area %f\n",
           rects[largestIndex].area);
}

// Calculate the area of the rectangles in the array
void calculate_area(int n, Rectangle rects[]) {
    for (int i = 0; i < n; i++) {
        rects[i].area = rects[i].length * rects[i].width;
        printf("Rectangle %d has area %f\n", i + 1, rects[i].area);
    }
}

// Get length and width of rectangles from the user
void input(int n, Rectangle rects[]) {
    for (int i = 0; i < n; i++) {
        printf("Enter length and breadth of %d rectangle: ", i + 1);
        scanf("%f %f", &rects[i].length, &rects[i].width);
    }
}
