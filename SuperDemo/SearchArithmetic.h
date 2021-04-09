//
//  SearchArithmetic.h
//  SuperDemo
//
//  Created by iOS on 2021/4/7.
//  查找算法

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchArithmetic : NSObject

// 查找第一个 等于 = taget 值得 元素
int searchFirstEqualNumber(int arr[_Nonnull], int taget, int n){
    
    int low = 0 ;
    int high = n - 1 ;
    while(low <= high){
        int mid = low + ((high - low) >> 1);
        if(taget > arr[mid]){
            low = mid + 1;
        }else if (taget < arr[mid]){
            high = mid - 1;
        }else{
            if(mid == 0 || arr[mid-1] != taget) return mid;
            high = mid - 1 ;
        }
    }
    
    return -1;
}

// 查找 最后一个 等于 taget 值得 元素
int searchLastEqualNumber(int arr[_Nonnull], int taget, int n){
    
    int low = 0 ;
    int high = n - 1 ;
    while(low <= high){
        int mid = low + ((high - low) >> 1);
        if(taget > arr[mid]){
            low = mid + 1;
        }else if (taget < arr[mid]){
            high = mid - 1;
        }else{
            if(mid == (n-1) || arr[mid+1] != taget) return mid;
            low = mid + 1 ;
        }
    }
    return -1;
}


// 查找 第一个 大于等于 >= taget 值得 元素 [3,6,12,15 ,55, 55,67,87,99]
int searchFirstGreaterNumber(int arr[_Nonnull], int taget, int n){
    //taget = 55;
    int low = 0 ;
    int high = n - 1 ;
    while(low <= high){
        int mid = low + ((high - low) >> 1);
        if(taget > arr[mid]){
            low = mid + 1;
        }else{
            if(mid == 0 || arr[mid - 1] < taget)return mid;
            high = mid - 1 ;
        }
    }
    return -1;
}

// 查找 最后一个 小于等于 <= taget 值得 元素
int searchLastLessNumber(int arr[_Nonnull], int taget, int n){
    
    int low = 0 ;
    int high = n - 1 ;
    while(low <= high){
        int mid = low + ((high - low) >> 1);
        if(taget < arr[mid]){
            high = mid - 1;
        }else{
            if(mid == n - 1 || taget < arr[mid + 1])return mid;
            low = mid + 1 ;
        }
    }
    return -1;
}

//如果有序数组是一个循环有序数组，比如 4，5，6，1，2，3。针对这种情况，如何实现一个求“值等于给定值”的二分查找算法呢？

@end

NS_ASSUME_NONNULL_END
