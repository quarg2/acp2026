#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// !! Not portable
// Not ISO C11 compatible
// Uses nested functions. Only tested on GCC
// Depends on ASCII

#define MAXLINE 1000

void input(char *str);
int is_valid(char *str);
int is_upper(char c);
int is_lower(char c);
int is_digit(char c);
void display(char *str, int res);

int main(void) {
    int res;
    char *str = (char*)malloc(sizeof(char) * MAXLINE);

    do {
        input(str);
        res = is_valid(str);
        display(str, res);
    } while (!res);
    
    free(str);

    return 0;
}

void display(char *str, int res) {
    if (res) {
        printf("The password %s is valid\n", str);
    } else {
        printf("The password '%s' is invalid\nIt must contain at least 8 characters, must have one uppercase and one lowercase character and one digit\n\n", str);
    }
}

int is_valid(char *str) {
    int is_upper(char c) {
        return c >= 'A' && c <= 'Z';
    }
    int is_lower(char c) {
        return c >= 'a' && c <= 'z';
    }
    int is_digit(char c) {
        return c >= '0' && c <= '9';
    }

    int charCount = 0, lowerCount = 0, upperCount = 0, digitCount = 0;

    while (*str) {
        charCount++;
        
        if (is_upper(*str)) {
            upperCount++;
        } else if (is_lower(*str)) {
            lowerCount++;
        } else if (is_digit(*str)) {
            digitCount++;
        }
        str++;
    }
    #ifdef DEBUG
    printf("charCount %d, upperCount %d, lowerCount %d, digitCount %d\n",
           charCount, upperCount, lowerCount, digitCount);
    #endif

    return charCount >= 8 && upperCount > 0 && lowerCount > 0 && digitCount > 0;
}

void input(char *str) {
    fgets(str, MAXLINE, stdin);
    str[strcspn(str, "\n")] = '\0';
}
