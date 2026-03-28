#include <stdio.h>
#include <string.h>

typedef struct {
    float length;
    float width;
    float area;
    float costPerUnit;
    float totalCost;
} Floor;

void inputDetails(int n, Floor floors[]);
void calculateCosts(int n, Floor floors[]);
int highestCostFloor(int n, Floor floors[]);
void displayHighestCost(int index, Floor floors[]);

int main(void) {
    int n, max;
    char buffer[10];
    
    printf("Enter number of floors: ");
    fgets(buffer, 10, stdin);
    sscanf(buffer, "%d", &n);

    Floor floors[n];

    inputDetails(n, floors);
    calculateCosts(n, floors);
    max = highestCostFloor(n, floors);
    displayHighestCost(max, floors);
    
    return 0;
}

void displayHighestCost(int index, Floor floors[]) {
    printf("Floor %d with the highest cost has cost %f\n",
           index + 1, floors[index].totalCost);
}

int highestCostFloor(int n, Floor floors[]) {
    int highest = 0;

    for (int i = 0; i < n; i++)
        highest = (floors[i].totalCost > floors[highest].totalCost) ? i : highest;

    return highest;
}

void calculateCosts(int n, Floor floors[]) {
    for (int i = 0; i < n; i++) {
        floors[i].totalCost = floors[i].length * floors[i].width
            * floors[i].costPerUnit;
    }
}

void inputDetails(int n, Floor floors[]) {
    char buffer[50];
    
    for (int i = 0; i < n; i++) {
        printf("Floor %d\n", i + 1);
        printf("\tEnter length of floor: ");
        fgets(buffer, 50, stdin);
        sscanf(buffer, "%f", &floors[i].length);

        printf("\tEnter width of floor: ");
        fgets(buffer, 50, stdin);
        sscanf(buffer, "%f", &floors[i].width);

        printf("\tEnter cost per unit of tiling: ");
        fgets(buffer, 50, stdin);
        sscanf(buffer, "%f", &floors[i].costPerUnit);
    }
}
