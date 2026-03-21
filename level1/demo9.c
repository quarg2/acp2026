#include <stdio.h>
#include <assert.h>
#include <string.h>

#define MAXLINE 100

// Read details of students and store it in an array of structures.
// Write it to a text file
// Read it from the text file into another array of structures
// Then diispaly it

typedef struct {
    char name[MAXLINE];
    int class;
    float marks;
} Student;

void inputStudents(Student students[], int n);
void writeToTextFile(Student students[], int n, const char *filename);
int readFromTextFile(Student students[], const char *filename);
void printStudents(Student students[], int n);

int main(void) {
    int n;
    char buf[10];
    
    printf("Enter number of students: ");
    fgets(buf, 10, stdin);
    sscanf(buf, "%d", &n);
    
    Student students[n];

    inputStudents(students, n);
    writeToTextFile(students, n, "text.txt");

    Student differentStudentArray[n];

    readFromTextFile(differentStudentArray, "text.txt");
    printStudents(differentStudentArray, n);

    return 0;
}

int readFromTextFile(Student students[], const char *filename) {
    char buf[1000];
    int i = 0;

    FILE *file = fopen(filename, "r");
    
    while (fgets(buf, 1000, file) != NULL) {
        sscanf(buf, "%s %d %f", students[i].name, &students[i].class, &students[i].marks);
        i++;
    }

    fclose(file);

    return i;
}

void printStudents(Student students[], int n) {
    for (int i = 0; i < n; i++) {
        printf("Student %d\nname: %s\nclass: %d\nMarks: %f\n",
               i + 1, students[i].name, students[i].class, students[i].marks);
    }
}

void writeToTextFile(Student students[], int n, const char *filename) {
    FILE *f = fopen(filename, "w");
    assert(f != NULL);

    for (int i = 0; i < n; i++) {
        fprintf(f, "%s %d %f\n", students[i].name, students[i].class, students[i].marks);
    }
    
    fclose(f);
}

void inputStudents(Student students[], int n) {
    char t[50];
    for (int i = 0; i < n; i++) {
        printf("Student %d\n", i + 1);
        printf("\tEnter name: ");
        fgets(students[i].name, MAXLINE, stdin);
        // Remove newline
        students[i].name[strcspn(students[i].name, "\n")] = 0;
        printf("\tEnter class: ");
        fgets(t, 50, stdin);
        sscanf(t, "%d", &students[i].class);
        printf("\tEnter marks: ");
        fgets(t, 50, stdin);
        sscanf(t, "%f", &students[i].marks);
    }
}
