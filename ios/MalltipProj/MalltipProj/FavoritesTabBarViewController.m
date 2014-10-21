//
//  FavoritesTabBarViewController.m
//  MalltipProj
//
//  Created by DP on 10/7/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "FavoritesTabBarViewController.h"

static NSString *tipTableCell = @"TipsTableCell";
static NSString *storeTableCell = @"StoreTableCell";

@interface FavoritesTabBarViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *SegmentControl;
@property (weak, nonatomic) IBOutlet UIView *storeView;
@property (weak, nonatomic) IBOutlet UIView *tipView;
@property (weak, nonatomic) IBOutlet UITableView *listTips;
@property (weak, nonatomic) IBOutlet UITableView *listStores;
- (IBAction)SegmentedControlChanged:(UISegmentedControl *)sender;
@end

@implementation FavoritesTabBarViewController

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
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"FAVORITES";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:(239.0/255.0) green:(145.0/255.0) blue:(23.0/255.0) alpha:1]};
    
    self.SegmentControl.layer.cornerRadius = 3;
    
    self.storeView.hidden = YES;
    
    self.listTips.dataSource = self;
    self.listTips.delegate = self;
    
    self.listStores.dataSource = self;
    self.listStores.delegate = self;
    
//    UIBezierPath *maskPathButtonTip;
//    UIBezierPath *maskPathButtonStore;
//    
//    maskPathButtonTip = [UIBezierPath bezierPathWithRoundedRect:self.buttonTips.bounds
//                                     byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
//                                           cornerRadii:CGSizeMake(5.0, 5.0)];
//    
//    CAShapeLayer *maskLayerButtonTip = [[CAShapeLayer alloc] init];
//    maskLayerButtonTip.frame = self.buttonTips.bounds;
//    maskLayerButtonTip.path = maskPathButtonTip.CGPath;
//    self.buttonTips.layer.mask = maskLayerButtonTip;
//    
//    maskPathButtonStore = [UIBezierPath bezierPathWithRoundedRect:self.buttonStores.bounds
//                                              byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
//                                                    cornerRadii:CGSizeMake(5.0, 5.0)];
//    
//    CAShapeLayer *maskLayerButtonStore = [[CAShapeLayer alloc] init];
//    maskLayerButtonStore.frame = self.buttonStores.bounds;
//    maskLayerButtonStore.path = maskPathButtonStore.CGPath;
//    self.buttonStores.layer.mask = maskLayerButtonStore;
//    
//    [self.buttonTips setImage:[UIImage imageNamed:@"bg-button-tip-selected.png"] forState:UIControlStateSelected];
//    [self.buttonStores setImage:[UIImage imageNamed:@"bg-button-store-selected.png"] forState:UIControlStateSelected];

}

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.selectedImageTintColor = [UIColor colorWithRed:239.0/225.0
                                                                          green:145.0/255.0
                                                                           blue:23.0/255.0
                                                                          alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UILabel *nameOfTip;
    UILabel *couponOfTip;
    UILabel *statusOfSaleTip;
    UIImageView *avatar;
    UITableViewCell* cell = nil;
    UITableViewCell* cellStore = nil;
    if (tableView == self.listTips) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:tipTableCell];
            
            CGRect frame = CGRectMake(60, 10, 226, 21);
            nameOfTip=[[UILabel alloc]init];
            nameOfTip.frame=frame;
            nameOfTip.tag = 1001;
            nameOfTip.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13.6];
            [cell.contentView addSubview:nameOfTip];

        
            CGRect frame1 = CGRectMake(6, 6, 45, 45);
            avatar = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image-tip-branch.png"]];
            avatar.frame = frame1;
            avatar.tag = 1002;
            [cell.contentView addSubview:avatar];
        
            CGRect frame2 = CGRectMake(60, 32, 226, 21);
            couponOfTip=[[UILabel alloc]init];
            couponOfTip.frame=frame2;
            couponOfTip.tag = 1003;
            couponOfTip.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11.36];
            [cell.contentView addSubview:couponOfTip];
        
            CGRect frame3 = CGRectMake(106, 32, 171, 21);
            statusOfSaleTip =[[UILabel alloc]init];
            statusOfSaleTip.frame = frame3;
            statusOfSaleTip.tag = 1004;
            statusOfSaleTip.font = [UIFont fontWithName:@"HelveticaNeue" size:11.36];
            [cell.contentView addSubview:statusOfSaleTip];
        
        } else {
            nameOfTip = (UILabel *)[cell.contentView viewWithTag:1001];
            couponOfTip = (UILabel *)[cell.contentView viewWithTag:1002];
            avatar = (UIImageView *)[cell.contentView viewWithTag:1003];
            avatar = (UIImageView *)[cell.contentView viewWithTag:1004];
        }
        nameOfTip.text = [NSString stringWithFormat:@"Victory's Secret"];
        couponOfTip.text = [NSString stringWithFormat:@"Coupon"];
        statusOfSaleTip.text = @"Jewelry Extra 20% Off!";
        return cell;
    } else {
        if (cellStore == nil) {
            cellStore = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:storeTableCell];
            
            CGRect frame = CGRectMake(60, 10, 226, 21);
            nameOfTip=[[UILabel alloc]init];
            nameOfTip.frame=frame;
            nameOfTip.tag = 1001;
            nameOfTip.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13.6];
            [cellStore.contentView addSubview:nameOfTip];
            
            
            CGRect frame1 = CGRectMake(6, 6, 45, 45);
            avatar = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image-tip-branch.png"]];
            avatar.frame = frame1;
            avatar.tag = 1002;
            [cellStore.contentView addSubview:avatar];
            
            CGRect frame2 = CGRectMake(60, 32, 226, 21);
            couponOfTip=[[UILabel alloc]init];
            couponOfTip.frame=frame2;
            couponOfTip.tag = 1003;
            couponOfTip.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11.36];
            [cellStore.contentView addSubview:couponOfTip];
            
            CGRect frame3 = CGRectMake(106, 32, 171, 21);
            statusOfSaleTip =[[UILabel alloc]init];
            statusOfSaleTip.frame = frame3;
            statusOfSaleTip.tag = 1004;
            statusOfSaleTip.font = [UIFont fontWithName:@"HelveticaNeue" size:11.36];
            [cellStore.contentView addSubview:statusOfSaleTip];
            
        } else {
            nameOfTip = (UILabel *)[cellStore.contentView viewWithTag:1001];
            couponOfTip = (UILabel *)[cellStore.contentView viewWithTag:1002];
            avatar = (UIImageView *)[cellStore.contentView viewWithTag:1003];
            avatar = (UIImageView *)[cellStore.contentView viewWithTag:1004];
        }
        nameOfTip.text = [NSString stringWithFormat:@"Victory's Secret"];
        couponOfTip.text = [NSString stringWithFormat:@"Coupon"];
        statusOfSaleTip.text = @"Jewelry Extra 20% Off!";
        return cellStore;
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (tableView == self.listTips) {
        return 1;
    } else {
        return 30;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.listTips) {
        return 30;
    } else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == self.listTips) {
        return 10;
    } else {
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == self.listTips) {
        UIView *headerView = [[UIView alloc] init];
        headerView.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0];
        return headerView;
    } else {
        return nil;
    }
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

- (IBAction)SegmentedControlChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
//            [[sender.subviews objectAtIndex:sender.selectedSegmentIndex] setBackgroundColor:tintcolor1];
            self.storeView.hidden = YES;
            self.tipView.hidden = NO;
            break;
        case 1:
//            [[sender.subviews objectAtIndex:sender.selectedSegmentIndex] setBackgroundColor:tintcolor2];
            self.storeView.hidden = NO;
            self.tipView.hidden = YES;
            break;
        default:
            break;
    }
}
@end
