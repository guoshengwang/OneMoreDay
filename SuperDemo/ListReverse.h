//
//  ListReverse.h
//  SuperDemo
//
//  Created by 哈巴 on 2019/9/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//定义一个节点类型
struct Node{
    int data ;
    struct Node *next ;
};

@interface ListReverse : NSObject

//链表反转
struct Node* reverseList(struct Node* head);

//构造链表
struct Node* createList(int n);

//打印(遍历)链表
void printList(struct Node* head);

//合并有序链表
struct Node* mergeTwoSortedList(struct Node *head1, struct Node *head2);

//中间节点
struct Node * getMiddleNode(struct Node *head);

//删除倒数第 n 个节点
struct Node * deleteLastN(struct Node *head, int n);

//链表判 环
bool existCircle(struct Node *head);

@end

NS_ASSUME_NONNULL_END
