//
//  QuickSortTest.m
//  JTSortSample
//
//  Created by Joe Tam on 8/9/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuickSort.h"

@interface QuickSortTest : XCTestCase

@property (nonatomic, strong) NSMutableArray *partitionInput;
@property (nonatomic, strong) NSMutableArray *sortInput;

@end

@implementation QuickSortTest

- (void)setUp
{
    [super setUp];
    self.partitionInput = [[NSMutableArray alloc] init];
    self.sortInput = [[NSMutableArray alloc] init];
    for (int i = 0; i < 500; i++) {
        NSNumber *randNum = [NSNumber numberWithInt:rand() % 100];
        [self.partitionInput addObject:randNum];
    }
    
//    self.partitionInput = [NSMutableArray arrayWithObjects:@1,@10,@13,@15,@5,@2,@100,@0,@12, nil];
    
    
//    self.partitionInput = [NSMutableArray arrayWithObjects:@1,@10,@13,@15,@12,@2,@100,@0,@5, nil];

//    self.partitionInput = [NSMutableArray arrayWithObjects:@1,@10,@13,@5,@2,@100,@0,@1, nil];    
    
    for (int i = 0; i < 15; i++) {
        NSNumber *randNum = [NSNumber numberWithInt:rand() % 100];
        [self.sortInput addObject:randNum];
    }
//    self.sortInput = [NSMutableArray arrayWithObjects:@0, @4, nil];
}

- (void)tearDown
{
    [super tearDown];
}

NSString* printList(NSMutableArray *list);

- (void)testPartition
{
    NSLog(@"start %@", printList(self.partitionInput));
    int p = partition(self.partitionInput, 0, self.partitionInput.count-1);
    for (int i = 0; i < p; i++) {
        XCTAssertTrue([self.partitionInput[i] compare:self.partitionInput[p]] == NSOrderedAscending, @"Number %@ found in lower partition with pivot %@ at pivot index %d", self.partitionInput[i], self.partitionInput[p], p);
    }
    for (int i = p; i < self.partitionInput.count; i++) {
        XCTAssertTrue([self.partitionInput[i] compare:self.partitionInput[p]] == NSOrderedDescending ||
                      [self.partitionInput[i] compare:self.partitionInput[p]] == NSOrderedSame, @"Number %@ found in upper partition with pivot %@ at pivot index %d", self.partitionInput[i], self.partitionInput[p], p);
    }
    NSLog(@"final %@", printList(self.partitionInput));
}

- (void)testSort
{
    NSLog(@"%@", printList(self.sortInput));
    NSMutableArray *copiedInput = [[NSMutableArray alloc] initWithArray:self.sortInput copyItems:YES];
    
    QuickSort *quickSort = [[QuickSort alloc] init];

    
    copiedInput = [copiedInput sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    NSArray *sortedArray = [quickSort sort:self.sortInput];
    NSLog(@"%@",     printList(sortedArray));
    NSLog(@"%@", printList(copiedInput));
    
    XCTAssertTrue([copiedInput isEqualToArray:sortedArray], @"NOT EQUAL");
}

@end
