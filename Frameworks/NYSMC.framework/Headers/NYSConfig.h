//
//  NYSConfig.h
//  cake
//
//  Created by 倪刚 on 2018/9/24.
//  Copyright © 2018年 NiYongsheng. All rights reserved.
//

#ifndef NYSConfig_h
#define NYSConfig_h

#define NYSCakeSrcName(file) [@"images.bundle" stringByAppendingPathComponent:file]
#define NYSCakeFrameworkSrcName(file) [@"Resources/images.bundle" stringByAppendingPathComponent:file]

#define NYSC_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define NYSC_ScreenHeight [UIScreen mainScreen].bounds.size.height

#define NYSC_Height_TabBar ((NYSC_Height_StatusBar > 20) ? 83 : 49)
#define NYSC_Height_StatusBar CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame])

#define NYSC_Version_Key @"CFBundleShortVersionString"

#ifdef DEBUG
#define NLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NLog(...)
#endif

#endif /* NYSConfig_h */
