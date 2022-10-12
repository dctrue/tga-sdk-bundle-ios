//
//  ViewController.m
//  Created on 2022/9/10
//  Description <#文件描述#>
//  PD <#产品文档地址#>
//  Design <#设计文档地址#>
//  Copyright © 2022 TGASDK. All rights reserved.
//  @author 刘小彬(liuxiaomike@gmail.com)
//

#import "ViewController.h"
#import "TGASDK/TGASDK-Swift.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, TGASdkDelegate>
@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSArray<NSString*> *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"TGADemo";
    [self configView];
    [self configLocation];
}

#pragma mark - configView
-(void)configView {
    [self.view addSubview: self.tableView];
}

#pragma mark - configLocation
-(void)configLocation {
    [[self.tableView.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor] setActive:true];
    [[self.tableView.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor] setActive: true];
    [[self.tableView.topAnchor constraintEqualToAnchor: self.view.topAnchor] setActive:true];
    [[self.tableView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor] setActive:true];
}

#pragma  mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.array[indexPath.row];
    return  cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            
            TGASdk.shared.configuration.lang = [NSLocale currentLocale].languageCode;
            TGASdk.shared.configuration.statusBarStyle = UIStatusBarStyleLightContent;
            TGASdk.shared.configuration.navigationBackImage = [UIImage imageNamed:@"navigation_back_default"];
            [tableView deselectRowAtIndexPath:indexPath animated:true];
            break;
        }
        case 1:
        {
            [TGASdk.shared initSdkWithEnv:nil appKey:@"" authCode:nil delegate:self];
            break;
        }
        default:
        {
            [TGASdk.shared openGameCenterWithSecUrl:nil secTitle:nil];
            break;
        }
    }
}

#pragma MARK - TGASDKDelegate

-(void)tgaSdkInitSucceed {
    NSLog(@"register success");
}

-(void)tgaSdkInitError:(NSError *)error {
    NSLog(@"%@", [[NSString alloc] initWithFormat:@"%@%@", @"error reason: ", error.localizedDescription]);
}

-(void)tgaSdkGetAuthCodeWithCompletion:(void (^)(NSString * _Nullable))completion {
    NSLog(@"callback, authCode: Call your own server to get the login credential authCode");
}

-(void)tgaSdkCloseGameCenter {
    NSLog(@"close game Controller");
}

-(void)tgaSdkOnLogout {
    NSLog(@"sdkOnLogout");
}


#pragma lazy view
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.rowHeight = 50;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell self] forCellReuseIdentifier:@"UITableViewCell"];
        _tableView.translatesAutoresizingMaskIntoConstraints = false;
    }
    return  _tableView;
}

-(NSArray<NSString *> *)array {
    if(!_array) {
        _array = @[@"配置", @"初始化SDK", @"打开游戏中心"];
    }
    return _array;
}

@end
