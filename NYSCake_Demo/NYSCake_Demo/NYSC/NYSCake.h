//
//  NYSCake.h
//  cake
//
//  Created by 倪刚 on 2018/9/24.
//  Copyright © 2018年 NiYongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

//NS_ASSUME_NONNULL_BEGIN

typedef void (^SheelBlock)(void);
typedef void (^ApplicationBlock)(void);

typedef enum : NSUInteger {
    BootFrom_Sheel,
    BootFrom_Application,
} BootFromType;

/**
 引导模式

 - NYSCBootMethod_Cold: 冷启动
 - NYSCBootMethod_Hot: 热启动
 */
typedef NS_ENUM(NSInteger,NYSCBootMethod)
{
    NYSCBootMethod_Cold = 0,
    
    NYSCBootMethod_Hot = 1,
};

/**
 启动优先级

 - NYSCPriorityType_Normal: 默认
 
 - NYSCPriorityType_Sheel: 壳优先
 
 - NYSCPriorityType_Application: 应用优先
 */
typedef NS_ENUM(NSInteger,NYSCPriorityType)
{
    NYSCPriorityType_Server_Version = 0,
    
    NYSCPriorityType_Server_Timestamp = 1,
    
    NYSCPriorityType_Server_Status = 2,
};

@interface NYSCake : NSObject
/**
 初始化
 
 @param days 预计审核天数
 @param postURL post请求地址
 @param parameter post验证参数
 @param method 启动方式
 */
+ (void)initWithEstimatedAuditDays:(NSInteger)days PostURL:(NSString *)postURL ValidateParameters:(NSDictionary *)parameter BootMethod:(NYSCBootMethod)method;

/**
 选择启动控制器
 
 @param priorityType 启动优先级类型
 @param bootFromType 出错回调
 @param sheelBlock 壳回调
 @param applicationBlock 正常应用回调
 */
+ (void)chooseViewControllerWithPriorityType:(NYSCPriorityType)priorityType errorBootFromType:(BootFromType)bootFromType matchSheelBlock:(SheelBlock)sheelBlock ApplicationBlock:(ApplicationBlock)applicationBlock;

/**
 更新服务器中的配置参数
 */
+ (void)updataServerParameters;

/**
 恢复初始状态
 */
+ (void)restoreDefaults;
@end

//NS_ASSUME_NONNULL_END
