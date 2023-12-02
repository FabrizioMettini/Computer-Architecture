#include <stdio.h>

unsigned int russian_peasant(unsigned int i, unsigned int j);

int main() 
{
    int i = 42, j = 7;
    printf("%u x %u = %u\n", i, j, russian_peasant(i, j));
}

