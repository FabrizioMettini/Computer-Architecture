#include <assert.h>
#include <math.h>
#include <stdio.h>

int mantissa(float f)
{
    return *(int*)&f & 0x7fffff;
}

int exponent(float f)
{
    return (*((int*) &f) >> 23) & 0xff; 
}

int myisnan(float f)
{
    return exponent(f) == 255 && mantissa(f) != 0;
}

int myisnan2(float f) 
{
    return f != f;
}


int main()
{
    float f = NAN;
    assert(f != NAN);
    assert(isnan(f));
    
    // a.
    assert(myisnan(f));

    // b.
    assert(myisnan2(f));
    
    // c.
    f = INFINITY;
    assert(f == INFINITY);

    // d.
    f = 3.14 + INFINITY;
    assert(f == INFINITY);

    return 0;
}