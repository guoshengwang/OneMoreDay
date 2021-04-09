//
//  AppDelegate.m
//  SuperDemo
//
//  Created by 哈巴 on 2019/9/16.
//

#import "AppDelegate.h"
#import "ListReverse.h"
#import "StringReverse.h"
#import "StackStruct.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    struct Node *head = createList(9);
    printf("---------------------origin list: \n");
    printList(head);
    
    
    struct Node *head2 = createList(4);
    printf("---------------------head2 list: \n");
    printList(head2);
    
    printf("---------------------: \n");
    
    struct Node *mergeHead = mergeTwoSortedList(head, head2);
    printf("---------------------merge list: \n");
    printList(mergeHead);
    
//    struct Node *newHead = reverseList(head);
//    printf("---------------------reverse list: \n");
//    printList(newHead);
    
    struct Node *midNode = getMiddleNode(head);
    printf("---------------------middle Node: %d \n",midNode->data);
    
    struct Node *faterDelete = deleteLastN(head, 3);
    printf("---------------------delete last N : \n");
    printList(faterDelete);
    
    NSLog(@"print : %@\n",[StringReverse stringReverse:@"wang"]);
    
    char str[] = "123456789";
    char_reverse(str);
    printf("char reserve : %s \n",str);
    
    feibonach(100);
    
    //快排
    //34,23,13,11,55,84,2,30,99,10
//    int arr[10] = {34,23,13,11,55,84,2,30,99,10};
    int arr[10] = {11,22,33,44,55,66,77,88,99,100};
//    quick_sort(arr, 0, 9);
    
    bubbleSort(arr, 10);
    
//    insert_sort(arr, 10);
    
//    shell_sort(arr, 10);
    
//    HeapSort(arr, 10);
    
//    int temp[10];
//    merge_sort(arr, temp, 0, 9);
//    MergeSort(arr, temp, 0, 9);
    
//    select_sort(arr, 10);
    
//    StackStruct *obj = [[StackStruct alloc]init];
//    [obj test];
    
//    int next[50] = {0};
//    int r = kmp("sdosncbcfiacbcaaacbcacbcavmvjdiruwooppddfaa", "aaacbcacbca", next) ;
//    printf("匹配位置 : %d \n",kmp("sdosncbcfiacbcaaacbcacbcavmvjdiruwooppddfaa", "aaacbcacbca", next));
    
    
    
     printArray(arr, 10);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
