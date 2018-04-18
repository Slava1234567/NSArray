//
//  ViewController.m
//  NSArray
//
//  Created by Slava on 4/15/18.
//  Copyright © 2018 Slava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    
    NSMutableArray *valueArraySort = [NSMutableArray arrayWithObjects:
                                      [NSNumber numberWithInt:1],
                                      [NSNumber numberWithInt:7],
                                      [NSNumber numberWithInt:9],
                                      [NSNumber numberWithInt:2],
                                      [NSNumber numberWithInt:20],
                                      [NSNumber numberWithInt:5] ,nil];
    
    
    NSSortDescriptor *sortDescriptorYes = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES selector:@selector(compare:)];
    
    NSSortDescriptor *sortDescriptorNo = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(compare:)];
    
    
    NSArray *sortYes = [NSArray arrayWithObject:sortDescriptorYes];
    NSArray *sotrNo = [NSArray arrayWithObject:sortDescriptorNo];
    
    [valueArraySort sortUsingDescriptors:sortYes];
    NSLog(@"Значение по возрастанию  %@", valueArraySort);
    
    [valueArraySort sortUsingDescriptors:sotrNo];
    NSLog(@"Значение по возрастанию  %@", valueArraySort);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
