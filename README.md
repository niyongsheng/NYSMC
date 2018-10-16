![(logo)](https://github.com/niyongsheng/NYSMC/blob/master/MC_logo.png?raw=true)
NYSMC
===
[![](https://img.shields.io/badge/platform-iOS-orange.svg)](https://developer.apple.com/ios/)
[![](http://img.shields.io/travis/CocoaPods/CocoaPods/master.svg?style=flat)](https://travis-ci.org/CocoaPods/CocoaPods)
[![](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/niyongsheng/NYSMC/blob/master/README.md)
===
* 自动选择加载“壳应用”/“真应用”的简单框架。
* Auto Choose Sheel/Application framework.

## <a id="How_to_use:"></a>How to use:
* Installation with CocoaPods：`pod 'NYSMC'`
* Manual import：
    * Drag All files in the `NYSMC` folder to project
    * Import the main file：`#import <NYSMC/NYSMC.h>`

## <a id="Application_Startup_Example_by_NYSMC"></a>Application Startup Example by NYSMC
<img src="https://raw.githubusercontent.com/niyongsheng/NYSMC/master/Demonstration.mov" width="200" height="350">
<img fc="https://raw.githubusercontent.com/niyongsheng/NYSMC/blob/master/flowChart.png" width="200" height="350">
<!-- ## <a id="The_Framework_Structure_Chart_of_NYSMC"></a>The Framework Structure Chart of NYSMC
![](http://images0.cnblogs.com/blog2015/497279/201506/132232456139177.png)
<img src="http://images0.cnblogs.com/blog2015/497279/201506/141358159107893.png" width="30%" height="30%">

- `The class of non-red text` in the chart：For inheritance，to use DIY the control of refresh
- About how to DIY the control of refresh，You can refer the Class in below Chart<br> -->

## <a id="Need_Server_API"></a>Need Server API 
```java
/** 需要后端组的同学准备一个接口 */
// Method: POST
// Server: http://xxx.NYSMC.com:8080
// API: /api/getReviewData
// Parameters: PARM
/* JSON返回数据结构：*/
{
    "param": {},
    "error": null,
    "returnValue": {
        "gmtCreate": "2018-06-25 11:12:35",
        "gmtModify": null,
        "id": 1,
        "version": "1.0", //（审核中版本号）
        "reviewTime": 1534419240000, //（预计审核完成时间）
        "url": "github.com/niyongsheng", //（链接地址）
        "status": 0 //（马甲开关：0关闭  1开启）
    },
    "msg": null,
    "list": null,
    "unread": null,
    "type": null,
    "success": true
}
```

## <a id="AppDelegate.m"></a>AppDelegate.m
```objc
/** Integration step 1. */
#import <NYSMC/NYSMC.h>

#import "SheelViewController.h"
#import "ApplicationViewController.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化NYSC
    [NYSCake initWithEstimatedAuditDays:2 PostURL:@"http://xxx.NYSMC.com:8080/api/getReviewData" ValidateParameters:PARM BootMethod:NYSCBootMethod_Cold];
    // 选择分支
    [NYSCake chooseViewControllerWithPriorityType:NYSCPriorityType_Server_Version errorBootFromType:BootFrom_Application matchSheelBlock:^{
    	// 马甲
        self.window.rootViewController = [[SheelViewController alloc] init];
        [self.window makeKeyAndVisible];
    } ApplicationBlock:^{
    	// 应用
        self.window.rootViewController = [[ApplicationViewController alloc] init];
        [self.window makeKeyAndVisible];
    }];
    return YES;
}
```
## <a id="SheelViewController.m"></a>SheelViewController.m
```objc
/** Integration step 2. */
#import "SheelViewController.h"
#import <NYSMC/NYSMC.h>

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
* iOS >= 8.0
* iPhone \ iPad screen anyway

## Contribution
Contributions🍭 are welcomed and encouraged❤️.

## Contact Me📩
* E-mail: (niyongsheng@Outlook.com,niyongsheng@Gmail.com)
* Weibo: [@Ni永胜](https://weibo.com/u/2198015423)
