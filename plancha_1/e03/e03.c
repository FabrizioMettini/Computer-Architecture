#include <stdio.h>

void printbin(unsigned long n) 
{
    for (unsigned long i = 0; i <= 63; i++) {
        printf("%lu", (n >> (63 - i)) & 1);
    }
    printf("\n");
}

int main() 
{
    printf("%3.d in binary: ", 39);
    printbin(39);
    printf("%3.d in binary: ", -39);
    printbin(-39);
    return 0;
}
