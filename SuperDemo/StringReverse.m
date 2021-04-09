//
//  StringReverse.m
//  SuperDemo
//
//  Created by 哈巴 on 2019/9/17.
//

#import "StringReverse.h"

@implementation StringReverse

+ (NSString *)stringReverse:(NSString *)str{
    NSString *string = @"";
    int l = (int)[str length] - 1;
    for(int i = l; i > -1 ; i--){
        unichar a = [str characterAtIndex:i];
        string = [string stringByAppendingString:[NSString stringWithCharacters:&a length:1]];
        
    }
    return string ;
}

//- (NSMutableString *)str{
//    return @"";
//}

int kmp(char *str , char *subStr, int next[]){
    
    get_next(subStr, next);
    printArray(next, 11);
    int i = 0 , j = 0 ;
    int len_s = (int)strlen(str);
    int len_sub = (int)strlen(subStr) ;
    
    while ( i < len_s && j < len_sub) {

        if (j == -1 || str[i] == subStr[j]) {

            i ++ ;
            j ++ ;
        }else{

            j = next[j] ;

        }
    }

    if (j == strlen(subStr)) { //匹配成功
        return i - j ;
    }
    
    return -1 ;
}

void get_next(char *subStr , int next[]){
    
    int i = 0, j = -1 ;
    next[0] = -1;
    
    while ( i < strlen(subStr) - 1) {
        
        if(j == -1 || subStr[i] == subStr[j]) {
            
            i ++ ;
            j ++ ;
            
            if (subStr[i] == subStr[j]) {
                next[i] = next[j];
            }else{
                next[i] = j ;
            }
            
        }else{
            j = next[j] ;
        }
    }
    
}

//字符串反转
void char_reverse(char *str){
//    strlen(str)
    //字符数组头指针
    char* begin = str ;
    //字符数组尾指针
    char* end = begin + strlen(str) - 1;
    //每次比较 交换元素  头指针后移, 尾指针前移 , 两者相遇则反转结束.
    while (begin < end) {
        char temp = *begin ;
        *begin = *end;
        *end = temp ;
        begin ++ ;
        end -- ;
    }
}

//斐波那契数列
void feibonach(int n){

    int t1 = 0, t2 = 1, temp = 0;
//    temp = t1 + t2 ;
    while (temp <= n) {
        printf("%d, ",temp);
        
        t1 = t2 ;
        t2 = temp ;
        temp = t1 + t2 ;
    }
    printf("end \n");
}

//
void feibonaqi(int n){
    int t1 = 0, t2 = 1 , temp = 0 ;
    
    while (temp <= n) {
        printf("%d, ",temp);
        
        t1 = t2 ;
        t2 = temp ;
        temp = t1 + t2 ;
    }
}

void Merge(int sourceArr[],int tempArr[], int startIndex, int midIndex, int endIndex)
{
    int i = startIndex, j=midIndex+1, k = startIndex;
    while(i!=midIndex+1 && j!=endIndex+1)
    {
        if(sourceArr[i] > sourceArr[j])
            tempArr[k++] = sourceArr[j++];
        else
            tempArr[k++] = sourceArr[i++];
    }
    while(i != midIndex+1)
        tempArr[k++] = sourceArr[i++];
    while(j != endIndex+1)
        tempArr[k++] = sourceArr[j++];
    for(i=startIndex; i<=endIndex; i++)
        sourceArr[i] = tempArr[i];
}

//内部使用递归
void MergeSort(int sourceArr[], int tempArr[], int startIndex, int endIndex)
{
    int midIndex;
    if(startIndex < endIndex)
    {
        midIndex = startIndex + (endIndex-startIndex) / 2;//避免溢出int
        MergeSort(sourceArr, tempArr, startIndex, midIndex);
        MergeSort(sourceArr, tempArr, midIndex+1, endIndex);
        Merge(sourceArr, tempArr, startIndex, midIndex, endIndex);
    }
}

//归并排序
void merge_sort(int a[], int temp[], int left, int right){

    if (left < right) {
       int mid = (right + left) / 2 ;
        merge_sort(a, temp, left, mid);
        merge_sort(a, temp, mid + 1,right);
        merge(a, temp, left, mid, right);
    }
}
//
void merge(int a[], int temp[], int left, int mid, int right){


    int i = left , j = mid + 1 ;
    int k = left ;  // remeber

    while (i <= mid && j <= right) {
        if (a[i] < a[j]) {
            temp[k ++] = a[i ++];
        }else{
            temp[k ++] = a[j ++];
        }
    }

    while (i <= mid) {
        temp[k ++] = a[i ++];
    }

    while (j <= right) {
        temp[k ++] = a[j ++];
    }

    for (int s = 0; s <= right; s ++) {
        a[s] = temp[s];
    }

}

//堆排序
void AdjustHeap(int a[], int i, int n)
{
    int t = i;
    int j = i * 2 + 1; //j指向i的左孩子节点
    while (j <= n)
    {
        if (j + 1 <= n && a[j] < a[j + 1]) j++; //如果右子树大于它的左子树，则j改为指向右子树
        if (a[t] < a[j]){   //子节点比父节点大,继续调整
            
            int temp = a[t] ;
            a[t] = a[j];
            a[j] = temp ;
            
            j = j * 2 + 1; //递归遍历孩子节点
        }else{
            break ;
        }
    }

}

void HeapSort(int a[], int n)
{
    //构建堆
    for (int i = n / 2 - 1; i >= 0; i--) //从第一个非叶子节点开始，向上调整堆直至调整至堆顶
        AdjustHeap(a, i, n - 1 );
    //堆排序
    for (int i = n - 1; i > 0; i--) //每次选取堆顶元素置入有序区
    {
        int temp = a[0];
        a[0] = a[i];
        a[i] = temp;
        AdjustHeap(a, 0, i - 1); //调整堆
    }
    printArray(a, n);
}

//选择排序
void select_sort(int a[], int len){
    
    for (int i = 0; i < len; i ++) {
        int k = i ;
        for (int j = k + 1; j < len; j ++) {
            if (a[k] > a[j]) {
                k = j ;
            }
        }
        if ( k != i) {
            int temp = a[i];
            a[i] = a[k];
            a[k] = temp;
        }
    }
    printArray(a, len);
}

//冒泡排序
void bubbleSort(int a[], int len){
    for (int i = 0; i < len - 1; i ++) { // 外层循环 比较趟数
        for (int j = 0; j < len - i - 1; j ++) { //内层循环 每趟比较次数
            if (a[j] < a[j + 1]) {
                int temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
                printArray(a, len);
            }
        }
    }
    printf("bubbleSort :");
    printArray(a, len);
}

//插入排序
void insert_sort(int arr[], int len){
    //34,23,13,11,55,84,2,30,99,10
    //55,34,23,13,11,84,2,30,99,10  i = 4
    
    for (int i = 1; i < len; i ++) { //从第二个元素开始
        int j = i;
        int temp = arr[j];
        while (j > 0 && arr[j - 1] < temp) {
            arr[j] = arr[j - 1];
            j -- ; // 从右往左 <--
        }
        arr[j] = temp ;
    }
    printArray(arr, len);
    
//    for (int i=1; i < len; i++) {
//        int j = i ;
//        int temp = arr[j];
//        while (j > 0 && arr[j - 1] < temp) {
//            arr[j] = arr[j-1];
//            j --;
//        }
//        arr[j] = temp ;
//    }
}

/*
 希尔排序
 a：待排序元素集合
 n：集合中元素的个数
 步骤：
 （1）将待排序集合分成k个组，且每个组元素下标的差值为k
 （2）对每个组的元素进行直接插入排序
 （3）减少组的规模（这里采用折半减少的方式），重复（1）（2）直至规模为最小值1
*/
//希尔排序
void shell_sort1(int arr[], int len){
    
    int k = len / 2 ;
    while (k > 0) {
        for (int i = 0; i < k; i ++ ) {
            
            for (int j = i + k; j < len; j += 1) {
                int temp = arr[j] ;
                int r = j ;
                while (r > 0 && arr[r - 1] > temp) {
                    arr[r] = arr[r - 1];
                    r -= 1 ;
                }
                arr[r] = temp ;
            }
        }
        k = k / 2 ;
    }
    printArray(arr, len);
}

void shell_sort(int arr[], int len){
    
    int k = len / 2 ;
    while (k > 0) {
        for (int i = 0; i < k; i ++) {
            
            for (int j = i + k; j < len; j ++) {
                
                int r = j ;
                int temp = arr[r];
                while (j > 0 && arr[j - 1] > temp) {
                    arr[j] = arr[j - 1];
                    j -- ;
                }
                arr[j] = temp ;
            }
            
        }
        k = k / 2 ;
    }
}
//快排(递归法):  
void quick_sort(int arr[], int low, int high){
    int key = arr[low] ;
    int i = low , j = high;
    
    if (low < high) {
        //34,23,13,11,55,84,2,30,99,10
        while (i < j) {
            
            //从右往左扫描 找个第一个 小于 key 的位置
            while (i < j && arr[j] >= key) {
                j-- ;
            }
            arr[i] = arr[j];
            //10,23,13,11,55,84,2,30,99,10  i = 0 j = 9
            //10,23,13,11,30,84,2,30,99,55  i = 4 j = 7
            //10,23,13,11,30,2,2,84,99,55  i = 5 j = 6
//            printArray(arr,10);
            
            //从左往右扫描 找到第一个打大于 key 的位置
            while (i < j && key >= arr[i]) {
                i ++ ;
            }
            arr[j] = arr[i];
            //10,23,13,11,55,84,2,30,99,55  i = 4 j = 9
            //10,23,13,11,30,84,2,84,99,55  i = 5 j = 7
            //10,23,13,11,30,2,2,84,99,55  i = 6 j = 6
//            printArray(arr,10);
        }
        
        arr[i] = key ;
        //10,23,13,11,30,2,34,84,99,55  i = 6 j = 6
        printArray(arr,10);
        quick_sort(arr, low, i - 1 );
        quick_sort(arr, i + 1 , high);
    }
}
void quick_sort1(int arr[], int low, int high){
    
    int i = low , j = high , key = arr[low];
    
    if (low < high) {
        
        while (i < j) {
            
            while (i < j && arr[j] >= key) {
                j -- ;
            }
            arr[i] = arr[j];
            
            while (i < j && arr[i] <= key) {
                i ++ ;
            }
            arr[j] = arr[i];
        }
        
        arr[i] = key ;
        quick_sort1(arr, low, i);
        quick_sort1(arr, i + 1, high);
    }
}

void printArray(int a[], int len){
    printf("arr -> :");
    for (int i = 0; i < len; i++) {
        printf("%d, ",a[i]);
    }
    printf(" \n");
}


void quick_sort2(int arr[_Nullable], int low, int high){
    
    int i = low , j = high , key = arr[low];
    
    if (low < high) {
        
        while (i < j) {
            
            while (i < j && arr[j] <= key) {
               j -- ;
            }
            arr[i] = arr[j] ;
//            printArray(arr, 10);
            while (i < j && arr[i] >= key) {
                i ++ ;
            }
            arr[j] = arr[i] ;
//            printArray(arr, 10);
        }
        
        arr[j] = key ;
//        printArray(arr, 10);
        quick_sort2(arr, low, j);
        quick_sort2(arr, j + 1, high);
    }
    
}
@end
