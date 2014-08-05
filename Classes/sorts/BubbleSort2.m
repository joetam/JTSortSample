//
//  BubbleSort2.m
//  TestSort
//
//  Created by Joe Tam on 8/3/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import "BubbleSort2.h"

@interface BubbleSort2()

@property (nonatomic, strong) NSMutableArray *resultArray;
@end

@implementation BubbleSort2

- (NSArray *)sort:(NSArray *)list
{
    NSMutableArray *mutableList = [NSMutableArray arrayWithArray:list];
    for (int i = 0; i < mutableList.count; i++) {
        for (int j = i; j < mutableList.count; j++) {
            if ([[mutableList objectAtIndex:j] compare:[mutableList objectAtIndex:i]] == NSOrderedAscending) {
                [self swapObjectsAtIndexes:mutableList firstIndex:i secondIndex:j];
            }
        }
    }
    return mutableList;
}

- (void)swapObjectsAtIndexes:(NSMutableArray *) list firstIndex:(NSInteger) firstIndex secondIndex:(NSInteger) secondIndex
{
    id objAtFirstIndex = [list objectAtIndex:firstIndex];
    [list setObject:[list objectAtIndex:secondIndex] atIndexedSubscript:firstIndex];
    [list setObject:objAtFirstIndex atIndexedSubscript:secondIndex];
}

- (NSString *)sortMethodName
{
    return @"Bubble 2";
}

@end
