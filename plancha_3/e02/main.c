#include <assert.h>

int solve(float a, float b, float c, float d, float e, float f, float *x, float *y);

int main() 
{
    float x, y;

    // unique solution
    assert(solve(1.0, 2.0, 9.0, 3.0, 5.0, 20.0, &x, &y) == 0);
    assert(x == -5.0 && y == 7.0);

    // no solution
    assert(solve(1.0, 2.0, 3.0, 1.0, 2.0, 4.0, &x, &y) == -1);

    // infinite solutions
    assert(solve(1.0, 2.0, -3.0, -3.0, -6.0, 9.0, &x, &y) == -1);

    return 0;
}