#include <stdio.h>
#include <string.h>

#define MAXLINE 1000

// Concatenate two strings using a custom function

void input(char* str);
void concatenate_strings(char* str1, char* str2);
void display(char* str);

int main(void) {
    char s1[MAXLINE], s2[MAXLINE];

    input(s1);
    input(s2);

    concatenate_strings(s1, s2);

    display(s1);
    printf("\n");

    return 0;
}

void concatenate_strings(char* str1, char* str2) {
    while (*str1++ != '\0')  // Get length of string
        ;
    str1--;  // Since it increments even after failing the test, go one back
    while ((*str1++ = *str2++) != '\0')  // Concatenate string
        ;

    *str1 = '\0';  // Null termination
}

void input(char* str) {
    printf("Enter a string: ");
    fgets(str, MAXLINE, stdin);
    str[strcspn(str, "\n")] = '\0';
}

void display(char* str) { printf("%s", str); }
