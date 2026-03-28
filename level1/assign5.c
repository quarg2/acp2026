#include <stdio.h>
#include <string.h>

typedef struct {
    char name[50];
    int age;
} Person;

void read_person(Person *p);
void print_person(Person *p);
void swap_person(Person *p1, Person *p2);

int main(void) {
    Person p1, p2;

    read_person(&p1);
    read_person(&p2);

    printf("Before swapping\n");
    print_person(&p1);
    print_person(&p2);

    swap_person(&p1, &p2);
    
    printf("After swapping\n");
    print_person(&p1);
    print_person(&p2);
    
    return 0;
}

void swap_person(Person *p1, Person *p2) {
    Person temp = *p1;
    *p1 = *p2;
    *p2 = temp;    
}

void read_person(Person *p) {
    char buffer[50];
    printf("Enter person name: ");
    fgets(p->name, 50, stdin);
    p->name[strcspn(p->name, "\n")] = '\0';
    printf("Enter person age: ");
    fgets(buffer, 50, stdin);
    sscanf(buffer, "%d", &p->age);
 }

void print_person(Person *p) {
    printf("Name: %s\tAge: %d\n", p->name, p->age);
}
