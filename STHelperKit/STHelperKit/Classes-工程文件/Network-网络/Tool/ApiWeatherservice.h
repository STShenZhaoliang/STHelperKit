//
//  ApiWeatherservice.h
//  STHelperKit
//
//  Created by 沈兆良 on 16/8/1.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "YTKRequest.h"

@interface ApiWeatherservice : YTKRequest
/** 1.城市中文名称 */
@property (nonatomic, strong) NSString *cityname;
@end
