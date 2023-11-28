#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) 
{
    int key = atoi(argv[1]);
    size_t n = strlen(argv[2]);
    char* str = malloc(n + 1);
    str[n] = '\0';

    for (int i = 0; i < n; i++) {
        str[i] = argv[2][i] ^ key;   
    }
    printf("%s\n", str);

    free(str);
    return 0;
}