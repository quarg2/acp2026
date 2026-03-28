#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXLINE 1000

void input(char *str);
void count(char *str, int *vowels, int *consonants);
void display(char *str, int vowels, int consonants);

int main(void) {
    int cc = 0, vc = 0;
    char *str = (char *)malloc(sizeof(char) * MAXLINE);

    printf("Enter string: ");
    input(str);

    count(str, &vc, &cc);

    display(str, vc, cc);

    free(str);

    return 0;
}

void display(char *str, int vowels, int consonants) {
    printf("The string '%s' has %d vowels and %d consonants\n", str, vowels,
           consonants);
}

void count(char *str, int *vowels, int *consonants) {
    while (*str) {
        if ((*str >= 'a' && *str <= 'z') || (*str >= 'A' && *str <= 'Z')) {
            switch (*str) {
                case 'a':
                case 'e':
                case 'i':
                case 'o':
                case 'u':
                case 'A':
                case 'E':
                case 'I':
                case 'O':
                case 'U':
                    (*vowels)++;
                    break;
                default:
                    (*consonants)++;
                    break;
            }
        }
        str++;
    }
}

void input(char *str) {
    fgets(str, MAXLINE, stdin);
    str[strcspn(str, "\n")] = '\0';
}
