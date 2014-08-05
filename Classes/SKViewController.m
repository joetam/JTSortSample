//
//  SKViewController.m
//  TestSort
//
//  Created by Joe Tam on 8/3/14.
//  Copyright (c) 2014 joe. All rights reserved.
//

#import "SKViewController.h"
#import "BubbleSort.h"
#import "BubbleSort2.h"
#import "InsertionSort.h"

@interface SKViewController ()

@property (nonatomic, strong) NSArray *sortMethods;
@property (nonatomic, strong) NSArray *sortedList;

@end

@implementation SKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sortMethod = [[BubbleSort alloc] init];
    
    // setup sort methods
    BubbleSort *bubbleSort = [[BubbleSort alloc] init];
    BubbleSort2 *bubbleSort2 = [[BubbleSort2 alloc] init];
    InsertionSort *insertionSort = [[InsertionSort alloc] init];
    self.sortMethods = [NSArray arrayWithObjects:bubbleSort, bubbleSort2, insertionSort, nil];
    self.sortMethod = [self.sortMethods objectAtIndex:0];
    
    // segmented control
    [self.segmentedControl removeAllSegments];
    [self.segmentedControl addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
    for (NSObject *sortMethod in self.sortMethods) {
        [self.segmentedControl insertSegmentWithTitle:[sortMethod performSelector:@selector(sortMethodName)] atIndex:[self.sortMethods indexOfObject:sortMethod] animated:NO];
    }
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doGenerateRandomInput:(id)sender
{
    
}

- (void)doSort:(id)sender
{
    if (self.inputTextField.isFirstResponder) {
        [self.inputTextField resignFirstResponder];
    }
    NSArray *separatedStrings = [self.inputTextField.text componentsSeparatedByString:@","];
    NSMutableArray *input = [[NSMutableArray alloc] init];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    for (NSString *str in separatedStrings) {
        [input addObject:[formatter numberFromString:str]];
    }
    self.sortedList = [self.sortMethod sort:input];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sortCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sortCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.sortedList objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sortedList.count;
}

#pragma mark UISegmentedControl

- (void)segmentedControlValueDidChange:(UISegmentedControl*) segmentedControl
{
    self.sortMethod = [self.sortMethods objectAtIndex:segmentedControl.selectedSegmentIndex];
}

@end
