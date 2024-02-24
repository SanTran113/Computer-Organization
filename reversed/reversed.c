#include <stdio.h>
int main() {
    int num;
    char ch = 'y';

    printf("Welcome to the Reverse program.\n");
    while (ch != 'n') {
        int bit = 0;
        int count = 0;
        int i = 0;
        printf("\nPlease enter a number: "); 
        scanf("%d", &num); 

        printf("The bit reversed value in hex is: "); 

    
        int temp = 0;
        int reversed =0;
        //reverse bits 
        for (; i < 32; i++) {
            temp = num >> i; //moving to what bit we want to look at 
            temp = temp & 1; // is that bit a 0 or 1 
            temp = temp << (31-i); // move the bit to the left 
            reversed = reversed | temp; // combine the bit with the final reversed bit 
    }
        printf("\n");
        printf("%d\n", reversed);
        
        printf("%x", reversed);
        int r =0;

        //convert to hexidecimal
        // https://stackoverflow.com/questions/30463962/printf-char-as-hex-in-c
        // for(i=0; i < 4; i++) {
            // printf("%d\n", i);
            // r = reversed(i);
            // printf("%02hhx", ((unsigned char*) & reversed)[i]);
        // }
        
        printf("\nContinue (y/n)?: ");
        scanf(" %c", &ch); 
    }

    printf("Exiting");
    return 0;
}