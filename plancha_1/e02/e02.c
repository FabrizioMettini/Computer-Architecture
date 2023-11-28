#include <assert.h>
#include <stdio.h>

int is_one(long n, int b) 
{
    return (n >> b) & 1;
}

int main() 
{
    assert(is_one(5, 0));
    assert(is_one(5, 1) == 0);
    assert(is_one(5, 2));
    return 0;
}