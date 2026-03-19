#include <stdio.h>
#include <string.h>

// Create an array of structure of flights.
// Read user input to flight data
// Then check if a flight is available to a given destination

typedef struct {
    int flight_number;
    char destination[100];
    int available_seats;
} Flight_t;

void readFlights(int n, Flight_t f[]);
void searchByDestination(int n, Flight_t f[], char searchDest[]);

int main(void) {
    char dest[100];
    int n;
    printf("Enter number of flights: ");
    scanf("%d", &n);

    Flight_t flights[n];

    readFlights(n, flights);

    printf("Enter destination: ");
    scanf("%s", dest);

    searchByDestination(n, flights, dest);

    return 0;
}

// Read flight data from the user
void readFlights(int n, Flight_t f[]) {
    for (int i = 0; i < n; i++) {
        printf("Enter flight number: ");
        scanf("%d", &f[i].flight_number);

        printf("\tEnter destination: ");
        scanf("%s", f[i].destination);

        printf("\tEnter available seats: ");
        scanf("%d", &f[i].available_seats);
    }
}

// Search the flight
void searchByDestination(int n, Flight_t f[], char searchDest[]) {
    for (int i = 0; i < n; i++) {
        if (strcmp(f[i].destination, searchDest) == 0) {
            printf("Flight number %d goes to destination %s\n",
                   f[i].flight_number, searchDest);
            return;
        }
    }
    printf("No flight for destination %s\n", searchDest);
}
