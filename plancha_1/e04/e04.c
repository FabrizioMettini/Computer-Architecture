#include <stdio.h>

void rotar(int * a, int * b, int * c){
    *a = *a ^ *b;
    *b = *a ^ *b;
    *a = *a ^ *b;

    *a = *a ^ *c;
    *c = *a ^ *c;
    *a = *a ^ *c;
}

int main(){
    int a;
    int b;
    int c;

    printf("Ingrese a: ");
    scanf("%d",&a);
    printf("Ingrese b: ");
    scanf("%d",&b);
    printf("Ingrese c: ");
    scanf("%d",&c);
    printf("a-> %d, b -> %d, c -> %d\n", a,b,c);
    rotar(&a,&b,&c);
    printf("Se han rotados los valores.\n");
    printf("a-> %d, b -> %d, c -> %d\n", a,b,c);
    return 0;
}
