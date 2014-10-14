//
//  MoreTabBarViewController.m
//  MalltipProj
//
//  Created by DP on 10/7/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "MoreTabBarViewController.h"
#import "SearchResultViewController.h"

static NSString *listMoreOption = @"moreListOption";

@interface MoreTabBarViewController ()
@property (weak, nonatomic) IBOutlet UITableView *moreTableOptionView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation MoreTabBarViewController

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
    
    self.navigationController.navigationBar.hidden = YES;
    self.containerView.backgroundColor = [UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:83.0/255.0 alpha:1.0];
    
    self.moreTableOptionView.separatorColor = [UIColor colorWithRed:72.0/255.0 green:72.0/255.0 blue:75.0/255.0 alpha:1.0];
    
}

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.selectedImageTintColor = [UIColor colorWithRed:112.0/225.0
                                                                          green:112.0/255.0
                                                                           blue:112.0/255.0
                                                                          alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table Management
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UILabel *titleOfOption;
    UIImageView *iconOption;
    UITableViewCell* cell = nil;
    if (cell == nil) {
        
        cell = [_moreTableOptionView dequeueReusableCellWithIdentifier:listMoreOption];
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = [UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:83.0/255.0 alpha:1.0];
        } else {
            cell.backgroundColor = [UIColor colorWithRed:72.0/255.0 green:72.0/255.0 blue:75.0/255.0 alpha:1.0];
        }
        
        CGRect frame=CGRectMake(23, 16, 180, 21);
        CGRect customFrame=CGRectMake(55, 18, 180, 21);
        
        CGRect iconFrame=CGRectMake(23, 16, 27, 22);
        
        switch (indexPath.row)
        
        {
            case 0:
                
                titleOfOption=[[UILabel alloc]init];
                titleOfOption.frame=customFrame;
                titleOfOption.tag = 1001;
                titleOfOption.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.85];
                titleOfOption.textColor = [UIColor whiteColor];
                [cell.contentView addSubview:titleOfOption];
                
                iconOption = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-change-mall.png"]];
                iconOption.frame = iconFrame;
                iconOption.tag = 1005;
                titleOfOption.text = [NSString stringWithFormat:@"Change Mall"];
                [cell.contentView addSubview:iconOption];
                
                break;
                
            case 1:
                
                titleOfOption=[[UILabel alloc]init];
                titleOfOption.frame=customFrame;
                titleOfOption.tag = 1001;
                titleOfOption.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.85];
                titleOfOption.textColor = [UIColor whiteColor];
                [cell.contentView addSubview:titleOfOption];
                
                iconOption = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-get-direction-more.png"]];
                iconOption.frame = iconFrame;
                iconOption.tag = 1005;
                titleOfOption.text = [NSString stringWithFormat:@"Get Directions"];
                [cell.contentView addSubview:iconOption];
                
                break;
                
            case 2:
                titleOfOption=[[UILabel alloc]init];
                titleOfOption.frame=frame;
                titleOfOption.tag = 1001;
                titleOfOption.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.85];
                titleOfOption.textColor = [UIColor whiteColor];
                titleOfOption.text = [NSString stringWithFormat:@"Feedback"];
                [cell.contentView addSubview:titleOfOption];
                
                break;
                
            case 3:
                titleOfOption=[[UILabel alloc]init];
                titleOfOption.frame=frame;
                titleOfOption.tag = 1001;
                titleOfOption.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.85];
                titleOfOption.textColor = [UIColor whiteColor];
                titleOfOption.text = [NSString stringWithFormat:@"Saved Stores Notification"];
                [cell.contentView addSubview:titleOfOption];
                
                break;
                
            case 4:
                titleOfOption=[[UILabel alloc]init];
                titleOfOption.frame=frame;
                titleOfOption.tag = 1001;
                titleOfOption.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.85];
                titleOfOption.textColor = [UIColor whiteColor];
                titleOfOption.text = [NSString stringWithFormat:@"Edit Profile"];
                [cell.contentView addSubview:titleOfOption];
                
                break;
                
            case 5:
                titleOfOption=[[UILabel alloc]init];
                titleOfOption.frame=frame;
                titleOfOption.tag = 1001;
                titleOfOption.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.85];
                titleOfOption.textColor = [UIColor whiteColor];
                titleOfOption.text = [NSString stringWithFormat:@"Change Password"];
                [cell.contentView addSubview:titleOfOption];
                
                break;
            
            case 6:
                titleOfOption=[[UILabel alloc]init];
                titleOfOption.frame=frame;
                titleOfOption.tag = 1001;
                titleOfOption.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.85];
                titleOfOption.textColor = [UIColor whiteColor];
                titleOfOption.text = [NSString stringWithFormat:@"Sign Out"];
                [cell.contentView addSubview:titleOfOption];
                
                break;
                
        }
        
    } else {
        titleOfOption = (UILabel *)[cell.contentView viewWithTag:1001];
    }
    
    return cell;
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.row == 0) {
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        SearchResultViewController *searchResultVC = [storyBoard instantiateViewControllerWithIdentifier:@"searchResultViewController"];
        UINavigationController *searchResultNC = [storyBoard instantiateViewControllerWithIdentifier:@"navigationController"];
        [searchResultNC pushViewController:searchResultVC animated:NO];
        
        [self presentViewController:searchResultNC animated:YES completion:nil];
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 7;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}

@end
