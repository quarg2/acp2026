#include <stdio.h>
#include <string.h>
#include <assert.h>

typedef struct {
    int roll;
    char name[100];
    float marks;
} Student;

void inputStudents(Student students[], int n);
void writeToBinaryFile(Student students[], int n, const char *file);
int readFromBinaryFile(Student students[], const char *filename);
void printStudents(Student students[], int n);

int main(void) {
    int studentCount;
    char buffer[100];

    printf("Enter number of students: ");
    fgets(buffer, 100, stdin);
    sscanf(buffer, "%d", &studentCount);
    
    Student students[studentCount], otherStudents[studentCount];
    char *file = "file";
    
    inputStudents(students, studentCount);
    writeToBinaryFile(students, studentCount, file);
    
    readFromBinaryFile(otherStudents, file);
    
    printStudents(otherStudents, studentCount);
    
    return 0;
}

int readFromBinaryFile(Student students[], const char *filename) {
    unsigned long count;
    FILE *f = fopen(filename, "rb");

    assert(f != NULL);
    
    // Get file size then divide it by the size of the struct
    // to get number of structs
    fseek(f, 0L, SEEK_END);
    count = (unsigned long)ftell(f) / sizeof(Student);
    rewind(f);
    
    assert(count == fread(students, sizeof(Student), count, f));

    fread(students, sizeof(Student), count, f);
    
    fclose(f);

    return count;
}

void writeToBinaryFile(Student students[], int n, const char *file) {
    FILE *f = fopen(file, "wb");

    assert(f != NULL);

    fwrite(students, sizeof(Student), (unsigned long) n, f);
    
    fclose(f);
}

void printStudents(Student student[], int n) {
    for (int i = 0; i < n; i++) {
        printf("Roll number: %d\n", student[i].roll);
        printf("\tName: %s\n", student[i].name);
        printf("\tMarks: %f\n", student[i].marks);
    }
}

void inputStudents(Student students[], int n) {
    char buffer[100];
    for (int i = 0; i < n; i++) {
        printf("Student %d\n", i + 1);

        printf("\tEnter roll number: ");
        fgets(buffer, 100, stdin);
        sscanf(buffer, "%d", &students[i].roll);

        printf("\tEnter name: ");
        fgets(students[i].name, 100, stdin);
        students[i].name[strcspn(students[i].name, "\n")] = '\0';

        printf("\tEnter marks: ");
        fgets(buffer, 100, stdin);
        sscanf(buffer, "%f", &students[i].marks);
    }
}
