//
//  IWPFLaunchViewController.m
//  FunctionDemo
//
//  Created by Chen Li on 16/9/26.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "AllViewControllersTool.h"
#import "IWPFCommunicationHelper.h"
#import "IWPFLaunchViewController.h"
#import "IWPFTools.h"
#import "SVProgressHUD.h"
#import "MacroOfDefine.h"
#import "Masonry.h"

@interface IWPFLaunchViewController ()

@property (nonatomic, strong) UIImageView *launchBackgroundImageView;
@property (nonatomic, strong) UIImageView *markImageView;
@property (nonatomic, strong) NSTimer     *launchTimer;

@end

@implementation IWPFLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.launchBackgroundImageView];
    [self.view addSubview:self.markImageView];
    
//    // 自动约束方法
//    __weak typeof (self) vc = self;
//    [_markImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        // 约束宽高
//        CGFloat width       = vc.view.bounds.size.width * 0.5;
//        CGFloat height      = width * 0.4;
//        make.size.mas_equalTo(CGSizeMake(width, height));
//        // 约束相对坐标
//        CGFloat viewHeight  = vc.view.bounds.size.height / 4;
//        make.centerX.equalTo(vc.view.mas_centerX);
//        make.centerY.mas_equalTo(vc.view.mas_centerY).offset(-viewHeight);
//    }];
//    
//    [self loadLaunchImageView];
//    
//    [self getNewImage];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:3.0
                     animations:^{
                         CGRect rect = _launchBackgroundImageView.frame;
                         rect.origin = CGPointMake(-100, -100);
                         rect.size   = CGSizeMake(rect.size.width + 200, rect.size.height + 200);
                         _launchBackgroundImageView.frame = rect;
                                }
                     completion:^(BOOL finished) {
                         [AllViewControllersTool createViewControllerWithIndex:0];
                                }
    ];
}

#pragma mark - 网络获取 launchImage

- (void)loadLaunchImageView
{
    NSData *imageData = [IWPFTools readUserDefaults:LAUNCH_IMAGEVIEW_NAME];
    if (imageData)
    {
        self.launchBackgroundImageView.image = [UIImage imageWithData:imageData];
    }
}

- (void)getNewImage
{
    [IWPFCommunicationHelper requestMethUsePostWithPath:HTTPS_LAUCH_SCREEN_IMAGE
                                             params:nil
                                            success:^(id responseObject) {
                                                        NSString *imageURL  = [[responseObject objectForKey:@"data"] objectForKey:@"picurl"];
                                                        NSData *imageData   = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
                                                        [IWPFTools writeUserDefaults:LAUNCH_IMAGEVIEW_NAME value:imageData];
                                                    }
                                            failure:^(NSError *error) {
                                                        [SVProgressHUD showErrorWithStatus:@"无法连接, 请检查网络设置"];
                                                    }
    ];
}


#pragma mark - 本地加载 launchImage

- (UIImageView *)launchBackgroundImageView
{
    if (!_launchBackgroundImageView)
    {
        _launchBackgroundImageView                  = [[UIImageView alloc] init];
        _launchBackgroundImageView.frame            = self.view.frame;
        _launchBackgroundImageView.backgroundColor  = [UIColor cyanColor];
        _launchBackgroundImageView.image            = [UIImage imageNamed:LAUNCH_STATIC_IMAGE_NAME];
    }
    return _launchBackgroundImageView;
}

- (UIImageView *)markImageView
{
    if (!_markImageView)
    {
        _markImageView                  = [[UIImageView alloc] init];
        _markImageView.image            = [UIImage imageNamed:LAUNCH_SPLASH_LOGO_IMAGE_NAME];
        _markImageView.backgroundColor  = [UIColor clearColor];
    }
    return _markImageView;
}


@end
