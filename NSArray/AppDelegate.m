//
//  AppDelegate.m
//  NSArray
//
//  Created by Slava on 4/15/18.
//  Copyright © 2018 Slava. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    // 1 Create NSArray, containing several strings, using literal declaration.
     NSArray *array = @[@"one", @"two", @"three", @"four"];
    
    // 2 Create mutable array from piviously created NSArray.
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
    
    
    // 3 Create an empty array and obtain its first and last element in a safe way.
    NSArray *emptyArray = [NSArray array];
    id firstObject = [emptyArray firstObject];
    id lastObject = [emptyArray lastObject];
    
    
    // 4 Get its shallow copy and real deep copy.
    
    NSArray *stringArray = [NSArray arrayWithObjects:@"0" ,@"1" ,@"2" ,@"3" ,@"4" ,@"5" ,@"6" ,@"7" , @"8" ,@"9" ,@"10" ,@"11" ,@"12" ,@"13" ,@"14" ,@"15" ,@"16" ,@"17" ,@"18" ,@"19" , nil];
    
    NSArray *shallowCopy = [stringArray copyWithZone:nil];
    
    NSArray *deepCopy = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:stringArray] ];
    
    // 5 Iterate over array and obtain item at index 13. Print an item.
    int i = 0;
    for (NSString* string in stringArray) {
        if (i == 13) {
            NSLog(@"%@", string);
        }
        i++;
    }
    
    [stringArray enumerateObjectsUsingBlock:^(NSString *string, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 13){
            NSLog(@"%@",string);
        }
       // *stop = YES;
    }];
    
    // 6 Make array mutable. Add two new entries to the end of the array, add an entry to the beginning of the array. Iterate over an array and remove item at index 5.
    
    NSMutableArray *newMutableArray = [stringArray mutableCopy];
    [newMutableArray addObject:@"20"];
    [newMutableArray addObject:@"21"];
    [newMutableArray insertObject:@"start" atIndex:0];
    [newMutableArray enumerateObjectsUsingBlock:^(NSString *string, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 5) {
            [newMutableArray removeObject:string];
        }
    }];
    
   
    // 7 Create new array of mixed numbers. Sort it in an ascending and descending order.
    
    NSArray *valueArray = @[@1,@8,@23,@18,@2,@6,@54,@3,@12,@9,@17,@4];
    
    NSArray *sortValueArray = [valueArray sortedArrayUsingSelector:@selector(compare:)];
   
    
    
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
