//
//  IWPFWeatherViewController.m
//  iwpf
//
//  Created by Chen Li on 16/9/19.
//  Copyright © 2016年 Chen Li. All rights reserved.
//

#import "IWPFWeatherViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIBarButtonItem+Helper.h"
#import "UIViewController+MMDrawerController.h"

#import "IWPFCurrentWeatherCell.h"
#import "IWPFWeatherDataHelper.h"


@implementation IWPFWeatherViewController

@synthesize tableView                   = _tableView;
@synthesize currentTableViewTitle       = _currentTableViewTitle;

- (instancetype)init
{
    self = [super init];
    if  (self)
    {
    }
    return self;
}

- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // view controller 设置
    [self viewConfigure];
    //    // table view 设置
    [self tableViewConfigure];
    // 导航栏设置
    [self navigationConfigure];
    
    [self locationManager];
    [self startUpdatingLocation];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark - MMDrawerController

- (void)addSiteViewController:(id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)showMoreInformationViewController:(id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kNumberOfSections;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kRowsInSection;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row)
    {
        case IWPFScrollViewCellTypeCurrentWeather:
        {
            IWPFCurrentWeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellTypeCurrentWeatherIdentifier];
            if (!cell)
            {
                cell = [[IWPFCurrentWeatherCell alloc] initWithInformation:[self informationDictionary]
                                                                     frame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, kCellTypeCurrentWeatherHeight)];
            }
            cell.weatherInformation = [self informationDictionary];
            cell.selectionStyle = NO;
            return cell;
        }
            break;
        case IWPFScrollViewCellTypeTomorrowWeather:
        case IWPFScrollViewCellTypeForecastWeather:
        case IWPFScrollViewCellTypeWeatherMap:
        default:
        {
            static NSString *CellIdentifier = @"Cell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cell.textLabel.text = [NSString stringWithFormat:@"Main %ld", (long)indexPath.row];
            cell.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.1];
            
            cell.selectionStyle = NO;
            return cell;
            break;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case IWPFScrollViewCellTypeCurrentWeather:
            return kCellTypeCurrentWeatherHeight;
            break;
        case IWPFScrollViewCellTypeTomorrowWeather:
            return kCellTypeTomorrowWeatherHeight;
            break;
        case IWPFScrollViewCellTypeForecastWeather:
            return kCellTypeForecastWeatherHeight;
            break;
        case IWPFScrollViewCellTypeWeatherMap:
            return kCellTypeWeatherMapHeight;
            break;
        default:
            return kCellTypeDefaultHeight;
            break;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

#pragma mark - Private Methods

- (void)viewConfigure
{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)tableViewConfigure
{
    [self.view addSubview:self.itemTableView];
}

- (UITableView *)itemTableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(ZERO, ZERO, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _tableView.bounces = YES;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor clearColor];//[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}





- (void)navigationConfigure
{
    
    self.navigationItem.title                   = @"天气";
    
    NSString *localtion                         = [[NSString alloc] initWithFormat:@"北土城西路"];
    
    MMDrawerBarButtonItem *leftBarButtonItem    = [MMDrawerBarButtonItem itemWithTitle:localtion backgroundImage:nil normalColor:[UIColor whiteColor] highlightedColor:[UIColor redColor] target:self action:@selector(addSiteViewController:)];
    MMDrawerBarButtonItem *rightBarButtonItem   = [MMDrawerBarButtonItem itemWithTitle:@"更多" backgroundImage:nil normalColor:[UIColor whiteColor] highlightedColor:[UIColor redColor] target:self action:@selector(showMoreInformationViewController:)];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;

    self.navigationController.navigationBar.translucent = YES;
}





#pragma mark - 定位授权
- (CLLocationManager *)locationManager
{
    if (_locationManager == nil)
    {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
        {
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    return _locationManager;
}

- (CLAuthorizationStatus)authorizationStatus
{
    return [CLLocationManager authorizationStatus];
}

/**
 获取到的位置信息就会调用

 @param manager   触发事件的对象
 @param locations 获取到的位置
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    IWPFLog(@"locationManager manager = %@", manager);
    IWPFLog(@"locationManager locations = %@", locations);
    
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    IWPFLog(@"纬度：%f , 经度：%f", coordinate.latitude , coordinate.longitude);
    IWPFLog(@"海拔：%f , 航向：%f , 速度：%f", location.altitude , location.course , location.speed);
    
    
    IWPFLog(@"+++++ %s", __func__);
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0)
        {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            IWPFLog(@"获取到的信息 = %@", placemark.name);
            
            //获取城市
            NSString *city = placemark.locality;
            if (!city)
            {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
            }
            IWPFLog(@"city = %@", city);
            
        }
        else if (error == nil && [placemarks count] == 0)
        {
            IWPFLog(@"No results were returned.");
        }
        else if (error != nil)
        {
            IWPFLog(@"An error occurred = %@", error);
        }
    }];
    
    
    
 //   IWPFLog(@"longitude = %f", ((CLLocation *)[locations lastObject]).coordinate.longitude);
   // IWPFLog(@"latitude = %f", ((CLLocation *)[locations lastObject]).coordinate.latitude);
    
    
    
    [self.locationManager stopUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusNotDetermined)
    {
        IWPFLog(@"等待用户授权");
    }
    else if (status == kCLAuthorizationStatusAuthorizedAlways ||
             status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        IWPFLog(@"授权成功");
        [self startUpdatingLocation];
    }
    else
    {
        IWPFLog(@"授权失败");
    }
}

- (void)startUpdatingLocation
{
    [self.locationManager startUpdatingLocation];
}

- (void)getAddress:(CLLocation *)location
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
    {
        if (error) {
            IWPFLog(@"error: %@", error);
            // if ([self.delegate respondsToSelector:@selector(locationToolLocationFailed)]) {
            //    [self.delegate locationToolLocationFailed];
            // }
            return;
        }
        CLPlacemark *placemark = [placemarks firstObject];
        CLLocation *location = placemark.location;
        NSDictionary *addressDic = placemark.addressDictionary;
        // self.currentLocationLongitude = @(location.coordinate.longitude);
        // self.currentLocationLatitude  = @(location.coordinate.latitude);
        NSString *state = placemark.administrativeArea;
        NSString *cityname = placemark.locality;
        NSString *cityid = nil;
        BOOL isChinese = NO;
        for (int i = 0; i < cityname.length; i++) {
            unichar character = [cityname characterAtIndex:i];
            if (0x4e00 < character && character < 0x9fff) {
                isChinese = YES;
            }
        }
        if (isChinese) {
            state = [state substringToIndex:state.length -1];
            cityname = [cityname substringToIndex:cityname.length -1];
            cityid = [IWPFWeatherDataHelper cityidOfCityname:cityname];
        }
        IWPFLog(@"addressDic: %@", addressDic);
        IWPFLog(@"cityid: %@", cityid);
        IWPFLog(@"cityname: %@", cityname);
        IWPFLog(@"state: %@", state);
        // if (![cityname isEqualToString:[SRLocationTool sharedInstance].currentLocationCity]) {
        //    [SRLocationTool sharedInstance].currentLocationCity = cityname;
        //    [SRLocationTool sharedInstance].currentLocationState = state;
        //     if ([self.delegate respondsToSelector:@selector(locationToolLocationSuccess)]) {
        //        [self.delegate locationToolLocationSuccess];
        //    }
        //}
    }];
}






#pragma mark - 假数据
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
