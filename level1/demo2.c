#include <stdio.h>

// Compare areas of three rectangles and find the largest

typedef struct {
    float length;
    float width;
    float area;
} Rectangle;

Rectangle input(void);
float calculate_area(Rectangle rect);
void compare_areas(Rectangle r1, Rectangle r2, Rectangle r3);

int main(void) {
    Rectangle r1 = input();
    Rectangle r2 = input();
    Rectangle r3 = input();

    r1.area = calculate_area(r1);
    r2.area = calculate_area(r2);
    r3.area = calculate_area(r3);

    compare_areas(r1, r2, r3);

    return 0;
}

// Compare area of rectangles
void compare_areas(Rectangle r1, Rectangle r2, Rectangle r3) {
    if (r1.area > r2.area && r1.area > r3.area)
        printf("Rectangle 1 has the largest area\n");
    else if (r2.area > r1.area && r2.area > r3.area)
        printf("Rectangle 2 has the largest area\n");
    else if (r3.area > r1.area && r3.area > r2.area)
        printf("Rectangle 3 has the largest area\n");
    else
        printf("The rectangles have equal areas\n");
}


float calculate_area(Rectangle rect) {
    return rect.area;
}

Rectangle input(void) {
    float length, width;
    Rectangle r = {.length = 0, .width = 0, .area = 0};
    printf("Enter length and width of rectangle: ");
    scanf("%f %f", &length, &width);

    r.length = length;
    r.width = width;

    return r;
}
