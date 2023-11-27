#include <assert.h>

int bruteforce2(const char *S, const char *s, unsigned lS, unsigned ls);

int main() 
{
    char s1[] = "abcabcdabc";
    char t1[] = "abcd";
    assert(bruteforce2(s1, t1, 10, 4) == 3);

    char s2[] = "123abcd";
    char t2[] = "az";
    assert(bruteforce2(s2, t2, 7, 2) == -1);

    return 0;
}
