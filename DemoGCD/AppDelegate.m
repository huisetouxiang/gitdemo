//
//  AppDelegate.m
//  DemoGCD
//
//  Created by 谢意强 on 2018/2/1.
//  Copyright © 2018年 谢意强. All rights reserved.
//

#import "AppDelegate.h"
#import <pthread.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [self gcdSort];
    
    [self operationDemo];
    return YES;
}


-(void)gcdSort
{
    
    dispatch_semaphore_t lock =  dispatch_semaphore_create(1);

    pthread_mutex_t mulock ;
    
    pthread_mutex_init(&mulock, NULL);
    
    dispatch_queue_t queue = dispatch_queue_create("com.ibireme.cache.memory", DISPATCH_QUEUE_SERIAL);

//    dispatch_sync(queue, ^{
////        dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
//       // pthread_mutex_lock(&mulock);
//        NSLog(@"1");
//        NSLog(@"%@",[NSThread currentThread]);
//       // pthread_mutex_unlock(&mulock);
////        dispatch_semaphore_signal(lock);
//    });
//
//    dispatch_sync(queue, ^{
////        dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
////
//        NSLog(@"2");
//        NSLog(@"%@",[NSThread currentThread]);
////        dispatch_semaphore_signal(lock);
////
////        pthread_mutex_lock(&mulock);
////        sleep(2);
////        NSLog(@"2");
////        pthread_mutex_unlock(&mulock);
//    });
//
//    dispatch_sync(queue, ^{
////        dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
//        NSLog(@"3");
//         NSLog(@"%@",[NSThread currentThread]);
////        dispatch_semaphore_signal(lock);
////        pthread_mutex_lock(&mulock);
////        NSLog(@"3");
////        pthread_mutex_unlock(&mulock);
//    });
//
//    dispatch_sync(queue, ^{
////        dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
//        NSLog(@"4");
//         NSLog(@"%@",[NSThread currentThread]);
////        dispatch_semaphore_signal(lock);
////        pthread_mutex_lock(&mulock);
////        NSLog(@"4");
////        pthread_mutex_unlock(&mulock);
//    });
//

    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"1");
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"4");
            NSLog(@"%@",[NSThread currentThread]);
        });
        NSLog(@"2");
    });
   
    
}

-(void)operationDemo
{
    NSInvocationOperation *invocation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(goToSchool) object:nil];
    NSInvocationOperation *invocation1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(goToHome) object:nil];
    NSOperationQueue *queue = [NSOperationQueue new];
    queue.maxConcurrentOperationCount = 2;
    
//    [invocation1 addDependency:invocation];
    [invocation1 cancel];
    
    NSOperation *operation = [NSOperation new];

    
    [queue addOperation:invocation];
    [queue addOperation:invocation1];
    
     
    
    
    dispatch_queue_t  myQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_suspend(myQueue);
    dispatch_resume(myQueue);
    
    
}
-(void)goToSchool
{
    sleep(4);
    NSLog(@"1:  %@",[NSThread currentThread]);
    
}
-(void)goToHome
{
    
    NSLog(@"2:  %@",[NSThread currentThread]);
    
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
