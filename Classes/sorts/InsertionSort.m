//
//  InsertionSort.m
//  JTSortSample
//
//  Created by Joe Tam on 8/4/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort

// not in-place
//- (NSArray *)sort:(NSArray *)list
//{
//    NSMutableArray *result = [[NSMutableArray alloc] init];
//    
//    for (NSNumber *num in list) {
//        int i = result.count;
//        while (i > 0 && [num compare:[result objectAtIndex:i-1]] == NSOrderedAscending) {
//            i--;
//        }
//        [result insertObject:num atIndex:i];
//    }
//    return result;
//}

// in-place implementation
- (NSArray *)sort:(NSArray *)list
{
    NSMutableArray *result = [NSMutableArray arrayWithArray:list];
    
    for (int i = 0; i < result.count; i++) {
        int j = i;
        NSNumber *minValue = result[j];
        while (j > 0 && [result[j-1] compare: minValue] == NSOrderedDescending) {
            swap(result, j, j-1);
            j--;
        }
    }
    
    return result;
}

void swap(NSMutableArray *array, int firstIndex, int secondIndex)
{
    id firstObj = [array objectAtIndex:firstIndex];
    [array setObject:[array objectAtIndex:secondIndex] atIndexedSubscript:firstIndex];
    [array setObject:firstObj atIndexedSubscript:secondIndex];
}

- (NSString *)sortMethodName
{
    return @"Insertion";
}

@end
