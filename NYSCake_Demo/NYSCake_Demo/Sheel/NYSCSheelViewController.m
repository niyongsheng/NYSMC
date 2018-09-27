//
//  NYSCSheelViewController.m
//  NYSCake_Demo
//
//  Created by 倪刚 on 2018/9/25.
//  Copyright © 2018年 NiYongsheng. All rights reserved.
//

#import "NYSCSheelViewController.h"
#import <NYSMC/NYSMC.h>

@interface NYSCSheelViewController ()
- (IBAction)safari:(id)sender;
    
@end

@implementation NYSCSheelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    // 获取服务器中的配置参数（热启动不需要调用此方法）
//    [NYSCake updataServerParameters];
}

- (IBAction)safari:(id)sender {
    NYSWebViewController *webVC = [[NYSWebViewController alloc] init];
    webVC.title = @"网页";
    webVC.progressBarColor = [UIColor colorWithRed:0.17 green:0.43 blue:0.76 alpha:1.00];
    webVC.isHiddenNavigationController = self.navigationController.navigationBar.hidden;
    [self.navigationController pushViewController:webVC animated:YES];
}
@end
