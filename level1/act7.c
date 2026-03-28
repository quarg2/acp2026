#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXLINE 1000

void input(char *name);
int calculate_name_length(char *name);
void compare_output(int len1, int len2, char *name1, char *name2);

int main(void) {
    int len1, len2;

    char *name1 = (char *)malloc(sizeof(char) * MAXLINE);
    char *name2 = (char *)malloc(sizeof(char) * MAXLINE);

    if (name1 == NULL || name2 == NULL) {
        printf("Memory allocation eror!\n");
        exit(1);
    }

    printf("Enter name 1: ");
    input(name1);
    printf("Enter name 2: ");
    input(name2);

    len1 = calculate_name_length(name1);
    len2 = calculate_name_length(name2);

    compare_output(len1, len2, name1, name2);

    free(name1);
    free(name2);

    return 0;
}

int calculate_name_length(char *name) {
    int i = 0;

    while (*name++) i++;

    return i;
}

void input(char *name) {
    fgets(name, MAXLINE, stdin);
    name[strcspn(name, "\n")] = '\0';
}

void compare_output(int len1, int len2, char *name1, char *name2) {
    if (len1 > len2) {
        printf("Name 1, %s, is longer with %d characters\n", name1, len1);
    } else if (len1 < len2) {
        printf("Name 2, %s, is longer with %d characters\n", name2, len2);
    } else {
        printf("Both names, %s, and %s, are equally long with %d characters\n",
               name1, name2, len1);
    }
}
