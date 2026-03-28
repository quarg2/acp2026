#include <stdio.h>
#include <string.h>

typedef struct {
    int carID;
    char modelName[50];
    int manufactureYear;
    float price;
} Car;

void readCars(int n, Car c[]);
void displayModernCars(int n, Car c[]);

int main(void) {
    int n;
    // char buffer[50];
    
    // printf("Enter number of cars: ");
    // fgets(buffer, 50, stdin);
    // sscanf(buffer, "%d", &n);

    n = 4;
    
    Car cars[n];
    
    readCars(n, cars);
    displayModernCars(n, cars);
    
    return 0;
}

void displayModernCars(int n, Car cars[]) {
    for (int i = 0; i < n; i++) {
        if (cars[i].manufactureYear > 2022) 
            printf("Car ID: %d\n\tModel name: %s\n\tYear of manufacture: %d\n\tPrice: %f\n\n",
                   cars[i].carID, cars[i].modelName, cars[i].manufactureYear, cars[i].price);
    }
}

void readCars(int n, Car cars[]) {
    char buffer[50];
    for (int i = 0; i < n; i++) {
        printf("Enter details of car %d\n", i + 1);

        printf("\tCar ID: ");
        fgets(buffer, 50, stdin);
        sscanf(buffer, "%d", &cars[i].carID);
        
        printf("\tModel name: ");
        fgets(cars[i].modelName, 50, stdin);
        cars[i].modelName[strcspn(cars[i].modelName, "\n")] = '\0';

        printf("\tYear of manufacture: ");
        fgets(buffer, 50, stdin);
        sscanf(buffer, "%d", &cars[i].manufactureYear);

        printf("\tPrice: ");
        fgets(buffer, 50, stdin);
        sscanf(buffer, "%f", &cars[i].price);
    }
}
