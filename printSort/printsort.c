#include <stdio.h>
#include <stdbool.h>


void readstring(char str[]) {
    int count = 0;
    char c;

    while ((c = getchar()) != '\n') {
        str[count] = c;
        count++;
    }
    str[count] = '\0';
}

int main() {
    char prev;
    char str[20];


    while (true) {
        int size = 0;
        char min = 'z';
        char max = 'A';
        bool run0 = true;
        printf("Enter word: ");
        readstring(str); 
        
        if (str[0] == '\0') {
            break;
        }

    int i = 0;
    for (; i < 20; i ++) {
        if (str[i] == '\0') {
            break;
        } else {
            size += 1;
        }
    }

    printf("Original word: %s", str);

    printf("\n");
    printf("Alphabetized word: ");
    int f = 0;
    for (; f < size; f ++) {
        int repeats = 0;
        if (run0 == true) {
            i = 0;
            for (; i < size; i ++) {
                if (str[i] < min) {
                min = str[i];
                }
            }
            i = 0;
            for (; i < size; i ++) {
                if (str[i] > max) {
                max = str[i];
            }
            }
            run0 = false;
        
        } 
        else {
            prev = min; 
            min = max;
            i = 0;
            for (; i < size; i ++) {
                if (str[i] > prev){
                    if (str[i] < min) {
                        min = str[i];
                    }
                }
            }
        }
        i = 0;
        for (; i < size; i ++) {  
            if (str[i] == min) {
                repeats += 1;
            }
        }      
        f += (repeats - 1);

        i = 0;
        for (; i < repeats; i ++) {
            printf("%c", min);
        } 
    }
    printf("\n");
    }

    printf("\nExiting");
    return 0;
}
