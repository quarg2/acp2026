#include <stdio.h>
#include <string.h>

// Manage a team of 11 players and calculate average score

typedef struct {
    char playerName[100];
    int jerseyNumber;
    int runsScored;
} Player;

void readPlayers(int n, Player p[]);
float calculateAverageRuns(int n, Player p[]);

int main(void) {
    Player players[11];
    float averageRuns;
    
    readPlayers(11, players);

    averageRuns = calculateAverageRuns(11, players);

    printf("The average runs is %f\n", averageRuns);
    
    return 0;
}

float calculateAverageRuns(int n, Player p[]) {
    int totalRuns = 0;
    
    for (int i = 0; i < n; i++)
        totalRuns += p[i].runsScored;

    return (float)totalRuns / n;
}

void readPlayers(int n, Player p[]) {
    char buffer[100];

    for (int i = 0; i < n; i++) {
        printf("Player %d:\n", i + 1);

        printf("\tEnter name of the player: ");
        fgets(p[i].playerName, 100, stdin);
        p[i].playerName[strcspn(p[i].playerName, "\n")] = '\0';
        
        printf("\tEnter jersey number of the player: ");
        fgets(buffer, 100, stdin);
        sscanf(buffer, "%d", &p[i].jerseyNumber);
        
        printf("\tEnter runs scored by the player: ");
        fgets(buffer, 100, stdin);
        sscanf(buffer, "%d", &p[i].runsScored);
    }
}
