#include <stdio.h>
#include "operations.h"

int main() {
    char check = 'y';
    int numOper = 0;
    unsigned int userNumber1;
    int userNumber2;
    int operSelected;
    int retValue;

    printf("Welcome to the Calculator program.\n");
    printf("Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift\n");
    
    while(check != 'n') {
        printf("\nNumber of operations performed: %d\n", numOper);
        printf("Enter number: ");
        scanf("%u", &userNumber1);
        printf("Enter second number: ");
        scanf("%d", &userNumber2);
        printf("Select operation: ");
        scanf("%d", &operSelected);

        

        switch (operSelected) {
            case 1:
                retValue = addnums(userNumber1, userNumber2);
                printf("Result: %d", retValue);
                break;
            case 2:
                retValue = subnums(userNumber1, userNumber2);
                printf("Result: %d", retValue);
                break;
            case 3:
                retValue = multnums(userNumber1, userNumber2);
                printf("Result: %d", retValue);
                break;
            case 4:
                retValue = divnums(userNumber1, userNumber2);
                printf("Result: %d", retValue);
                break;
            case 5:
                retValue = andnums(userNumber1, userNumber2);
                printf("Result: %d", retValue);
                break;
            case 6:
                retValue = ornums(userNumber1, userNumber2);
                printf("Result: %d", retValue);
                break;
            case 7:
                retValue = xornums(userNumber1, userNumber2);
                printf("Result: %d", retValue);
                break;
            case 8:
                retValue = lshiftnums(userNumber1, userNumber2);
                printf("Result: %d", retValue);
                break;
            case 9:
                retValue = rshiftnums(userNumber1, userNumber2);
                break;
            default: printf("Result: Invalid Operation");
                
        }
        numOper++;
        printf("\nContinue (y/n)?: ");
        scanf(" %c", &check);
    }
    printf("\nNumber of operations performed: %d", numOper);
    printf("\nExiting");
    
}