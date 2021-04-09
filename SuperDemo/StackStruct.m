//
//  StackStruct.m
//  SuperDemo
//
//  Created by 哈巴 on 2019/9/18.
//

#import "StackStruct.h"
#import <objc/runtime.h>

@implementation StackStruct

+ (void)load{
    
    Method test = class_getInstanceMethod(self, @selector(test));
    Method swizzTest = class_getInstanceMethod(self, @selector(swizzTest));
    
    method_exchangeImplementations(test, swizzTest);
    
}

//消息转发第一步 可以动态添加方法
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    if (sel == @selector(test)) {
        
        NSLog(@"resolveInstanceMethod:");
        
        BOOL result = class_addMethod(self, @selector(methodNoImplementation), runtimeAddMethod, "v@:");
        
        return result;
    }else{
        return [super resolveInstanceMethod:sel];
    }
}

//消息转发第二步, 可以指定一个对象 来调用这个方法
- (id)forwardingTargetForSelector:(SEL)aSelector{
    
    return nil ;
    
}

//消息转发第 3 步
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    NSMethodSignature *nature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    return nature ;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    
}

void runtimeAddMethod(void){
    
    NSLog(@"runtime add method ");
    
}

- (void)test{
    
    NSLog(@"test method");
    
}

- (void)swizzTest{
    
    [self swizzTest];
    NSLog(@"swizzTest method");
}

@end
