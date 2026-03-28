#include <stdio.h>

#define EXTRA_CHARGE 5

// Check if electricity units consumed exceed 100 units
// if so, apply extra charge and display a warning
// if consumption is less than 50 units, the bill is free

typedef struct {
    int units;
    float rate;
    float total_bill;
} ElectricityBill;

ElectricityBill input(void);
ElectricityBill calculate_bill(ElectricityBill bill);
void output(ElectricityBill bill);

int main(void) {
    ElectricityBill electricityBill;

    electricityBill = input();
    electricityBill = calculate_bill(electricityBill);

    output(electricityBill);

    return 0;
}

void output(ElectricityBill bill) {
    printf("The total bill amount is %f\n", bill.total_bill);
    if (bill.units > 100) {
        printf("High consumption alert! Extra charge applied.\n");
    }
}

ElectricityBill calculate_bill(ElectricityBill bill) {
    if (bill.units < 50) {
        bill.total_bill = 0;
    } else if (bill.units <= 100) {
        bill.total_bill = bill.units * bill.rate;
    } else {
        bill.total_bill
            = bill.units * (bill.rate + EXTRA_CHARGE) - EXTRA_CHARGE * 100;
    }

    return bill;
}

ElectricityBill input(void) {
    ElectricityBill electricityBill;
    printf("Enter units: ");
    scanf("%d", &electricityBill.units);
    printf("Enter rate: ");
    scanf("%f", &electricityBill.rate);

    return electricityBill;
}
