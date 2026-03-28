#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SAVE_FILE "inventory.bin"

typedef struct {
    int productID;
    char name[100];
    float price;
} Product;

void inputProducts(Product p[], int n);
void saveToBinaryFile(Product p[], int n, const char *file);
float calculateTotalValue(const char *file);
void displayTotalValue(float total);

int main(void) {
    char buf[100];
    int count;

    printf("Enter number of products: ");
    fgets(buf, 100, stdin);
    sscanf(buf, "%d", &count);

    Product products[count];

    inputProducts(products, count);

    saveToBinaryFile(products, count, SAVE_FILE);
    displayTotalValue(calculateTotalValue(SAVE_FILE));
    
    return 0;
}

void displayTotalValue(float total) {
    printf("The total value is %f\n", total);
}

float calculateTotalValue(const char *file) {
    float total = 0;
    Product product;
    FILE *f = fopen(file, "rb");    
    
    if (f == NULL) {
        printf("File error\n");
        exit(1);
    }

    while (fread(&product, sizeof(Product), 1, f) != 0) {
        printf("Product ID: %d\n\tProduct name: %s\n\tProduct cost:%f\n",
               product.productID, product.name, product.price);
        total += product.price;
    }
    
    return total;
}

void saveToBinaryFile(Product p[], int n, const char *file) {
    FILE *f = fopen(file, "wb");

    if (f == NULL) {
        printf("File error!\n");
        exit(1);
    }

    fwrite(p, sizeof(Product), (size_t)n, f);

    fclose(f);
}

void inputProducts(Product p[], int n) {
    char buffer[100];

    for (int i = 0; i < n; i++) {
        printf("Product %d\n", i + 1);

        printf("\tEnter product ID: ");
        fgets(buffer, 100, stdin);
        sscanf(buffer, "%d", &p[i].productID);

        printf("\tEnter product name: ");
        fgets(p[i].name, 100, stdin);
        p[i].name[strcspn(p[i].name, "\n")] = '\0';

        printf("\tEnter product price: ");
        fgets(buffer, 100, stdin);
        sscanf(buffer, "%f", &p[i].price);
    }
}
