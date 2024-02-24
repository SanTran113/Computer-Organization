#include <stdio.h>

// int main() {
//     int num;
//     char ch = 'y';

//     printf("Welcome to the CountOnes program.\n");
//     while (ch != 'n') {
//         unsigned int b = 2147483648;
//         int count = 0;
//         int i = 0;
//         printf("\nPlease enter a number: "); 
//         scanf("%d", &num); 
//         printf("The number of bits set is: "); 


//         for (; i < 32; i++) { 
//             if ((num & b) != 0) { 
//                 count += 1; 
//             }
//             b = b >> 1; 
//         }


//         printf("%d", count);
//         printf("\nContinue (y/n)?: ");
//         scanf(" %c", &ch); 
//     }

//     printf("Exiting");
//     return 0;
// }

// #include <stdio.h>

int main() {
    int num;
    char ch = 'y';

    printf("Welcome to the CountOnes program.\n");
    while (ch != 'n') {
        int b = 1;
        int count = 0;
        int i = 0;
        printf("\nPlease enter a number: "); 
        scanf("%d", &num); 
        printf("The number of bits set is: "); 


        for (; i < 32; i++) { 
            if ((num & b) == 1) { 
                count += 1; 
            }
            num = num >> 1; 
        }


        printf("%d", count);
        printf("\nContinue (y/n)?: ");
        scanf(" %c", &ch); 
    }

    printf("Exiting");
    return 0;
}