#include <assert.h>
#include <ieee754.h>
#include <stdio.h>

int mantissa(float f)
{
    return *(int*)&f & 0x7fffff;
}

int exponent(float f)
{
    return (*((int*) &f) >> 23) & 0xff; 
}


int main()
{
    float f;
    union ieee754_float b;

    f = 3.15;
    b.f = 3.15;

    assert(mantissa(f) == b.ieee.mantissa);
    assert(exponent(f) == b.ieee.exponent);
}
