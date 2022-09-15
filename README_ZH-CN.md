# TGASDK

[![languages](https://img.shields.io/badge/languages-Swift%20%7C%20ObjC-blue.svg)](https://img.shields.io/badge/languages-Swift%20%7C%20ObjC-blue.svg)
[![Swift](https://img.shields.io/badge/Swift-5.3_5.4_5.5_5.6-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.3_5.4_5.5_5.6-Orange?style=flat-square)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/TGASDK.svg?style=flat-square)](https://img.shields.io/cocoapods/v/TGASDK.svg)
[![Platform](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)


## Requirements
- **iOS** 10.0+
- Xcode 10.0+
- Swift 5.0+

## 安装 

TGASDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TGASDK'
```

## Swift使用方法
```Swift
//引入头文件
import TGASDK
```Swift

### 基础配置
```Swift
//主题皮肤颜色有“regular”，“lavender”，“orange”，“dark”，“night-blue”，“dark-blue”，“gnc”，下面有示例图，可以进行参考一下，如果不需要这些主题皮肤可以直接传null或者空字符
TGASDK.shared.configuration.theme = "orange" //配置主题颜色 

TGASDK.shared.configuration.lang = "\(Locale.current.languageCode ?? "")"
TGASDK.shared.configuration.navitaionBarTintColor = UIColor.red
TGASDK.shared.configuration.navitaionTintColor = UIColor.white
TGASDK.shared.configuration.navifationTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
TGASDK.shared.configuration.statusBarStyle = .lightContent
TGASDK.shared.configuration.navigationBackImage = UIImage()
、
```

### 初始化 TGASDK
```Swift
// appkey: app对接密钥（TGA开发者平台 - 应用管理 - 管理 - 开发设置 - 基本设置中的密钥）
// authCode: 调用自己服务端获取登录凭证code，传进本方法中，如果authCode返回null，游戏平台将以游客的身份登录
TGASDK.shared.initSdk(appKey: "", authCode: "", delegate: self)
```
### 打开游戏中心
```Swift
// 打开游戏中心方法必须在初始化SDK成功之后
TGASDK.shared.openGameCenter()
```

### 委托回调方法
```Swift
func tgaSdkInitSucceed() {
   debugPrint("初始化SDK成功")
}

func tgaSdkInitError(_ error: NSError) {
    debugPrint("初始化失败\(error.localizedDescription)")
}

func tgaSdkOnLogout() {
   debugPrint("用户登出游戏平台")
}

func tgaSdkCloseGameCenter() {
   debugPrint("关闭游戏中心回调")
}

func tgaSdkGetAuthCode(completion: ((String?) -> Void)) {
   debugPrint("调用自己服务端获取登录凭证code，回调传进本方法中，如果authCode返回null，游戏平台将以游客的身份登录")
}

```


## objc 使用方法
```objc
//引入头文件
#import "TGASDK/TGASDK-Swift.h"
```

### 基础配置 TGASDK
```objc
//主题皮肤颜色有“regular”，“lavender”，“orange”，“dark”，“night-blue”，“dark-blue”，“gnc”，下面有示例图，可以进行参考一下，如果不需要这些主题皮肤可以直接传null或者空字符
TGASDK.shared.configuration.theme = @"regular";
TGASDK.shared.configuration.lang = [NSLocale currentLocale].languageCode;
TGASDK.shared.configuration.navitaionBarTintColor = [UIColor redColor];
TGASDK.shared.configuration.navitaionTintColor = [UIColor whiteColor];
TGASDK.shared.configuration.navifationTitleTextAttributes = @{NSForegroundColorAttributeName: UIColor.whiteColor};
TGASDK.shared.configuration.statusBarStyle = UIStatusBarStyleLightContent;
TGASDK.shared.configuration.navigationBackImage = [UIImage imageNamed:@"navigation_back_default"];
```
### 初始化 TGASDK
```objc    
// appkey: app对接密钥（TGA开发者平台 - 应用管理 - 管理 - 开发设置 - 基本设置中的密钥）
// authCode: 调用自己服务端获取登录凭证code，传进本方法中，如果authCode返回null，游戏平台将以游客的身份登录
[TGASDK.shared initSdkWithAppKey:@"" authCode:@"" delegate:self];
```

### 打开游戏中心
```objc
[TGASDK.shared openGameCenter];
```

### 委托回调方法
```objc
-(void)tgaSdkInitSucceed {
    NSLog(@"初始化SDK成功");
}

-(void)tgaSdkInitError:(NSError *)error {
    NSLog(@"%@", [[NSString alloc] initWithFormat:@"%@%@", @"初始化失败: ", error.localizedDescription]);
}

-(void)tgaSdkOnLogout {
    NSLog(@"用户登出游戏平台")
}

-(void)tgaSdkCloseGameCenter {
    NSLog(@"关闭游戏中心回调");
}

-(void)tgaSdkGetAuthCodeWithCompletion:(void (^)(NSString * _Nullable))completion {
    NSLog(@"调用自己服务端获取登录凭证code，回调传进本方法中，如果authCode返回null，游戏平台将以游客的身份登录")
}
```

## License

TGASDK is available under the Apache2.0 License. See the LICENSE file for more info.
