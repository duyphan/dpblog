//
//  SearchResultViewController.m
//  MalltipProj
//
//  Created by DP on 10/3/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "SearchResultViewController.h"

static NSString *listMalls = @"ListMalls";

@interface SearchResultViewController ()
- (IBAction)buttonBack:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *listMallsView;
@property (strong, nonatomic) NSArray *malls;
@end

@implementation SearchResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Managing View
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Get the malls data
    MallAPI *remote = [[MallAPI alloc] init];
    self.malls = [remote getAllMalls];
    
//    NSLog(@"Count = %lu", (unsigned long)self.malls.count);
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"MALLS";
    
    self.listMallsView.dataSource = self;
    self.listMallsView.delegate = self;

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

#pragma mark - Handle Button
- (IBAction)buttonBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table Management
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UILabel *titleOfMall;
    UILabel *timeOfMall;
    UILabel *distanceOfMall;
    UILabel *mountOfTipsMall;
    UILabel *statusOfMall;
    UIImageView *iconTip;
    UITableViewCell* cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:listMalls];
        
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
        } else {
            cell.backgroundColor = [UIColor whiteColor];
        }
        
        CGRect frame=CGRectMake(20, 11, 300, 15);
        titleOfMall=[[UILabel alloc]init];
        titleOfMall.frame=frame;
        titleOfMall.tag = 1001;
        titleOfMall.font = [UIFont fontWithName:@"HelveticaNeue" size:15.85];
        
        [cell.contentView addSubview:titleOfMall];
        
        CGRect frame2=CGRectMake(20, 28, 300, 15);
        timeOfMall=[[UILabel alloc]init];
        timeOfMall.frame=frame2;
        timeOfMall.tag = 1003;
        timeOfMall.font = [UIFont fontWithName:@"HelveticaNeue" size:11.3];
        [cell.contentView addSubview:timeOfMall];
        
        CGRect frame3=CGRectMake(20, 47, 15, 15);
        iconTip = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-tips.png"]];
        iconTip.frame = frame3;
        iconTip.tag = 1005;
        [cell.contentView addSubview:iconTip];
        
        CGRect frame4=CGRectMake(40, 43, 42, 21);
        mountOfTipsMall=[[UILabel alloc]init];
        mountOfTipsMall.frame=frame4;
        mountOfTipsMall.tag = 1007;
        mountOfTipsMall.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11.3];
        [cell.contentView addSubview:mountOfTipsMall];
        
        CGRect frame5=CGRectMake(84, 43, 78, 21);
        statusOfMall=[[UILabel alloc]init];
        statusOfMall.frame=frame5;
        statusOfMall.tag = 1009;
        statusOfMall.font = [UIFont fontWithName:@"HelveticaNeue" size:11.3];
        [cell.contentView addSubview:statusOfMall];
        
        CGRect frame6=CGRectMake(110, 25, 105, 21);
        distanceOfMall=[[UILabel alloc]init];
        distanceOfMall.frame=frame6;
        distanceOfMall.tag = 1010;
        distanceOfMall.font = [UIFont fontWithName:@"HelveticaNeue" size:11.3];
        [cell.contentView addSubview:distanceOfMall];
    } else {
        titleOfMall = (UILabel *)[cell.contentView viewWithTag:1001];
        timeOfMall = (UILabel *)[cell.contentView viewWithTag:1003];
        iconTip = (UIImageView *)[cell.contentView viewWithTag:1005];
        titleOfMall = (UILabel *)[cell.contentView viewWithTag:1007];
        timeOfMall = (UILabel *)[cell.contentView viewWithTag:1009];
        distanceOfMall = (UILabel *)[cell.contentView viewWithTag:1010];
    }
    
    Mall *mall = [self.malls objectAtIndex:indexPath.row];
    
    titleOfMall.text = [NSString stringWithString:mall.mallName];
    timeOfMall.text = [NSString stringWithFormat:@"Fri:9am-9:30pm • "];
    distanceOfMall.text = [NSString stringWithFormat:@"%ld mile away", lroundf(mall.distance)];
    mountOfTipsMall.text = [NSString stringWithFormat:@"%ld Tips", (long)mall.numberOfTips];
    statusOfMall.text = @"Available";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
//    HomeTabBarViewController *homeTabBarView = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
//    [self.navigationController pushViewController:homeTabBarView animated:YES];
//    
//    Mall *mall = [self.malls objectAtIndex:indexPath.row];
//    
//    homeTabBarView.mall = mall;
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    TabBarViewController *tabbarController = [storyBoard instantiateViewControllerWithIdentifier:@"tabBarController"];
    
    HomeTabBarViewController *homeViewController = [storyBoard instantiateViewControllerWithIdentifier:@"homeTabBarView"];
    StoreTabBarViewController *storeViewController = [storyBoard instantiateViewControllerWithIdentifier:@"storeTabBarViewController"];
    
    appDelegate.window.rootViewController = tabbarController;
    
    UINavigationController *navController = [tabbarController.viewControllers objectAtIndex:0];
    
    [navController pushViewController:homeViewController animated:YES];
    
    Mall *mall = [self.malls objectAtIndex:indexPath.row];
    
    homeViewController.mall = mall;
    storeViewController.mallID = mall.mallId;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
//    if (deviceHeight480) {
//        return 61.5f;
//    }
    return 73.0f;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.malls.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}

@end
