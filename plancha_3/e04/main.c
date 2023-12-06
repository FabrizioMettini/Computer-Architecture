#include <assert.h>
#include <math.h>

const float epsilon = 0.000001;

void sum_simd(float *a, float *b, int len);

int main()
{
    float a[5] = { 1.0, 2.0, 3.0, 4.0, 5.0 };
    float b[5] = { 1.1, 2.2, 3.3, 4.4, 5.5 };
    sum_simd(a, b, 5);
    assert(fabs(a[0] - 2.1) < epsilon );
    assert(fabs(a[1] - 4.2) < epsilon );
    assert(fabs(a[2] - 6.3) < epsilon );
    assert(fabs(a[3] - 8.4) < epsilon );
    assert(fabs(a[4] - 10.5) < epsilon );
    return 0;
}
