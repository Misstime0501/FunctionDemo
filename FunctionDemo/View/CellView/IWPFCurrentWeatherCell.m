//
//  IWPFCurrentWeatherCell.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/21.
//  Copyright © 2016年 Chen Li. All rights reserved.
//


#import "IWPFCurrentWeatherCell.h"
#import "IWPFTools.h"
#import "IWPFWeatherDataHelper.h"


#import "Masonry.h"


@implementation IWPFCurrentWeatherCell

@synthesize currentWeatherView = _currentWeatherView;
@synthesize currentWeatherState = _currentWeatherState;

- (instancetype)initWithInformation:(NSDictionary *)weatherInformation frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor greenColor];

        
        [self currentWeather:[weatherInformation objectForKey:@"CurrentWeather"]];
        [self.currentWeatherView addSubview:self.currentWeather];
        
        [self currentWeatherState:[weatherInformation objectForKey:@"CurrentWeatherState"]];
        [self.currentWeatherView addSubview:self.currentWeatherState];
        
        
        [self addSubview:self.currentWeatherView];
        [self setupConstrain:frame];
        
        
    }
    return self;
}




#pragma mark - 当前天气信息详细界面
// 承载画布
- (UIView *)currentWeatherView
{
    if (_currentWeatherView == nil)
    {
        _currentWeatherView = [[UIView alloc] init];
        _currentWeatherView.backgroundColor = [UIColor redColor];
    }
    return _currentWeatherView;
}

// 当前温度
- (UILabel *)currentWeather:(NSString *)currentWeather
{
    if  (_currentWeather == nil)
    {
        _currentWeather = [[UILabel alloc] init];
        
        _currentWeather.adjustsFontSizeToFitWidth = YES;
        _currentWeather.backgroundColor = [UIColor blueColor];
        _currentWeather.numberOfLines = 0;
        _currentWeather.text = [IWPFTools safeString:currentWeather];
        _currentWeather.textColor = [UIColor orangeColor];
        _currentWeather.textAlignment = NSTextAlignmentLeft;
        _currentWeather.font = [UIFont systemFontOfSize:120];
        _currentWeather.userInteractionEnabled = YES;
        UITapGestureRecognizer *currentWeatherTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                             action:@selector(currentWeatherTapGestureRecognizer:)];
        [_currentWeather addGestureRecognizer:currentWeatherTapGestureRecognizer];
    }
    return _currentWeather;
}

- (void)currentWeatherTapGestureRecognizer:(UITapGestureRecognizer *)recognizer
{
    IWPFLog(@"当前温度文字框被点击");
    
    [IWPFWeatherDataHelper fetchWeatherDataCityName:@"北京"
                                            success:^(id responseObject) {
                                                
                                                IWPFLog(@"气象返回信息 = %@" , responseObject);
        
                                            }
                                            failure:^(NSError *error) {
                                                
                                                IWPFLog(@"气象返回的错误信息 = %@", error);
        
    }];
    
    
    
}

// 当前状态
- (UILabel *)currentWeatherState:(NSString *)currentWeatherState
{
    if (_currentWeatherState == nil)
    {
        _currentWeatherState = [[UILabel alloc] init];
        
        _currentWeatherState.adjustsFontSizeToFitWidth = YES;
        _currentWeatherState.backgroundColor = [UIColor grayColor];
        _currentWeatherState.numberOfLines = 0;
        _currentWeatherState.text = @"多云";[IWPFTools safeString:currentWeatherState];
        _currentWeatherState.textColor = [UIColor orangeColor];
        _currentWeatherState.textAlignment = NSTextAlignmentLeft;
        _currentWeatherState.font = [UIFont systemFontOfSize:60];
    }
    return _currentWeatherState;
}













// 自适应排布
- (void)setupConstrain:(CGRect)frame
{
    __weak typeof(self)vc = self;
    
    [vc.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(frame.origin.y);
        make.left.mas_equalTo(frame.origin.x);
        make.right.mas_equalTo(frame.size.width);
        make.bottom.mas_equalTo(frame.size.height);
    }];
    
    [vc.currentWeatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.contentView.mas_top);
        make.left.equalTo(vc.contentView.mas_left);
        make.width.mas_equalTo(frame.size.width * 0.75);
        make.height.mas_equalTo(frame.size.height * 0.8);
    }];

    [vc.currentWeather mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(vc.currentWeatherView.mas_top).with.offset(frame.size.width * 0.05);
        make.left.mas_equalTo(vc.currentWeatherView.mas_left).with.offset(frame.size.width * 0.05);
        make.right.mas_equalTo(vc.currentWeatherView.mas_centerX);
        make.height.mas_equalTo(vc.currentWeather.mas_width).multipliedBy(0.7);
    }];
    
    [vc.currentWeatherState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.currentWeather.mas_top).multipliedBy(1.3);
        make.left.equalTo(vc.currentWeather.mas_right);
        make.width.mas_equalTo(vc.currentWeather.mas_width).multipliedBy(0.5);
        make.height.mas_equalTo(vc.currentWeather.mas_height).multipliedBy(0.5);
    }];
    
    
    
}






@end
