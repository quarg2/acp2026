#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SAVE_FILE "inventory.txt"

typedef struct {
    int productID;
    char name[100];
    float price;
} Product;

void inputProducts(Product p[], int n);
void saveToFile(Product p[], int n, const char *file);
float calculateTotalValue(const char *file);
void displayTotalValue(float total);

int main(void) {
    char buf[100];
    int count;
    float total;

    printf("Enter number of products: ");
    fgets(buf, 100, stdin);
    sscanf(buf, "%d", &count);

    Product products[count];
    
    inputProducts(products, count);

    saveToFile(products, count, SAVE_FILE);

    total = calculateTotalValue(SAVE_FILE);

    displayTotalValue(total);

    return 0;
}

void displayTotalValue(float total)  {
    printf("The total value is %f\n", total);
}

float calculateTotalValue(const char *file) {
    float total = 0;
    char buf[1000];
    Product p;

    FILE *f = fopen(file, "r");
    
    while (fgets(buf, 1000, f) != NULL) {
        sscanf(buf, "%d %s %f", &p.productID, p.name, &p.price);
        total += p.price;
    }

    fclose(f);
        
    return total;
}

void saveToFile(Product p[], int n, const char *file) {
    FILE *f = fopen(file, "w");

    if (f == NULL) {
        printf("Error with opening file!\n");
        exit(74);
    }

    for (int i = 0; i < n; i++) {
        fprintf(f, "%d %s %f\n", p[i].productID, p[i].name, p[i].price);
    }

    fclose(f);
}

void inputProducts(Product p[], int n) {
    char buf[100];

    for (int i = 0; i < n; i++) {
        printf("Product %d\n", i + 1);

        printf("\tEnter product ID: ");
        fgets(buf, 100, stdin);
        sscanf(buf, "%d", &p[i].productID);

        printf("\tEnter name: ");
        fgets(p[i].name, 100, stdin);
        p[i].name[strcspn(p[i].name, "\n")] = '\0';

        printf("\tEnter price: ");
        fgets(buf, 100, stdin);
        sscanf(buf, "%f", &p[i].price);
    }
}
