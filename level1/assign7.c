#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXLINE 1000
#define IN      1
#define OUT     0

void input(char *str);
int count_words(char *str);
void display(char *str, int count);

int main(void) {
    int wordCount;
    char *str = (char *)malloc(MAXLINE);

    input(str);
    wordCount = count_words(str);
    display(str, wordCount);

    free(str);

    return 0;
}

void display(char *str, int count) {
    printf("The string \n\'%s\'\ncontains %d words\n", str, count);
}

int count_words(char *str) {
    int wordCount = 0;
    int state     = OUT;

    while (*str) {
        if (*str == ' ' || *str == '\t' || *str == '\0') {
            state = OUT;
        } else if (state == OUT) {
            state = IN;
            ++wordCount;
        }
        str++;
    }
    return wordCount;
}

void input(char *str) {
    fgets(str, MAXLINE, stdin);
    str[strcspn(str, "\n")] = '\0';
}
