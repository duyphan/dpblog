//
//  FilterStoreViewController.m
//  MalltipProj
//
//  Created by DP on 10/7/14.
//  Copyright (c) 2014 ___Test___. All rights reserved.
//

#import "FilterStoreViewController.h"
static NSMutableArray *listFilter = nil;

static int const HEIGHT_OF_SCREEN_40 = 568;
static int const HEIGHT_OF_SCROLL_40 = 420;
static int const WIDTH_OF_SCREEN = 320;
static int const BUTTON_SPACE_WIDTH = 10;
static int const BUTTON_SPACE_HEIGHT = 10;
static int const BUTTON_INSETS = 10;

@interface FilterStoreViewController ()
- (IBAction)handleCloseButton:(id)sender;
- (void)checkListFilter:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonFilterStore;
@property (weak, nonatomic) IBOutlet UIScrollView *FilterScrollView;
@property (nonatomic, strong) NSArray *listbuttonFilter;

@end

@implementation FilterStoreViewController

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
    
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
    if ([[UIScreen mainScreen] bounds].size.height == HEIGHT_OF_SCREEN_40){
//        self.FilterScrollView.frame = CGRectMake(0, 0, WIDTH_OF_SCREEN, HEIGHT_OF_SCREEN_35);
        [self.FilterScrollView setScrollEnabled:YES];
        [self.FilterScrollView setContentSize:CGSizeMake(WIDTH_OF_SCREEN, HEIGHT_OF_SCROLL_40)];
    } else {
        [self.FilterScrollView setScrollEnabled:NO];
    }
    
    if (listFilter == nil) {
        listFilter = [NSMutableArray array];
    }
    
    // Custom button filter store
    self.buttonFilterStore.layer.borderWidth=1.0f;
    self.buttonFilterStore.layer.borderColor=[[UIColor colorWithRed:16.0/255.0 green:157.0/255.0 blue:255.0/255.0 alpha:1.0] CGColor];
    self.buttonFilterStore.layer.cornerRadius = 5;
    self.buttonFilterStore.clipsToBounds = YES;
    
    self.listbuttonFilter = @[@{@"Title":@"Accessories"},
                         @{@"Title":@"Bath & Beauty"},
                         @{@"Title":@"Books"},
                         @{@"Title":@"Electronics"},
                         @{@"Title":@"Food"},
                         @{@"Title":@"Gifts"},
                         @{@"Title":@"Handbags"},
                         @{@"Title":@"Home & Furniture"},
                         @{@"Title":@"Jewelry"},
                         @{@"Title":@"Junior Apparel"},
                         @{@"Title":@"Kids & Baby Apparel"},
                         @{@"Title":@"Luggage"},
                         @{@"Title":@"Maternity and Nursing"},
                         @{@"Title":@"Men's Apparel"},
                         @{@"Title":@"Office Supplies"},
                         @{@"Title":@"Other"},
                         @{@"Title":@"Personal Services"},
                         @{@"Title":@"Shoes"},
                         @{@"Title":@"Sporting Gear"},
                         @{@"Title":@"Toys"},
                         @{@"Title":@"Food Custom"},
                         @{@"Title":@"Gifts Custom"},
                         @{@"Title":@"Handbags Custom"},
                         @{@"Title":@"Home & Furniture Custom"},
                         @{@"Title":@"Jewelry Custom"},
                         @{@"Title":@"Junior Apparel Custom"},
                         @{@"Title":@"Kids & Baby Apparel Custom"}
//                         @{@"Title":@"Luggage Custom"},
//                         @{@"Title":@"Maternity and Nursing Custom"},
//                         @{@"Title":@"Men's Apparel Custom"},
//                         @{@"Title":@"Office Supplies Custom"},
//                         @{@"Title":@"Other Custom"},
//                         @{@"Title":@"Personal Services Custom"},
//                         @{@"Title":@"Shoes Custom"},
//                         @{@"Title":@"Sporting Gear Custom"},
//                         @{@"Title":@"Toys Custom"},
//                         @{@"Title":@"Personal Services Custom"}
                         ];
    
    [self addListToFilterView];
    
    [self.buttonFilterStore addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
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

- (void)addListToFilterView;
{
    CGRect frame = CGRectMake(10.0f, 10.0f, 50.0f, 30.0f);
    for (NSDictionary *dict in self.listbuttonFilter)
    {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = frame;
        button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.58f];
        button.layer.borderWidth=1.0f;
        button.layer.cornerRadius = 14;
        button.clipsToBounds = YES;
        [button setTitle:dict[@"Title"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button sizeToFit];
        
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10.0, 0.0, 10.0)];
        
        if ((frame.origin.x + button.frame.size.width + BUTTON_SPACE_WIDTH*3) > self.view.frame.size.width) {
            frame.origin.x = 10.0f;
            frame.origin.y += (button.frame.size.height + BUTTON_SPACE_HEIGHT);
        }
        
        button.frame = CGRectMake(frame.origin.x, frame.origin.y, button.frame.size.width + BUTTON_INSETS*2, button.frame.size.height);
        
        for (int i = 0; i < listFilter.count; i++) {
            if ([dict[@"Title"] isEqualToString:listFilter[i]]) {
                button.backgroundColor = [UIColor  colorWithRed:16.0/255.0 green:157.0/255.0 blue:255.0/255.0 alpha:1.0];
                button.tintColor = [UIColor whiteColor];
                button.layer.borderColor=[[UIColor colorWithRed:16.0/255.0 green:157.0/255.0 blue:255.0/255.0 alpha:1.0] CGColor];
                break;
            } else {
                button.backgroundColor = [UIColor clearColor];
                button.tintColor = [UIColor blackColor];
                button.layer.borderColor=[[UIColor blackColor] CGColor];
            }
        }
        [button addTarget:self action:@selector(checkListFilter:) forControlEvents:UIControlEventTouchUpInside];
        [self.FilterScrollView addSubview:button];
        if ((frame.origin.x + button.frame.size.width + BUTTON_SPACE_WIDTH*3) < self.view.frame.size.width) {
            frame.origin.x+=(button.frame.size.width + BUTTON_SPACE_WIDTH);
            
        }
    }
}

- (void)dismissViewController;
{
    StoreTabBarViewController *obj = [[StoreTabBarViewController alloc] initWithNibName:NULL bundle:nil];
    [obj passArrayFilter:listFilter];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)checkListFilter:(UIButton *)sender;
{
    if (sender.tintColor == [UIColor whiteColor]) {
        [sender setBackgroundColor:[UIColor clearColor]];
        sender.layer.borderColor=[[UIColor blackColor] CGColor];
        sender.tintColor = [UIColor blackColor];
        
        for (int i = 0 ; i < listFilter.count; i++) {
            if ([listFilter[i] isEqualToString:sender.titleLabel.text]) {
                [listFilter removeObjectAtIndex:i];
            }
        }
        
    } else {
        [sender setBackgroundColor:[UIColor colorWithRed:16.0/255.0 green:157.0/255.0 blue:255.0/255.0 alpha:1.0]];
        sender.layer.borderColor=[[UIColor colorWithRed:16.0/255.0 green:157.0/255.0 blue:255.0/255.0 alpha:1.0] CGColor];
        sender.tintColor = [UIColor whiteColor];
        
        id a = sender.titleLabel.text;
        [listFilter addObject:a];
        
    }
}

- (IBAction)handleCloseButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
