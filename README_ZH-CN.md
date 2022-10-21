# TGASDK

## Requirements
- **iOS** 10.0+
- Xcode 10.0+
- Swift 5.0+


## SDK接入准备
接入前准备：

- 首先需要到TGA开发者平台[创建APP](https://tga.just4fun.sg/tga-developer)，并完善应用的信息；
- 新建应用成功之后点击管理，在`基本设置`中拿到对应的密钥（也就是下面初始化用的appkey）；

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
// 配置语言环境，默认为本机系统语言
TGASdk.shared.configuration.lang = "\(Locale(identifier: NSLocale.preferredLanguages.first ?? "zh-Hans").languageCode ?? "")"
// 状态栏风格
TGASdk.shared.configuration.statusBarStyle = .lightContent
// 返回按钮图标
TGASdk.shared.configuration.navigationBackImage = UIImage()
```

### 初始化 TGASDK
```Swift
TGASdk.shared.initSdk(env: nil, appKey: "", authCode: nil, delegate: self)
```
|参数名|类型|说明|其他|
|:----:|:----:|:----:|:----:|
|env|String|sdk区分环境的唯一值,可以传null或者空字符|非必须|
|appKey|String|app对接密钥<br />（TGA开发者平台 - 应用管理 - 管理 - 开发设置 - 基本设置中的密钥）|必须|
|authCode|String|事先需要调用自己服务端获取登录凭证code，传进本方法中，如果code返回null，<br />游戏平台将以游客的身份登录|非必须|
|delegate|TGASdkDelegate|回调接口|必须|

### 打开游戏中心
```Swift
// 打开游戏中心方法必须在初始化SDK成功之后
TGASdk.shared.openGameCenter(secUrl: "", secTitle: "")
```
|参数名|类型|说明|其他|
|:----:|:----:|:----:|:----:|
|secUrl|String|打开游戏中心的同时再打开该网页，可用于打开游戏中心的同时跳到某一款游戏|非必填|
|secTitle|String|游戏页面标题|非必填|

### 退出登录
```Swift
// 当app退登时，清除sdk数据并赋予游客身份
TGASdk.shared.logout()
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
TGASdk.shared.configuration.lang = [NSLocale currentLocale].languageCode;
TGASdk.shared.configuration.statusBarStyle = UIStatusBarStyleLightContent;
TGASdk.shared.configuration.navigationBackImage = [UIImage imageNamed:@"navigation_back_default"];
```
### 初始化 TGASDK
```objc    
[TGASdk.shared initSdkWithEnv:nil appKey:@"" authCode:nil delegate:self];
```

### 打开游戏中心
```objc
[TGASdk.shared openGameCenterWithSecUrl:nil secTitle:nil];
```

### 退出登录
```objc
// 当app退登时，清除sdk数据并赋予游客身份
[TGASdk.shared logout];
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

### 广告播放功能

接入前准备：

1.确保填入TGA开发者平台包名准确性

2.联系我们商务人员来配置广告播放功能相关数据（主要是向商务人员提供app包名，根据app包名由我们商务人员来配置广告位以及各类广告占比，确认是否打开或者关闭此功能）


```Swift
//  以下为可选项，详细可联系商务
pod 'AppLovinMediationAdColonyAdapter', '~> 4.9.0.0.2'
pod 'AppLovinMediationIronSourceAdapter', '~> 7.2.4.0.0'
pod 'AppLovinMediationUnityAdsAdapter', '~> 4.3.0.0'
pod 'AppLovinMediationVungleAdapter', '~> 6.12.0.2'
```


## License

TGASDK is available under the Apache2.0 License. See the LICENSE file for more info.
