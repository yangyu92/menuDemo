//
//  ViewController.m
//  JHCustomMenuDemo
//
//  Created by AngelLL on 15/10/23.
//  Copyright © 2015年 AngelLL. All rights reserved.
//

#import "ViewController.h"
#import "JHCustomMenu.h"

@interface ViewController ()<JHCustomMenuDelegate>

@property (nonatomic, strong) JHCustomMenu *menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"schoolListItem.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showSchoolList:)];
    
    self.navigationItem.rightBarButtonItem = leftItem;
}

- (void)showSchoolList:(UIBarButtonItem *)barButtonItem
{
    __weak __typeof(self) weakSelf = self;
    if (!self.menu) {
        self.menu = [[JHCustomMenu alloc] initWithDataArr:@[@"附近学校", @"联赛流程", @"其他联赛", @"校内群聊", @"邀请好友"] origin:CGPointMake(230, 0) width:125 rowHeight:44];
        _menu.isAbout = AboutBarButtonItemRight;
        _menu.delegate = self;
        _menu.dismiss = ^() {
            weakSelf.menu = nil;
        };
        _menu.arrImgName = @[@"item_school.png", @"item_battle.png", @"item_list.png", @"item_chat.png", @"item_share.png"];
        [self.view addSubview:_menu];
    } else {
        [_menu dismissWithCompletion:^(JHCustomMenu *object) {
            weakSelf.menu = nil;
        }];
    }
}

- (void)jhCustomMenu:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select: %ld", indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)testAction:(id)sender {
    NSLog(@"按钮执行");
}

@end
