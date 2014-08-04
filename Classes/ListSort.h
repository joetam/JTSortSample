//
//  ListSort.h
//  TestSort
//
//  Created by Joe Tam on 8/3/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ListSortDelegate

- (NSArray *)sort:(NSArray*) list;
- (NSString *)sortMethodName;

@end

@interface ListSort : NSObject

@end
