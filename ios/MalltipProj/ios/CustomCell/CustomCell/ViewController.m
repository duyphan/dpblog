//
//  ViewController.m
//  CustomCell
//
//  Created by DP on 9/11/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "ViewController.h"
static NSString *MyCellIdentifier = @"MyCells";

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MyCellIdentifier];
    self.myTableView.dataSource = self;
    self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Section %ld, Cell %ld", (long)indexPath.section,
                           (long)indexPath.row];
    
    // Custom button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0.0f, 0.0f, 150.0f, 25.0f);
    [button setTitle:@"Expand" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(performExpand:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.accessoryView = button;
    return cell;
}

-(void) performExpand:(UIButton *)paramSender; {
    __unused UITableViewCell *parentCell = (UITableViewCell *)[self superviewOfType:[UITableViewCell class] forView:paramSender];
}

- (UIView *) superviewOfType:(Class)paramSuperviewClass forView:(UIView *)paramView;
{
    if (paramView.superview != nil){
        if ([paramView.superview isKindOfClass:paramSuperviewClass]){
            return paramView.superview;
        } else {
            return [self superviewOfType:paramSuperviewClass forView:paramView.superview];
        }
    }
    return nil;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return UITableViewCellEditingStyleDelete;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if(editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.allRows remmoveObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}

@end
