#include <assert.h>

void rotate(int *a, int *b, int *c){
    *a = *a ^ *b;
    *b = *a ^ *b;
    *a = *a ^ *b;

    *a = *a ^ *c;
    *c = *a ^ *c;
    *a = *a ^ *c;
}

int main() {
    int a = 3, b = 5, c = 7;
    rotate(&a, &b, &c);
    assert(a == 7 && b == 3 && c == 5);
    return 0;
}