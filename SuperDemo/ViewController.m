//
//  ViewController.m
//  SuperDemo
//
//  Created by 哈巴 on 2019/9/16.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"I am real viewDidLoad");
    
    // 死锁
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        [self doSomething];
//    });
    
//    [self concurrentExcute];

    //异步并发 开启子线程 并 分配到 全局并行队列
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"..1");
//        NSThread *currentThread = [NSThread currentThread];
        
        [self performSelector:@selector(printLog)
                   withObject:nil
                   afterDelay:0];// 依赖当前线程的 runLoop ,未开启 则不会执行
        
        NSLog(@"..3");
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"..4");
    });
    
    //RunLoop : 是一个通过 内部循环 来处理 事件/消息的 一种机制.
    
    //怎样保证子线程数据回来更新 UI 的 操作 不会打断当前的滑动事件?
}

+ (void)load{
    
    Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method DJViewdidLoad = class_getInstanceMethod(self, @selector(DJViewdidLoad));
    
    method_exchangeImplementations(viewDidLoad, DJViewdidLoad);
}

- (void)DJViewdidLoad{
    NSLog(@"I just be a DJViewdidLoad");
    [self DJViewdidLoad];
}

- (void)printLog{NSLog(@"..2");}


- (void)doSomething{
    
    NSLog(@"doSomething~");
    
}

//同步并发
- (void)concurrentExcute{
    NSLog(@"--1");
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_sync(globalQueue, ^{ // 同步 则在当前线程执行
        NSLog(@"--2");
        dispatch_sync(globalQueue, ^{
            NSLog(@"--3");
        });
    
        NSLog(@"--4");
    });
    NSLog(@"--5");
}




@end
