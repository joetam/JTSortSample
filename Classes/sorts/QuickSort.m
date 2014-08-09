//
//  QuickSort.m
//  JTSortSample
//
//  Created by Joe Tam on 8/9/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

- (NSArray *)sort:(NSArray *)list
{
    NSMutableArray *result = [NSMutableArray arrayWithArray:list];
    
    return result;
}

void partition(NSMutableArray *list) {
    if (list.count <= 1) return;
    int p = 0;
    int left, right;
    for (left = 1, right = list.count-1; left < right;) {
        if ([list[left] compare:list[p]] == NSOrderedDescending && [list[right] compare:list[p]] == NSOrderedSame) {
            swap(list,left,right);
        }
    }
}

void swap(NSMutableArray* list, int i, int j)
{
    id obj = list[j];
    list[j] = list[i];
    list[i] = obj;
}

- (NSString *)sortMethodName
{
    return @"QuickSort";
}

@end
