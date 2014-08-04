//
//  InsertionSort.m
//  TestSort
//
//  Created by Joe Tam on 8/3/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import "InsertionSort.h"

@interface InsertionSort()

@property (nonatomic, strong) NSMutableArray *resultArray;
@end

@implementation InsertionSort

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
    return @"Insertion Sort";
}

@end
