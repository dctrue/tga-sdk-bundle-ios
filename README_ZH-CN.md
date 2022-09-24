# TGASDK

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
```

### 基础配置
```Swift
// 配置Web主题颜色 具体可以查看官方文档
TGASDK.shared.configuration.webTheme = "orange"
// 配置语言环境，默认为本机系统语言
TGASDK.shared.configuration.lang = "\(Locale(identifier: NSLocale.preferredLanguages.first ?? "zh-Hans").languageCode ?? "")"
// 是否隐藏导航栏，默认不隐藏
TGASDK.shared.configuration.isHiddenNavigation = false
// 导航栏背景颜色
TGASDK.shared.configuration.navigationBarTintColor = UIColor.red
// 导航栏Tint颜色
TGASDK.shared.configuration.navigationTintColor = UIColor.white
// 导航栏标题属性
TGASDK.shared.configuration.navifationTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
// 状态栏风格
TGASDK.shared.configuration.statusBarStyle = .lightContent
// 返回按钮图标
TGASDK.shared.configuration.navigationBackImage = UIImage()
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

// 网页信息
let webPageInfo = TGAWebPageInfo()
// 地址
webPageInfo.url = "url"
// 是否隐藏导航栏
webPageInfo.isHiddenNavigation = true
// 导航栏颜色
webPageInfo.navigationBarTintColor = UIColor.red
// 是否显示状态栏背景颜色
webPageInfo.isShowStatusBar = true
// 状态栏背景颜色
webPageInfo.statusBarBackgroundColor = UIColor.red
// 打开游戏中心，secPageInfo可空
TGASDK.shared.openGameCenter(secPageInfo: webPageInfo)
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
TGASDK.shared.configuration.webTheme = @"regular";
TGASDK.shared.configuration.lang = [NSLocale currentLocale].languageCode;
TGASDK.shared.configuration.lang.isHiddenNavigation = false;
TGASDK.shared.configuration.navigationBarTintColor = [UIColor redColor];
TGASDK.shared.configuration.navigationTintColor = [UIColor whiteColor];
TGASDK.shared.configuration.navigationTitleTextAttributes = @{NSForegroundColorAttributeName: UIColor.whiteColor};
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
[TGASDK.shared openGameCenterWithSecPageInfo:nil];
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
