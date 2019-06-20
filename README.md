![(logo)](https://github.com/niyongsheng/NYSMC/blob/master/logo.png?raw=true)
NYSMC
===
[![](https://img.shields.io/badge/platform-iOS-orange.svg)](https://developer.apple.com/ios/)
[![](http://img.shields.io/travis/CocoaPods/CocoaPods/master.svg?style=flat)](https://travis-ci.org/CocoaPods/CocoaPods)
[![](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/niyongsheng/NYSMC/blob/master/LICENSE)
===
* 自动选择加载“壳应用”/“真应用”的简单框架。
* Auto Choose Sheel/Application framework.

## <a id="How_to_use"></a>How to use
* Installation with CocoaPods：`pod 'NYSMC','~>0.2.0'`
* Manual import：
    * Drag All files in the `NYSMC` folder to project
    * Import the main file：`#import <NYSMC/NYSMC.h>`

## <a id="Application_Instance_by_NYSMC"></a>Application Instance by NYSMC
Running MOV | Flow Chart Image
------------ | -------------
<img src="https://raw.githubusercontent.com/niyongsheng/NYSMC/master/Demonstration.mov" width="220" height="370"> | <img src="https://raw.githubusercontent.com/niyongsheng/NYSMC/master/%20flowChart.png" width="670" height="370">
### - Example Program
> <img src="https://github.com/niyongsheng/NYSMC/blob/master/IMG_0049.jpg?raw=true" width="350" height="240">

## <a id="Server_API_Pattern:"></a>Server API Pattern:
* Step 1.Need Server API 
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

* Step 2.AppDelegate.m
```objc
#import <NYSMC/NYSMC.h>
#import "tabViewController.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // I.初始化NYSC
    [NYSCake initWithEstimatedAuditDays:2 PostURL:@"http://xxx.NYSMC.com:8080/api/getReviewData" ValidateParameters:PARM BootMethod:NYSCBootMethod_Cold];
    // II.选择分支
    [NYSCake chooseViewControllerWithPriorityType:NYSCPriorityType_Server_Status errorBootFromType:BootFrom_Sheel matchSheelBlock:^{
        // 马甲
        self.window.rootViewController = [[tabViewController alloc] init];
        [self.window makeKeyAndVisible];
    } ApplicationBlock:^{
        // 应用
        self.window.rootViewController = [[NYSWebViewController alloc] init];
        [self.window makeKeyAndVisible];
    }];
    
    // III.获取服务器中的配置参数（热启动不需要调用此方法）
    [NYSCake updataServerParameters];
    
    return YES;
}
```

## <a id="NO_Server_API_Pattern:"></a>NO Server API Pattern:
* Step 1.Add Shell
   > XCode->Product->Scheme->Edit Scheme->Build->Pre-actions->Add new shell(New run script action)
```shell
echo "In the build time script run."
infoplist="$BUILT_PRODUCTS_DIR/$INFOPLIST_PATH"
builddate=`date`
if [[ -n "$builddate" ]]; then
# if BuildDateString doesn't exist, add it
/usr/libexec/PlistBuddy -c "Add :BuildDate string $builddate" ${infoplist}
# and if BuildDateString already existed, update it
/usr/libexec/PlistBuddy -c "Set :BuildDate string $builddate" ${infoplist}
fi
```
* Step 2.AppDelegate.m
```objc
#import <NYSMC/NYSMC.h>

#import "SheelViewController.h"
#import "ApplicationViewController.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // I.初始化NYSC
    [NYSCake initWithEstimatedAuditDays:2 PostURL:nil ValidateParameters:nil BootMethod:NYSCBootMethod_Cold];
    // II.选择分支
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

## Remind
- [x] ARC
- [x] iOS >= 8.0
- [x] iPhone \ iPad screen anyway

## Contribution
Reward[:lollipop:](https://github.com/niyongsheng/niyongsheng.github.io/blob/master/Beg/README.md)  Encourage[:heart:](https://github.com/niyongsheng/NYSMC/stargazers)

## Contact Me [:octocat:](https://niyongsheng.github.io)
* QQ: 2672688843
* E-mail: niyongsheng@Outlook.com
* Weibo: [@Ni永胜](https://weibo.com/u/2198015423)
