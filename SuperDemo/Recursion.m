//
//  Recursion.m
//  SuperDemo
//
//  Created by iOS on 2021/3/30.
//

#import "Recursion.h"

@implementation Recursion

// 递归三条件 : 1. 可拆分一个或多个子问题 ; 2.子问题除了数据规模不同,解决思路一致; 3.存在终止条件;
// 递归优劣势 : 优 : 代码,简洁高效(适用数据规模小) ; 劣势 : 1.存在堆栈溢出风险; 2.空间复杂度高; 3.过多函数调用造成的时间成本; 4.存在重复计算的问题

//解决思路:
/*
    1. 设置最大深度条件; 全局变量记录调用深度;
    2.
    3.
    4. 散列表记录已计算项 (n,f(n));  key = n, value = f(n)
 */

//爬楼梯问题 : 每次 走一步或两步 ,  走完 n阶 楼梯 有几种走法
//递归写法
int climpStairs(int n){
    if(n==1) return 1;
    if (n==2) return 2;
    return climpStairs(n-1) + climpStairs(n-2);
}

//迭代循环写法
int climpStairsLoop(int n){
    if(n==1) return 1;
    if (n==2) return 2;
    int cur = 0 , pre = 2, prePre = 1;
    
    for (int i = 3; i <= n; i ++) {
        cur = pre + prePre;
        prePre = pre;
        pre = cur;
    }
    return cur;
}



@end
