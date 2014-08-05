//
//  InsertionSort.m
//  JTSortSample
//
//  Created by Joe Tam on 8/4/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort

- (NSArray *)sort:(NSArray *)list
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSNumber *num in list) {
        int i = result.count;
        while (i > 0 && [num compare:[result objectAtIndex:i-1]] == NSOrderedAscending) {
            i--;
        }
//        if (i < 0) i = 0;
        [result insertObject:num atIndex:i];
    }
    return result;
}

- (NSString *)sortMethodName
{
    return @"Insertion";
}

@end
