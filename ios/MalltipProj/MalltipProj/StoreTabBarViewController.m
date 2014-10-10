//
//  StoreTabBarViewController.m
//  MalltipProj
//
//  Created by DP on 10/6/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "StoreTabBarViewController.h"
static NSString *listStores = @"ListStores";
static NSMutableArray *arrayOfFilter;

@interface StoreTabBarViewController ()
{
    NSMutableArray *groupByEachCharacters;
    NSMutableArray *groupByAllCharacters;
}
@property (strong, nonatomic) UIView *selectedCategoriesView;
@property (weak, nonatomic) IBOutlet UITableView *listStoresView;
@property (strong, nonatomic) NSArray *stores;
@end

static int const HEIGHT_OF_SCREEN_35 = 480;
static int const HEIGHT_OF_SCREEN_40 = 568;
static int const WIDTH_OF_SCREEN = 320;
static int const HEIGHT_OF_TABLE = 395;
static int const POINT_OF_Y = 123;
static int const BUTTON_SPACE_WIDTH = 10;
static int const BUTTON_SPACE_HEIGHT = 10;

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
//    NSLog(@"%ld", self.mallID);
    // Get the malls data
    LibraryAPI *dataManager = [LibraryAPI sharedInstance];
    
    self.stores = [dataManager getStoresAtMallID:4168];
    
    // Allocationg and initializer NSMutable array object
    groupByAllCharacters = [[NSMutableArray alloc] init];
    
    // This is section that handle how to use the first character  as section name
    for (char c = 'A'; c <= 'Z'; c++) {
        
        groupByEachCharacters = [[NSMutableArray alloc] init];
        
        NSMutableArray *array  = [[NSMutableArray alloc] init];
        
        for (Store *store in self.stores) {
            
            NSString *firstCharacter = [[store.storeName substringWithRange:NSMakeRange(0, 1)] uppercaseString];
            if ([firstCharacter isEqualToString:[NSString stringWithFormat:@"%c", c]]) {
                [array addObject:store];
            }
        }
        
        if (array != nil && array.count > 0) {
            [groupByEachCharacters addObject:[NSString stringWithFormat:@"%c", c]];
            [groupByEachCharacters addObject:array];
            [groupByAllCharacters addObject:groupByEachCharacters];
        }
    }
    
//    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"STORES";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:(16/255.0) green:(157/255.0) blue:(255/255.0) alpha:1]};
    
    self.listStoresView.dataSource = self;
    self.listStoresView.delegate = self;

}

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.0];
    self.listStoresView.separatorColor = [UIColor clearColor];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    
    if (arrayOfFilter.count > 0) {
        self.selectedCategoriesView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 120, self.view.frame.size.width, 45.0f)];
        self.selectedCategoriesView.backgroundColor = [UIColor whiteColor];
        CGRect frame = CGRectMake(10.0f, 10.0f, 50.0f, 30.0f);
        for (int i = 0; i < arrayOfFilter.count; i++)
        {
            UIButton *button =[UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = frame;
            button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.32f];
            button.layer.borderWidth=0.0f;
            button.layer.borderColor=[[UIColor colorWithRed:16.0/255.0 green:157.0/255.0 blue:255.0/255.0 alpha:1.0] CGColor];
            button.layer.cornerRadius = 12;
            button.clipsToBounds = YES;
            [button setTitle:arrayOfFilter[i] forState:UIControlStateNormal];
            
            [button sizeToFit];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            
            if ((frame.origin.x + button.frame.size.width + 45) > self.view.frame.size.width) {
                frame.origin.x = 10.0f;
                frame.origin.y += (button.frame.size.height + BUTTON_SPACE_HEIGHT);
                self.selectedCategoriesView.frame = CGRectMake(self.selectedCategoriesView.frame.origin.x, self.selectedCategoriesView.frame.origin.y, WIDTH_OF_SCREEN, self.selectedCategoriesView.frame.size.height + button.frame.size.height + BUTTON_SPACE_HEIGHT);
            }
            
            button.frame = CGRectMake(frame.origin.x, frame.origin.y, button.frame.size.width + 40, button.frame.size.height);
            
            button.backgroundColor = [UIColor colorWithRed:16.0/255.0 green:157.0/255.0 blue:255.0/255.0 alpha:1.0];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTintColor:[UIColor whiteColor]];
            UIImage *backgroundImage = [UIImage imageNamed:@"button-close-filter.png"];
            [button setImage:backgroundImage forState:UIControlStateNormal];
            button.imageEdgeInsets = UIEdgeInsetsMake(0.0f, button.frame.size.width - 20, 0.0f, 0.0f);
            
            
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.selectedCategoriesView addSubview:button];
            
            if ((frame.origin.x + button.frame.size.width + 30) < self.view.frame.size.width) {
                frame.origin.x+=(button.frame.size.width + BUTTON_SPACE_WIDTH);
            }
            
        }
        [self.view addSubview:self.selectedCategoriesView];
        
        if ([[UIScreen mainScreen] bounds].size.height == HEIGHT_OF_SCREEN_35) {
            self.listStoresView.frame = CGRectMake(0, POINT_OF_Y + self.selectedCategoriesView.frame.size.height, WIDTH_OF_SCREEN, HEIGHT_OF_TABLE - (HEIGHT_OF_SCREEN_40-HEIGHT_OF_SCREEN_35) - (self.selectedCategoriesView.frame.size.height));
        } else {
            self.listStoresView.frame = CGRectMake(0, POINT_OF_Y+ self.selectedCategoriesView.frame.size.height , WIDTH_OF_SCREEN, HEIGHT_OF_TABLE - (self.selectedCategoriesView.frame.size.height));
        }
        
    } else {
        [self.selectedCategoriesView removeFromSuperview];
        if ([[UIScreen mainScreen] bounds].size.height == HEIGHT_OF_SCREEN_35) {
            self.listStoresView.frame = CGRectMake(0, POINT_OF_Y, WIDTH_OF_SCREEN, HEIGHT_OF_TABLE - (HEIGHT_OF_SCREEN_40-HEIGHT_OF_SCREEN_35));
        } else {
            self.listStoresView.frame = CGRectMake(0, POINT_OF_Y, WIDTH_OF_SCREEN, HEIGHT_OF_TABLE);
        }
    }
}

- (void)buttonAction:(UIButton *)sender;
{
    for (int i = 0 ; i < arrayOfFilter.count; i++) {
        if ([arrayOfFilter[i] isEqualToString:sender.titleLabel.text]) {
            [arrayOfFilter removeObjectAtIndex:i];
            [self.selectedCategoriesView removeFromSuperview];
        }
    }
    [self.listStoresView reloadData];
    [self viewWillAppear:YES];
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
    
    NSArray *storesWithAllFirstCharacters = [groupByAllCharacters objectAtIndex:indexPath.section];
    NSArray *storesWithEachFirstCharacter = [storesWithAllFirstCharacters objectAtIndex:1];
    
    // Get data from Store model with seopcific index path
    Store * store = [storesWithEachFirstCharacter objectAtIndex:indexPath.row];
    
    titleOfStore.text = [NSString stringWithString:store.storeName];
    statusOfStore.text = [NSString stringWithFormat:@"%ld Tips Available", (long)store.numberOfTips];
    
    return cell;
}

// The view returned from this methods will be displayed as header title of table view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    NSArray *storesWithAllFirstCharacters = [groupByAllCharacters objectAtIndex:section];
    NSString *titleSectionAtEachStore = [storesWithAllFirstCharacters objectAtIndex:0];
    UIView *header = nil;
    UILabel *label = [self newLabelWithTitle:titleSectionAtEachStore];
    
    label.frame = CGRectMake(CGRectGetMinX(label.frame) + 20.0f,
                             3.0f,
                             CGRectGetWidth(label.frame),
                             CGRectGetHeight(label.frame));
    
    CGRect resultFrame = CGRectMake(0.0f,
                                    0.0f,
                                    CGRectGetWidth(label.frame) + 10.0f,
                                    CGRectGetHeight(label.frame));
    
    header = [[UIView alloc] initWithFrame:resultFrame];
    
    header.backgroundColor = [UIColor colorWithRed:16.0f/255.0f
                                             green:157.0f/255.0f
                                              blue:255.0f/255.0f
                                             alpha:1.0f];
    [header addSubview:label];
    
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    NSArray *stores = [groupByAllCharacters objectAtIndex:section];
    NSArray *subStores = [stores objectAtIndex:1];
    return subStores.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return groupByAllCharacters.count;
}

// Customize title of header section of table view
- (UILabel *) newLabelWithTitle:(NSString *)paramTitle;
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.text = paramTitle;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:10.0f];
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    
    return label;
}

- (void)passArrayFilter:(NSArray *)array;
{
    arrayOfFilter = [NSMutableArray arrayWithArray:array];
}

@end
