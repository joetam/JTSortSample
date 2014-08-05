//
//  SelectionSort.m
//  JTSortSample
//
//  Created by Joe Tam on 8/4/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import "SelectionSort.h"

@implementation SelectionSort

- (NSArray *)sort:(NSArray *)list
{
    NSMutableArray *result = [NSMutableArray arrayWithArray:list];
    
    for (int i = 0; i < result.count; i++) {
        int minIndex = i;
        for (int j = i; j < result.count; j++) {
            if ([[result objectAtIndex:j] compare:[result objectAtIndex:minIndex]] == NSOrderedAscending) {
                minIndex = j;
            }
        }
        // swap numbers at i and minIndex
        [self swapValuesInArray:result atIndex:i andIndex:minIndex];
    }
    
    return result;
}

- (void)swapValuesInArray:(NSMutableArray *) array atIndex:(NSInteger) firstIndex andIndex:(NSInteger) secondIndex
{
    id objAtFirstIndex = [array objectAtIndex:firstIndex];
    [array setObject:[array objectAtIndex:secondIndex] atIndexedSubscript:firstIndex];
    [array setObject:objAtFirstIndex atIndexedSubscript:secondIndex];
}

- (NSString *)sortMethodName
{
    return @"Selection";
}

@end
