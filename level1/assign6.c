#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct {
    int medID;
    char name[50];
    int expYear;
} Medicine;

Medicine* allocate_inventory(int n);
void read_inventory(Medicine *m, int n);
void display_inventory(Medicine *m, int n);
void delete_inventory(Medicine **m);

int main(void) {
    int n;
    char buffer[50];
    printf("Enter number of medicines: ");
    fgets(buffer, 50, stdin);
    sscanf(buffer, "%d", &n);
    
    Medicine *meds = allocate_inventory(n);

    read_inventory(meds, n);
    display_inventory(meds, n);

    delete_inventory(&meds);
    
    return 0;
}

void display_inventory(Medicine *m, int n) {
    for (int i = 0; i < n; i++) {
        printf("Medicine ID: %d\n", m[i].medID);
        printf("\tName: %s\n", m[i].name);
        printf("\tExpiration date: %d\n\n", m[i].expYear);
    }
}

void read_inventory(Medicine *m, int n) {
    char buffer[50];

    for (int i = 0; i < n; i++) {
        printf("Enter medicine ID: ");
        fgets(buffer, 50, stdin);
        sscanf(buffer, "%d", &m[i].medID);
        
        printf("Enter medicine name: ");
        fgets(m[i].name, 50, stdin);
        m[i].name[strcspn(m[i].name, "\n")] = '\0';

        printf("Enter medicine expiration date: ");
        fgets(buffer, 50, stdin);
        sscanf(buffer, "%d", &m[i].expYear);
    }
}

void delete_inventory(Medicine **m) {
    free(*m);
    *m = NULL;
}

Medicine* allocate_inventory(int n) {
    Medicine *med = (Medicine*)malloc(sizeof(Medicine) * n);
    if (med == NULL) {
        printf("Memory allocation failed!\n");
        exit(1);
    }
    return med;
}
