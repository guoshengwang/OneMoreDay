//
//  StringReverse.h
//  SuperDemo
//
//  Created by 哈巴 on 2019/9/17.
//

#import <Foundation/Foundation.h>

@interface StringReverse : NSObject

//字符串反转 OC 实现
+ (NSString *)stringReverse:(NSString *)str;

void char_reverse(char *str);

void feibonach(int n);

//选择排序
void select_sort(int a[_Nullable], int len);

//冒泡
void bubbleSort(int a[], int len);

//合并排序
void merge_sort(int a[], int temp[], int left, int right);

void MergeSort(int sourceArr[], int tempArr[], int startIndex, int endIndex);

//希尔排序
void shell_sort(int arr[_Nonnull], int len);

//插入排序
void insert_sort(int arr[_Nullable], int len);

//快速排序
void quick_sort(int arr[_Nullable], int low, int high);

//堆排序
void HeapSort(int a[_Nullable], int n);

//KMP 算法
int kmp(char * _Nullable str , char * _Nullable subStr, int next[_Nullable]);

//打印输出
void printArray(int a[_Nonnull], int len);
@end

