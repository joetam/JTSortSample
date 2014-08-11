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
    [self quickSort:result lo:0 high:list.count-1];
    return result;
}


NSString* printList(NSMutableArray *list)
{
    NSString *str = @"";
    for (id obj in list) {
        str = [str stringByAppendingString:[NSString stringWithFormat:@" %@", obj]];
    }
    return str;
}


- (void)quickSort:(NSMutableArray *)list lo:(int) lo high:(int) high
{
    if (lo < high) {
        int pivot = partition(list, lo, high);
        [self quickSort:list lo:lo high:pivot-1];
        [self quickSort:list lo:pivot+1 high:high];
    }
}

int partition(NSMutableArray *list, int lo, int high)
{
    int i = lo;
    int j = high;
    
    int count = j - i + 1;
    
    if (count <=1) {
        return i;
    }
    
    int p = i+(floor)((j-i)/2);
    NSNumber *pNum = list[p];
    
    // move the pivot to end of array and exclude from the partition
    // ...but only if the list has more than two elements (otherwise we are swapping unnecessarily and also the j-1 below
    // causes us to skip the while loop which means we are doing two swaps and not checking the order
    if (count > 2) {
        swap2(list, p, high);
        j = j-1;
    }
    
    // partition
    while (i < j) {
        while ([list[i] compare:pNum] == NSOrderedAscending) {
            i++;
        }
        while (([list[j] compare:pNum] == NSOrderedDescending ||
            [list[j] compare:pNum] == NSOrderedSame) && j > 0) {
            j--;
        }
        if (i < j) {
            swap2(list, i, j);
        }
    }
    // put pivot back
    if (count > 2) swap2(list,i,high);
    return i;
}

void swap2(NSMutableArray* list, int i, int j)
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
