#include <stdio.h>
#include <stdlib.h>

int *allocate_scores(int n);
void read_scores(int *arr, int n);
int calculate_total(int *arr, int n);
void display_scores(int *arr, int n);
void delete_scores(int **arr);

int main(void) {
    int *scores;
    int count, total;
    printf("Enter number of players: ");
    scanf("%d", &count);

    scores = allocate_scores(count);

    read_scores(scores, count);
    display_scores(scores, count);
    total = calculate_total(scores, count);

    printf("The total score is %d\n", total);

    delete_scores(&scores);

    return 0;
}

void display_scores(int *arr, int n) {
    for (int i = 0; i < n; i++) {
        printf("Player %d\tScore %d\n", i + 1, *(arr + i));
    }
}

int calculate_total(int *arr, int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) sum += *(arr + i);
    return sum;
}

void read_scores(int *arr, int n) {
    for (int i = 0; i < n; i++) {
        printf("Enter %d player score: ", i + 1);
        scanf("%d", arr + i);
    }
}

int *allocate_scores(int n) {
    int *m = (int *)malloc(sizeof(int) * n);

    if (m == NULL) {
        printf("Memory allocation error!\n");
        exit(1);
    }
    return m;
}

void delete_scores(int **arr) {
    free(*arr);
    *arr = NULL;
}
