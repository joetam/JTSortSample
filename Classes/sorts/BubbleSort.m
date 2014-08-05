//
//  BubbleSort.m
//  TestSort
//
//  Created by Joe Tam on 8/3/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort

- (NSArray *)sort:(NSArray *)list
{
    NSMutableArray *mutableList = [NSMutableArray arrayWithArray:list];
    for (int i = 0; i < mutableList.count; i++) {
        for (int j = 0; j < mutableList.count - i; j++) {
            if (j + 1 < mutableList.count && [[mutableList objectAtIndex:j] compare: [mutableList objectAtIndex:j+1]] == NSOrderedDescending) {
            [self swap:mutableList atFirstIndex:j secondIndex:j+1];
            }
        }
    }
    return mutableList;
}

- (void) swap:(NSMutableArray*) array atFirstIndex:(NSInteger) firstIndex secondIndex:(NSInteger) secondIndex
{
    id objAtFirstIndex = [array objectAtIndex:firstIndex];
    [array setObject:[array objectAtIndex:secondIndex] atIndexedSubscript:firstIndex];
    [array setObject:objAtFirstIndex atIndexedSubscript:secondIndex];
}

- (NSString *)sortMethodName
{
    return @"Bubble 1";
}

@end
