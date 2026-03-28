#include <float.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FLIGHT_FILE "flights.bin"

// Airline reservation system
// Manage flight records and save it to flights.bin
// Show most expensive flight

typedef struct {
    int flightNumber;
    char destination[100];
    float price;
} Flight;

void inputFlights(Flight f[], int n);
void saveToBinary(Flight f[], int n, const char *file);
Flight findMostExpensive(const char *file);
void displayTopFlight(Flight f);

int main(void) {
    char buf[100];
    int count;

    printf("Enter number of flights: ");
    fgets(buf, 100, stdin);
    sscanf(buf, "%d", &count);

    Flight flights[count], expensive;

    inputFlights(flights, count);
    saveToBinary(flights, count, FLIGHT_FILE);
    expensive = findMostExpensive(FLIGHT_FILE);
    displayTopFlight(expensive);
    
    return 0;
}

void displayTopFlight(Flight f) {
    printf("The most expensive flight is %d to %s at price %f\n",
           f.flightNumber, f.destination, f.price);
}

Flight findMostExpensive(const char *file) {
    FILE *f = fopen(file, "rb");

    Flight flight, expensive;
    float maxPrice = FLT_MIN;

    while (fread(&flight, sizeof(Flight), 1, f) != 0) {
        if (flight.price > maxPrice) {
            maxPrice  = flight.price;
            expensive = flight;
        }
    }

    fclose(f);
    return expensive;
}

void saveToBinary(Flight flight[], int n, const char *file) {
    FILE *f = fopen(file, "wb");

    if (f == NULL) {
        printf("File error!\n");
        exit(74);
    }

    fwrite(flight, sizeof(Flight), (unsigned long)n, f);
    fclose(f);
}

void inputFlights(Flight f[], int n) {
    char buf[100];

    for (int i = 0; i < n; i++) {
        printf("Flight %d\n", i + 1);

        printf("\tEnter flight number: ");
        fgets(buf, 100, stdin);
        sscanf(buf, "%d", &f[i].flightNumber);

        printf("\tEnter destination: ");
        fgets(f[i].destination, 100, stdin);
        f[i].destination[strcspn(f[i].destination, "\n")] = '\0';

        printf("\tEnter ticket price: ");
        fgets(buf, 100, stdin);
        sscanf(buf, "%f", &f[i].price);
    }
}
