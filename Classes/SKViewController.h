//
//  SKViewController.h
//  TestSort
//
//  Created by Joe Tam on 8/3/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListSort.h"

@interface SKViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (IBAction)doSort:(id)sender;
- (IBAction)doGenerateRandomInput:(id)sender;

@property (nonatomic, strong) NSObject<ListSortDelegate> *sortMethod;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UITextField *inputTextField;
@property (nonatomic, strong) IBOutlet UIButton *randomButton;
@property (nonatomic, strong) IBOutlet UIButton *sortButton;
@property (nonatomic, strong) IBOutlet UISegmentedControl *segmentedControl;

@end
