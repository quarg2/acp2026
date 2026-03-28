#include <stdio.h>
#include <string.h>

void read_string(char str[], int size);
void print_string(char str[]);
void swap_string(char str1[], char str2[]);

// Swap two strings

int main(void) {
    char str1[1000], str2[1000];
    read_string(str1, 1000);
    read_string(str2, 1000);

    swap_string(str1, str2);

    print_string(str1);
    print_string(str2);
    
    return 0;
}

void swap_string(char str1[], char str2[]) {
    int nullSeen1 = 0, nullSeen2 = 0, i = 0;
    char temp;
    
    do {
        temp = str1[i];
        str1[i] = str2[i];
        str2[i] = temp;

        nullSeen1 = (str1[i] == '\0') ? 1 : nullSeen1;
        nullSeen2 = (str2[i] == '\0') ? 1 : nullSeen2;
        
        i++;
    } while (!(nullSeen1 && nullSeen2));
}

void print_string(char str[]) {
    printf("%s\n", str);
}

void read_string(char str[], int size) {
    fgets(str, size, stdin);
    str[strcspn(str, "\n")] = '\0';
}
