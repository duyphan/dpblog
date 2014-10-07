//
//  StoreTabBarViewController.m
//  MalltipProj
//
//  Created by DP on 10/6/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "StoreTabBarViewController.h"
static NSString *listStores = @"ListStores";

@interface StoreTabBarViewController ()
@property (weak, nonatomic) IBOutlet UITableView *listStoresView;

@end

@implementation StoreTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"STORES";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:(16/255.0) green:(157/255.0) blue:(255/255.0) alpha:1]};
    
    self.listStoresView.dataSource = self;
    self.listStoresView.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UILabel *titleOfStore;
    UILabel *statusOfStore;
    UIImageView *logoOfStore;
    UITableViewCell* cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:listStores];
        
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
        } else {
            cell.backgroundColor = [UIColor whiteColor];
        }
        
        CGRect frame=CGRectMake(70, 10, 216, 21);
        titleOfStore=[[UILabel alloc]init];
        titleOfStore.frame=frame;
        titleOfStore.tag = 1001;
        titleOfStore.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13.58f];
        
        [cell.contentView addSubview:titleOfStore];
        
        CGRect frame2=CGRectMake(70, 26, 216, 21);
        statusOfStore=[[UILabel alloc]init];
        statusOfStore.frame=frame2;
        statusOfStore.tag = 1003;
        statusOfStore.font = [UIFont fontWithName:@"HelveticaNeue" size:11.32f];
        [cell.contentView addSubview:statusOfStore];
        
        CGRect frame3=CGRectMake(15, 5, 46, 46);
        logoOfStore = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image-store.png"]];
        logoOfStore.frame = frame3;
        logoOfStore.tag = 1005;
        [cell.contentView addSubview:logoOfStore];
    } else {
        titleOfStore = (UILabel *)[cell.contentView viewWithTag:1001];
        statusOfStore = (UILabel *)[cell.contentView viewWithTag:1003];
        logoOfStore = (UIImageView *)[cell.contentView viewWithTag:1005];
    }
    
    titleOfStore.text = @"Abercrombie & Fitch";
    statusOfStore.text = @"12 Tips Available";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}

@end
