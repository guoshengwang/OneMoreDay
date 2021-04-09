//
//  ListReverse.m
//  SuperDemo
//
//  Created by 哈巴 on 2019/9/17.
//

#import "ListReverse.h"

@implementation ListReverse

struct Node* reverseList_o(struct Node* head)
{
    //p 指向原链表头结点
    struct Node* p = head ;
    
    //翻转后链表的头部
    struct Node* newHead = NULL ;
    
    while (p != NULL) {
        
        //记录当前要被反转的节点
        struct Node* temp = p ;
        //记录下一个反转节点
        p = p->next ;
        //
        temp->next = newHead;
        
        //表头指向新表的
        newHead = temp ;
    }
    
    //反转链表的头结点
    return newHead ;
}

//新建长度为 4 的链表
struct Node* createList(int n){
    
    //头节点
    struct Node* head = NULL ;
    //指向 当前表尾节点
    struct Node* cur = NULL ;
    
    for (int i = 1; i < n; i++) {
        struct Node* node = malloc(sizeof(struct Node));
        node->next = NULL ;  //新节点的 next 指针 做显性初始化
        node->data = i;
        
        //空表
        if (head == NULL) {
            head = node ;
        }else{
            //新节点挂在 当前cur所指 节点 后面
            cur->next = node ;
        }
        //设置当前节点 为 新节点
        cur = node ;
    }
    
    return head ;
}


void printList(struct Node* head){
    struct Node* temp = head ;
    while (temp != NULL) {
        printf("node data is %d \n",temp->data);
        temp = temp->next ;
    }
}

//链表反转
struct Node* reverseList1(struct Node* head){
    
    //新*表表头
    struct Node* newHead = NULL ;
    
    //p 指向当前节点
    struct Node* p = head ;
    
    while (p != NULL) {
        
       struct Node* temp = p->next ;
        //头插法 , p 为新表表头
        p->next = newHead ;
        
        //newHead 前移 指向新表头
        newHead = p ;
        
        p = temp ;
    }
    return newHead ;
}

struct Node* reverseList(struct Node* head){
    
    struct Node *newHead = NULL ;
    
    struct Node *cur = head;
    
    while (cur != NULL) {
        struct Node *temp = cur->next;
        cur->next = newHead ;
        newHead = cur;
        cur = temp ;
    }
    return newHead;
}

//哨兵可以理解为它可以减少特殊情况的判断，比如判空，比如判越界，比如减少链表插入删除中对空链表的判断，比如例子中对i越界的判断。
//空与越界可以认为是小概率情况，所以代码每一次操作都走一遍判断，在大部分情况下都会是多余的。
//哨兵的巧妙就是提前将这种情况去除，比如给一个哨兵结点，以及将key赋值给数组末元素，让数组遍历不用判断越界也可以因为相等停下来。
//使用哨兵的指导思想应该是将小概率需要的判断先提前扼杀，比如提前给他一个值让他不为null，或者提前预设值，或者多态的时候提前给个空实现，然后在每一次操作中不必再判断以增加效率。

//1.单链表反转
//2.链表中环的检测
//3.两个有序的链表合并
//4.删除链表倒数第 n 个结点
//5.求链表的中间结点

bool existCircle(struct Node *head){ //检测链表环
    
    struct Node *fast = head;
    struct Node *slow = head;
    
    while (fast != NULL && fast->next != NULL) {
        slow = slow->next;
        fast = fast->next->next;
        
        if (slow == fast) {
            return true;
        }
    }
    
    return false;
}

//删除倒数第 n 个节点
struct Node * deleteLastN(struct Node *head, int n){
        
    if (n < 1 || head == NULL) {
        return head;
    }
    
    struct Node *p = malloc(sizeof(struct Node));
    p->next = head;
    struct Node *slow = p ;
    struct Node *fast = p ;
    
    for (int i = 0; i < n; i++) { //快指针先走 n 步  剩下 (Len - n) 步 同时走
        if (fast != NULL) {
            fast = fast->next ;
        }
    }
    
    while (fast != NULL && fast->next != NULL) {
        fast = fast->next;
        slow = slow->next; // 移动完成后 慢指针 指在 (Len - n) 节点位置上  他的下一个节点就是倒数第n个节点 ,也就是要删除的节点
    }
    
    slow->next = slow->next->next ; //删除倒数第 n 个节点
    
    return head;
}

//寻找链表中间节点
struct Node * getMiddleNode(struct Node *head){
    struct Node *fast = head;
    struct Node *slow = head;
    // && fast->next->next != NULL  // 偶数个节点 , 中节点 返回中间第一个
    while (fast != NULL && fast->next != NULL) { // 偶数个节点 , 中节点 返回中间第二个
        fast = fast->next->next;
        slow = slow->next ;
    }
    
    return slow;
}

//合并 连个 有序链表
struct Node* mergeTwoSortedList(struct Node *head1, struct Node *head2){
    
    struct Node *newHead = malloc(sizeof(struct Node));
    
    struct Node *newCur = newHead;
    
    while (head1 != NULL && head2 != NULL) {
        
        if (head1->data <= head2->data) {
            
            while (head1 != NULL && head1->data <= head2->data) {
                newCur->next = head1 ;
                head1 = head1->next;
                newCur = newCur->next;
            }
            
        }else{
            
            while (head2 != NULL && head1->data > head2->data) {
                newCur->next = head2;
                head2 = head2->next;
                newCur = newCur->next;
            }
        }
    }
    
    if (head1 != NULL) {
        newCur->next = head1;
    }
    
    if (head2 != NULL) {
        newCur->next = head2;
    }
    
    return newHead->next;  // 新链表地址 即为第一个节点地址
}
@end
