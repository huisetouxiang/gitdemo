//
//  PersonOne.m
//  DemoGCD
//
//  Created by 谢意强 on 2018/3/20.
//  Copyright © 2018年 谢意强. All rights reserved.
//

#import "PersonOne.h"
#import <objc/runtime.h>
#import "PersonTwo.h"


@implementation PersonOne
-(void)run
{
    NSLog(@"my is running");
    
}

//这个过程就是动态绑定
+(BOOL)resolveClassMethod:(SEL)sel
{
    NSLog(@"sel == %@",NSStringFromSelector(sel));
    if(sel == @selector(run))
    {
        class_addMethod(self, sel, (IMP)newRun, "v@:@:");
    }
    
    return YES;
    
}

void newRun(id self, SEL sel)
{
    NSLog(@"teacher is running");
    
}

//消息重定向的过程
-(id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"sel = %@",NSStringFromSelector(aSelector));
    return [PersonTwo new];
    
    
    
}
@end
