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
@property (weak, nonatomic) IBOutlet UIButton *customBtn;
    
@end

@implementation NYSCSheelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *strResourcesBundle = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"bundle"];
    NSString *strC = [[NSBundle bundleWithPath:strResourcesBundle] pathForResource:@"homePage" ofType:@"png"];
    NSLog(@"path:%@", strC);
    [_customBtn setBackgroundImage:[UIImage imageNamed:strC] forState:UIControlStateNormal];
    // 获取服务器中的配置参数（热启动不需要调用此方法）
    [NYSCake updataServerParameters];
}

- (IBAction)safari:(id)sender {
    NYSWebViewController *webVC = [[NYSWebViewController alloc] init];
    webVC.title = @"网页";
    NSLog(@"%@", NYSCakeFrameworkSrcName(@"homePage"));
    [self presentViewController:webVC animated:YES completion:nil];
//    [self.navigationController pushViewController:webVC animated:YES];
}
@end
