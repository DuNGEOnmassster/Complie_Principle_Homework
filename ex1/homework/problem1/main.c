#include<stdio.h>
#include"header.h"

int global_var1 = 5;
int global_var2;

int main(){
    int local_var1 = 10;
    static int local_var2 = 20;
    local_var1 = 5;

    f1();
    f2();

    if (local_var1 == 5){
        printf("local var1 is still 5\n");
    }
    else{
        printf("local var1 changed, now is %d\n", local_var1);
    }
    return 0;
}