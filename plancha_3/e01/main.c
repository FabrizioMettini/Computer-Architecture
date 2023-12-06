#include <assert.h>

double convert(double, int);

int main()
{
    double f = 3.5;
    int c = 32;
    assert(convert(f, c) == 37.25);
    return 0;
}
