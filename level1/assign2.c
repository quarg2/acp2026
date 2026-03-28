#include <stdio.h>
#include <string.h>

typedef struct {
    char name[50];
    float length;
    float width;
    float cost_per_unit;
    float total_cost;
} Floor;

Floor input(void);
float calculate_cost(Floor floor);
void compare_costs(Floor f1, Floor f2, Floor f3);

int main(void) {
    Floor floor1, floor2, floor3;

    floor1 = input();
    floor2 = input();
    floor3 = input();

    floor1.total_cost = calculate_cost(floor1);
    floor2.total_cost = calculate_cost(floor2);
    floor3.total_cost = calculate_cost(floor3);

    compare_costs(floor1, floor2, floor3);

    return 0;
}

void compare_costs(Floor floor1, Floor floor2, Floor floor3) {
    if (floor1.total_cost == floor2.total_cost
        && floor2.total_cost == floor3.total_cost)
        printf("All floors cost the same\n");
    else if (floor1.total_cost == floor2.total_cost
             && floor1.total_cost > floor3.total_cost)
        printf("%s and %s are the most expensive, with a price of %f\n",
               floor1.name, floor2.name, floor1.total_cost);
    else if (floor2.total_cost == floor3.total_cost
             && floor2.total_cost > floor1.total_cost)
        printf("%s and %s are the most expensive, with a price of %f\n",
               floor2.name, floor3.name, floor2.total_cost);
    else if (floor3.total_cost == floor1.total_cost
             && floor1.total_cost > floor2.total_cost)
        printf("%s and %s are the most expensive, with a price of %f\n",
               floor1.name, floor3.name, floor1.total_cost);
    else if (floor1.total_cost > floor2.total_cost
             && floor1.total_cost > floor3.total_cost)
        printf("%s is the most expensive, with a price of %f\n", floor1.name,
               floor1.total_cost);
    else if (floor2.total_cost > floor1.total_cost
             && floor2.total_cost > floor3.total_cost)
        printf("%s is the most expensive, with a price of %f\n", floor2.name,
               floor2.total_cost);
    else if (floor3.total_cost > floor1.total_cost
             && floor3.total_cost > floor2.total_cost)
        printf("%s is the most expensive, with a price of %f\n", floor3.name,
               floor3.total_cost);
}

float calculate_cost(Floor floor) {
    return floor.length * floor.width * floor.cost_per_unit;
}

Floor input(void) {
    Floor floor;
    char buffer[50];

    printf("Enter name of floor: ");
    fgets(floor.name, 50, stdin);
    // Remove newline from floor.name
    floor.name[strcspn(floor.name, "\n")] = '\0';
    printf("Enter length of floor: ");
    fgets(buffer, 50, stdin);
    sscanf(buffer, "%f", &floor.length);
    printf("Enter width of floor: ");
    fgets(buffer, 50, stdin);
    sscanf(buffer, "%f", &floor.width);
    printf("Enter cost per unit of tiling: ");
    fgets(buffer, 50, stdin);
    sscanf(buffer, "%f", &floor.cost_per_unit);

    return floor;
}
