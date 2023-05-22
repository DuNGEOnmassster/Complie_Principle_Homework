#include "add.h"
#include<stdio.h>

int main()
{
    int x = 0, y1, i, j;
    
    // 观察两种赋值方法编译后的区别
    y1 = (x+2) * 2;
    // 定义整型变量y2并附带初始赋值
    int y2 = (x+2) * 2;

    // 观察中英文注释的编译的区别（AscII）
    // print the values of y1 and y2
    printf("y1 = %d, y2 = %d\n", y1, y2);

    for(i = 0; i <= y1; i++) // for loop
    {
        j = i*3-1;

        if((j >= y2) || (j < i))
        {
            printf("Dangerous! Not process\n");
        }
        else{
            printf("Normal Status. With j = %d\n", j);
        }
    }

    i = 0;

    while(i <= y1) // while loop
    {
        int therehold = 2;
        if(i >= therehold)
        {
            printf("Reach boundary, break loop.\n");
            break;
        }
        else{
            printf("Within boundary, now count i as %d\n", i);
        }

        i++;
    }

    return 0;
}