![(logo)](https://github.com/niyongsheng/NYSMC/blob/master/MC_logo.png?raw=true)
## NYSMC
* 选择加载“壳应用”/“真应用”的简单框架。
* Choose Sheel/Application framework.

## <a id="How_to_use_NYSMC"></a>How to use NYSMC
* Installation with CocoaPods：`pod 'NYSMC'`
* Manual import：
    * Drag All files in the `NYSMC` folder to project
    * Import the main file：`#import <NYSCake.h>`

## <a id="Application_startup_example_by_NYSMC"></a>Application startup example by NYSMC
<img src="http://images0.cnblogs.com/blog2015/497279/201506/141212365041650.png" width="200" height="300">

## <a id="The_Framework_Structure_Chart_of_NYSMC"></a>The Framework Structure Chart of NYSMC
![](http://images0.cnblogs.com/blog2015/497279/201506/132232456139177.png)
<img src="http://images0.cnblogs.com/blog2015/497279/201506/141358159107893.png" width="30%" height="30%">

- `The class of non-red text` in the chart：For inheritance，to use DIY the control of refresh
- About how to DIY the control of refresh，You can refer the Class in below Chart<br>

## <a id="AppDelegate.m"></a>AppDelegate.m
```objc
#import <NYSC/NYSCake.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化NYSC
    [NYSCake initWithEstimatedAuditDays:2 PostURL:@"http://xxx.qmook.com:8080/shelf" ValidateParameters:nil BootMethod:NYSCBootMethod_Cold];
    // 选择分支
    [NYSCake chooseViewControllerWithPriorityType:NYSCPriorityType_Server_Version errorBootFromType:BootFrom_Application matchSheelBlock:^{
    	// 马甲
        self.window.rootViewController = [[NYSCSheelViewController alloc] init];
        [self.window makeKeyAndVisible];
    } ApplicationBlock:^{
    	// 应用
        self.window.rootViewController = [[NYSCApplicationViewController alloc] init];
        [self.window makeKeyAndVisible];
    }];
    return YES;
}
```
## <a id="SheelViewController.m"></a>SheelViewController.m
```objc

#import "SheelViewController.h"
#import <NYSC/NYSCake.h>
#import <NYSC/NYSWebViewController.h>

@interface NYSCSheelViewController ()
- (IBAction)safari:(id)sender;

@end

@implementation NYSCSheelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 获取服务器中的配置参数（热启动不需要调用此方法）
    [NYSCake updataServerParameters];
}

- (IBAction)safari:(id)sender {
    [self presentViewController:[[NYSWebViewController alloc] init] animated:YES completion:nil];
}
@end
```

## Remind
* ARC
* iOS>=8.0
* iPhone \ iPad screen anyway