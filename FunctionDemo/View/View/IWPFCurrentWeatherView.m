//
//  IWPFCurrentWeatherView.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/21.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFCurrentWeatherView.h"

@implementation IWPFCurrentWeatherView
@synthesize weatherInformationDictionary = _weatherInformationDictionary;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        
        
        
        
    }
    return self;
}



- (void)drawCurrnetWeather:(NSString *)currentWeather
{
    _currentWeather = [UIButton buttonWithType:UIButtonTypeCustom];
    _currentWeather.frame = CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT);
    _currentWeather.backgroundColor = [UIColor clearColor];
    
    _currentWeather.titleLabel.font = [UIFont fontWithName:@"Arial" size:16];
    
    
    
}


- (NSMutableDictionary *)informationDictionary
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setValue:@"27°" forKey:@"CurrentWeather"];
    [dictionary setValue:@"46%" forKey:@"CurrentHumidity"];
    [dictionary setValue:@"1" forKey:@"CurrentWind"];
    [dictionary setValue:@"东南" forKey:@"CurrentWindDirection"];
    [dictionary setValue:@"700 hpa" forKey:@"CurrentAtmosphericPressure"];
    [dictionary setValue:@"112" forKey:@"CurrentPollution"];
    
    return dictionary;
}


@end
