#include <stdio.h>

unsigned int nth_power_of_two(unsigned int n);

int main() {
    for (unsigned int i = 0; i <= 31; i++) {
        printf("The 2^{%u} = %u\n", i, nth_power_of_two(i));
    }
}
