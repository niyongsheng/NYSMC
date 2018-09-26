//
//  NYSCSheelViewController.m
//  NYSCake_Demo
//
//  Created by 倪刚 on 2018/9/25.
//  Copyright © 2018年 NiYongsheng. All rights reserved.
//

#import "NYSCSheelViewController.h"
#import "NYSC/NYSCake.h"
#import "NYSC/NYSWebViewController.h"

@interface NYSCSheelViewController ()
- (IBAction)safari:(id)sender;

@end

@implementation NYSCSheelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 获取服务器中的配置参数（热启动不需要调用此方法）
    [NYSCake updataServerParameters];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)safari:(id)sender {
    [self presentViewController:[[NYSWebViewController alloc] init] animated:YES completion:nil];
//    [self.navigationController pushViewController:[[NYSWebViewController alloc] init] animated:YES];
}
@end
