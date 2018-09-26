//
//  NYSCTool.h
//  cake
//
//  Created by 倪刚 on 2018/9/24.
//  Copyright © 2018年 NiYongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NYSCTool : NSObject
/**
 比较两个版本号的大小
 
 @param v1 第一个版本号
 @param v2 第二个版本号
 @return 版本号相等,返回0; v1小于v2,返回-1; 否则返回1.
 */
+ (NSInteger)compareVersion:(NSString *)v1 to:(NSString *)v2;

/**
 字典转转Json字符串
 
 @param infoDict 传入字典
 @return 返回Json字符串
 */
+ (NSString*)convertToJSONData:(id)infoDict;

@end

NS_ASSUME_NONNULL_END
