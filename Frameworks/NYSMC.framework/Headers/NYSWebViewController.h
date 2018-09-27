//
//  NYSWebViewController.h
//  cake
//
//  Created by 倪刚 on 2018/9/24.
//  Copyright © 2018年 NiYongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NYSWebViewController : UIViewController

- (void)refresh;
@property(assign, nonatomic) BOOL isHiddenNavigationController;
@property(strong, nonatomic) UIColor *progressBarColor;
@end

NS_ASSUME_NONNULL_END
