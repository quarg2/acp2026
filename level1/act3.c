#include <stdio.h>

typedef struct {
    int consumerID;
    float unitsConsumed;
    float rate;
    float billAmount;
} Bill;

// Calculate electricity bill for multiple consumers
// Display the highest bill

void input(int n, Bill bills[]);
void calculate_Bills(int n, Bill bills[]);
int findHighestBillIndex(int n, Bill bills[]);
void displayHighestBill(int index, Bill bills[]);

int main(void) {
    int n, max;
    printf("Enter number of bills: ");
    scanf("%d", &n);

    Bill bills[n];

    input(n, bills);
    calculate_Bills(n, bills);
    max = findHighestBillIndex(n, bills);
    displayHighestBill(max, bills);

    return 0;
}

void displayHighestBill(int max, Bill bills[]) {
    printf("The highest bill is from id %d, with %f units consumed and %f amount\n",
           bills[max].consumerID, bills[max].unitsConsumed, bills[max].billAmount);
}

int findHighestBillIndex(int n, Bill bills[]) {
    int max = 0;

    for (int i = 0; i < n; i++) {
        max = (bills[i].billAmount > bills[max].billAmount) ? i : max;
    }

    return max;
}

void calculate_Bills(int n, Bill bills[]) {
    for (int i = 0; i < n; i++) {
        bills[i].billAmount = bills[i].rate * bills[i].unitsConsumed;
    }
}

void input(int n, Bill bills[]) {
    for (int i = 0; i < n; i++) {
        printf("Bill %d\n", i + 1);
        printf("\tEnter consumer ID: ");
        scanf("%d", &bills[i].consumerID);
        
        printf("\tEnter units consumed: ");
        scanf("%f", &bills[i].unitsConsumed);

        printf("\tEnter rate: ");
        scanf("%f", &bills[i].rate);
    }
}
