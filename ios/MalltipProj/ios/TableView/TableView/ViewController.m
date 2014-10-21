//
//  ViewController.m
//  TableView
//
//  Created by DP on 9/9/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ViewController.h"
static NSString *TableViewCellIdentifier = @"MyCells";
@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellIdentifier];
    self.myTableView.dataSource = self;
    
    self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    if ([tableView isEqual:self.myTableView]){
        return 3;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
//    if ([tableView isEqual:self.myTableView]){
//        switch (section){
//            case 0:{
//                return 3;
//                break;
//            }
//            case 1:{
//                return 5;
//                break;
//            }
//            case 2:{
//                return 8;
//                break;
//            }
//        }
//    }
    return 10;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = nil;
    if ([tableView isEqual:self.myTableView]){
        cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat: @"Section %ld, Cell %ld", (long)indexPath.section, (long)indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;
{
    /* Do something when the accessory button is tapped */
    NSLog(@"Accessory button is tapped for cell at index path = %@", indexPath);
    UITableViewCell *ownerCell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Cell Title = %@", ownerCell.textLabel.text);
}
@end
