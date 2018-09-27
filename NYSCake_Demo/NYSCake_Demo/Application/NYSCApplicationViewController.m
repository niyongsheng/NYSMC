//
//  NYSCApplicationViewController.m
//  NYSCake_Demo
//
//  Created by 倪刚 on 2018/9/25.
//  Copyright © 2018年 NiYongsheng. All rights reserved.
//

#import "NYSCApplicationViewController.h"
#import <NYSMC/NYSMC.h>

@interface NYSCApplicationViewController ()

@end

@implementation NYSCApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES; 
    
    // 获取服务器中的配置参数（热启动不需要调用此方法）
    [NYSCake updataServerParameters];
}

@end
