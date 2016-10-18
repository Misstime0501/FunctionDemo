//
//  IWPFWeatherMapCell.m
//  FunctionDemo
//
//  Created by Chen Li on 16/10/11.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFWeatherMapCell.h"

#define HEATMAP_RADIUS                      20
#define HEATMAP_OPACITY                     0.6

@implementation IWPFWeatherMapCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self setBackgroundColor:[UIColor greenColor]];
        [self setFrame:frame];
        
        [self createHeatMapTileOverLay];
        [self setRadius:HEATMAP_RADIUS];
        [self setOpacity:HEATMAP_OPACITY];
        [self setGradient];
        
        [self createMapView];
    }
    return self;
}




- (void)createHeatMapTileOverLay
{
    self.heatMapTileOverlay = [[MAHeatMapTileOverlay alloc] init];
    NSMutableArray *data = [NSMutableArray  array];
    NSData *jsdata = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"locations" ofType:@"json"]];
    @autoreleasepool {
        if (jsdata)
        {
            NSArray *dicArray = [NSJSONSerialization JSONObjectWithData:jsdata options:NSJSONReadingAllowFragments error:nil];
            for (NSDictionary *dic in dicArray)
            {
                MAHeatMapNode *node = [[MAHeatMapNode alloc] init];
                CLLocationCoordinate2D coordinate;
                coordinate.latitude = [dic[@"lat"] doubleValue];
                coordinate.longitude = [dic[@"lng"] doubleValue];
                node.coordinate = coordinate;
                
                node.intensity = [dic[@"count"] doubleValue]; // 设置权重
                [data addObject:node];
            }
        }
    }
    
    self.heatMapTileOverlay.allowRetinaAdapting = YES;
    self.heatMapTileOverlay.data = data;
}

- (void)createMapView
{
    self.mapView = [[MAMapView alloc] initWithFrame:self.frame];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    
    [self.mapView addOverlay:self.heatMapTileOverlay];
    
    [self addSubview:self.mapView];
}





#pragma mark - mapview delegate

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MATileOverlay class]])
    {
        MATileOverlayRenderer *render = [[MATileOverlayRenderer alloc] initWithTileOverlay:overlay];
        return render;
    }
    return nil;
}





- (void)setGradient
{
    [self.heatMapTileOverlay setGradient:[[MAHeatMapGradient alloc] initWithColor:@[[UIColor blueColor], [UIColor greenColor],[UIColor redColor]] andWithStartPoints:@[@(0.2), @(0.5),@(0.7)]]];
    //    [self.heatMapTileOverlay
    //     setGradient:[[MAHeatMapGradient alloc] initWithColor:@[[UIColor blueColor], [UIColor greenColor],[UIColor redColor]] andWithStartPoints:@[@(0.2), @(0.5),@(0.9)]]];
    //    [self.heatMapTileOverlay
    //     setGradient:[[MAHeatMapGradient alloc] initWithColor:@[[UIColor redColor], [UIColor blueColor],[UIColor greenColor]] andWithStartPoints:@[@(0.4), @(0.6), @(0.8)]]];
    //    [self.heatMapTileOverlay
    //     setGradient:[[MAHeatMapGradient alloc] initWithColor:@[[UIColor grayColor],[UIColor brownColor], [UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor redColor]] andWithStartPoints:@[@(0.1),@(0.3),@(0.5), @(0.6), @(0.8),@(0.9)]]];
}

- (void)setRadius:(NSInteger)radius
{
    [self.heatMapTileOverlay setRadius:radius];
}

- (void)setOpacity:(CGFloat)opacity
{
    [self.heatMapTileOverlay setOpacity:opacity];
}





- (void)refreshHeatMap
{
    MATileOverlayRenderer *render = (MATileOverlayRenderer *)[self.mapView rendererForOverlay:self.heatMapTileOverlay];
    [render reloadData];
}















@end
