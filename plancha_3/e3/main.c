#include<stdio.h>
void sum(float *a, float *b, int len);

int main()
{
    float a[5] = { 1.0, 2.0, 3.0, 4.0, 5.0 };
    float b[5] = { 1.1, 2.2, 3.3, 4.4, 5.5 };
    sum(a, b, 5);
    for(int i = 0; i < 5; i++)
    {
        printf("%f ", a[i]);
    }
    printf("\n");
    return 0;
}
