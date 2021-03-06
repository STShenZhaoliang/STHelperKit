//
//  STCommon.h
//  STHelperKit
//
//  Created by 沈兆良 on 16/8/1.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import <Foundation/Foundation.h>

// Get weak reference object.
#define WeakObject(object) __weak __typeof(object) weakObject = object;

// Get weak reference object.
#define Weak(caller, object) __weak __typeof(object) caller = object;

#define STWeakSelf(type)  __weak typeof(type) weak##type = type;
#define STStrongSelf(type)  __strong typeof(type) type = weak##type;

// Get strong reference object.
#define StrongObject(object) __strong __typedef(object) strongObject = object;

// Get dispatch_get_main_queue()
#define MainThread (dispatch_get_main_queue())

// Get default dispatch_get_global_queue
#define GlobalThread dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

// Radians convert to degress.
#define RadiansToDegrees(radians) ((radians) * (180.0 / M_PI))

// Degrees convert to randians.
#define DegreesToRadians(angle) ((angle) / 180.0 * M_PI)

// Fast to get iOS system version
#define IOSVersion ([UIDevice currentDevice].systemVersion.floatValue)

// More fast way to get app delegate
#define kAppDelegate ((AppDelegate *)[[UIApplication  sharedApplication] delegate])

#pragma mark - Load Font
// Generate font with size
#define FontWithSize(size) [UIFont systemFontOfSize:size]

// Generate bold font with size.
#define BoldFontWithSize(size) [UIFont boldSystemFontOfSize:size]

#pragma mark - Load Image

// More easy way to load an image.
#define Image(Name) ([UIImage imageNamed:Name])

// More easy to load an image from file.
#define ImageOfFile(Name) ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@#Name ofType:nil]])

#pragma mark - System Singletons

// More easy way to get user default object.
#define UserDefaults [NSUserDefaults standardUserDefaults]

// More easy way to get NSNotificationCenter object.
#define NotificationCenter  [NSNotificationCenter defaultCenter]

// More easy way to get [NSFileManager defaultManager]
#define FileManager [NSFileManager defaultManager]

// More easy way to post a notification from notification center.
#define PostNotificationWithName(notificationName) \
[NotificationCenter postNotificationName:notificationName object:nil userInfo:nil]

// More easy way to post a notification with user info from notification center.
#define PostNotificationWithNameAndUserInfo(notificationName, userInfo) \
[NotificationCenter postNotificationName:notificationName object:nil userInfo:userInfo]

//16.沙盒目录文件
//获取temp
#define kPathTemp NSTemporaryDirectory()

//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//17.GCD 的宏定义
//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

@interface STCommon : NSObject

@end
