#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int employeeID;
    char name[100];
    float salary;
} Employee;

void inputEmployees(Employee e[], int n);
void writeToTextFile(Employee e[], int n, const char *filename);
float calculateTotalPayroll(const char *filename);
void displayExpenditure(float total);

int main(void) {
    char buf[100];
    int count;
    float total;

    printf("Enter number of employees: ");
    fgets(buf, 100, stdin);
    sscanf(buf, "%d", &count);

    Employee employees[count];

    inputEmployees(employees, count);
    writeToTextFile(employees, count, "payroll.txt");
    total = calculateTotalPayroll("payroll.txt");

    displayExpenditure(total);

    return 0;
}

void displayExpenditure(float total) {
    printf("The total salary that must be paid is %f\n", total);
}

float calculateTotalPayroll(const char *filename) {
    float total = 0;

    char buf[1000];

    Employee temployee;

    FILE *f = fopen(filename, "r");

    while (fgets(buf, 1000, f) != NULL) {
        sscanf(buf, "%d %s %f", &temployee.employeeID, temployee.name, &temployee.salary);

        total += temployee.salary;
    }

    fclose(f);

    return total;
}

void writeToTextFile(Employee e[], int n, const char *filename) {
    FILE *f = fopen(filename, "w");

    if (f == NULL) {
        printf("Error with opening file!\n");
        exit(74);
    }

    for (int i = 0; i < n; i++) {
        fprintf(f, "%d %s %f\n", e[i].employeeID, e[i].name, e[i].salary);
    }

    fclose(f);
}

void inputEmployees(Employee e[], int n) {
    char buf[100];
    for (int i = 0; i < n; i++) {
        printf("Employee %d\n", i + 1);

        printf("\tEnter employee ID: ");
        fgets(buf, 100, stdin);
        sscanf(buf, "%d", &e[i].employeeID);

        printf("\tEnter name: ");
        fgets(e[i].name, 100, stdin);
        e[i].name[strcspn(e[i].name, "\n")] = '\0';

        printf("\tEnter salary: ");
        fgets(buf, 100, stdin);
        sscanf(buf, "%f", &e[i].salary);
    }
}
