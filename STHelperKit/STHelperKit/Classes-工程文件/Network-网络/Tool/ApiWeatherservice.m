//
//  ApiWeatherservice.m
//  STHelperKit
//
//  Created by 沈兆良 on 16/8/1.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

#import "ApiWeatherservice.h"

@implementation ApiWeatherservice
- (instancetype)init
{
    self = [super init];
    if (self) {
        _cityname = @"";
    }
    return self;
}

- (NSString *)requestUrl
{
    return @"/apistore/weatherservice/citylist?" ;
}
- (NSDictionary *)requestArgument
{
    return @{@"cityname":self.cityname};
}

- (NSDictionary *)requestHeaderFieldValueDictionary
{
    NSDictionary *infoDictionary = [NSBundle mainBundle].infoDictionary;
    NSString *apikey = [infoDictionary valueForKeyPath:@"STCommon.BaiduApikey"];
    return @{@"apikey":apikey};
}
@end
