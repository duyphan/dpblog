//
//  ViewController.m
//  HeaderFooterCell
//
//  Created by DP on 9/11/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ViewController.h"
static NSString *CellIdentifier = @"CellIdentifier";
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *arrayOfSections;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.myTableView =
    [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *) newSectionWithIndex:(NSUInteger)paramIndex cellCount:(NSUInteger)paramCellCount;
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSUInteger counter = 0;
    for (counter = 0; counter < paramCellCount; counter++){
        [result addObject:[[NSString alloc] initWithFormat:@"Section %lu Cell %lu", (unsigned long)paramIndex,(unsigned long)counter+1]];
    }
    return result;
}
- (NSMutableArray *) arrayOfSections;
{
    if (_arrayOfSections == nil){
        NSMutableArray *section1 = [self newSectionWithIndex:1 cellCount:3];
        NSMutableArray *section2 = [self newSectionWithIndex:2 cellCount:3];
        NSMutableArray *section3 = [self newSectionWithIndex:3 cellCount:3];
        
        _arrayOfSections = [[NSMutableArray alloc] initWithArray:@[section1, section2, section3]];
    }
    return _arrayOfSections;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView;
{
    return self.arrayOfSections.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    NSMutableArray *sectionArray = self.arrayOfSections[section];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSMutableArray *sectionArray = self.arrayOfSections[indexPath.section];
    cell.textLabel.text = sectionArray[indexPath.row];
    return cell;
}

- (void) moveSection1ToSection3{
    NSMutableArray *section1 = self.arrayOfSections[0];
    [self.arrayOfSections removeObject:section1];
    [self.arrayOfSections addObject:section1];
    [self.myTableView moveSection:0 toSection:2];
}
//- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//{
//    UITableViewCell *cell = nil;
//    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.textLabel.text = [[NSString alloc] initWithFormat:@"Cell %ld", (long)indexPath.row];
//    return cell;
//}
//
//- (UILabel *) newLabelWithTitle:(NSString *)paramTitle;
//{
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
//    label.text = paramTitle;
//    label.backgroundColor = [UIColor clearColor];
//    [label sizeToFit];
//    return label;
//}
//
//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
//{
//    if (section == 0){
//        return [self newLabelWithTitle:@"Header"];
//    }
//    return nil;
//}
//
//- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
//{
//    if (section == 0){
//        return [self newLabelWithTitle:@"Footer"];
//    }
//    return nil;
//}
//
//- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
//{
//    return 3;
//}

@end
