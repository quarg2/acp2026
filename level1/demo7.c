#include <stdio.h>

#define MAXLINE 1000

// Using a custom function, compare two strings

void inputStrings(char str1[], char str2[]);
int compareStrings(char str1[], char str2[]);
void output(int result);

int main() {
    int result;
    char str1[MAXLINE], str2[MAXLINE];

    inputStrings(str1, str2);
    result = compareStrings(str1, str2);
    output(result);

#ifdef DEBUG
#include <string.h>
    assert(result == strcmp(str1, str2));
#endif

    return 0;
}

int compareStrings(char str1[], char str2[]) {
    int i;
    for (i = 0; str1[i] == str2[i]; i++) {
        if (str1[i] == '\0') return 0;
    }
    return (str1[i] - str2[i] > 0) ? 1 : -1;
}

void inputStrings(char str1[], char str2[]) {
    printf("Enter string 1: ");
    fgets(str1, MAXLINE, stdin);
    printf("Enter string 2: ");
    fgets(str2, MAXLINE, stdin);
}

void output(int result) {
    if (result == 0)
        printf("Strings 1 and 2 are equal\n");
    else if (result < 0)
        printf("String 1 is lesser than string 2\n");
    else
        printf("String 1 is greater than string 2\n");
}
