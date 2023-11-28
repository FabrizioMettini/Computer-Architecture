#include <assert.h>

// recursive
unsigned mult1(unsigned a, unsigned b) {
    if (b == 0) {
        return 0;
    } else if (b == 1) {
        return a;
    } else if (b & 1) {
        return 2 * mult1(a, b >> 1) + a;
    } else {
        return 2 * mult1(a, b >> 1);
    }
}

// iterative
unsigned mult2(unsigned a, unsigned b) {
    if (b == 0) {
        return 0;
    }
    
    unsigned ans = a;
    unsigned aux = 0;

    while (b != 1) {
        ans <<= 1; 
        if (b & 1) {
            aux += a;
        }
        b >>= 1;
    }

    ans += aux;
    return ans;
}

int main() {
    assert(mult1(23, 0) == 0);
    assert(mult1(23, 1) == 23);
    assert(mult1(23, 2) == 46);
    assert(mult1(23, 3) == 69);
    assert(mult1(23, 4) == 92);
    assert(mult1(23, 5) == 115);

    assert(mult2(23, 0) == 0);
    assert(mult2(23, 1) == 23);
    assert(mult2(23, 2) == 46);
    assert(mult2(23, 3) == 69);
    assert(mult2(23, 4) == 92);
    assert(mult2(23, 5) == 115);

    return 0;
}