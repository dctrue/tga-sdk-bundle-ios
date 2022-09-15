# TGASDK

[![languages](https://img.shields.io/badge/languages-Swift%20%7C%20ObjC-blue.svg)](https://img.shields.io/badge/languages-Swift%20%7C%20ObjC-blue.svg)
[![Swift](https://img.shields.io/badge/Swift-5.3_5.4_5.5_5.6-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.3_5.4_5.5_5.6-Orange?style=flat-square)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/TGASDK.svg?style=flat-square)](https://img.shields.io/cocoapods/v/TGASDK.svg)
[![Platform](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)


[中文介绍](https://github.com/dctrue/tga-sdk-bundle-ios/blob/master/README_ZH-CN.md)

## Requirements
- **iOS** 10.0+
- Xcode 10.0+
- Swift 5.0+

## Installation 

TGASDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TGASDK'
```

## Usage Swift
```Swift
import TGASDK
```

### Config TGASDK
```Swift
TGASDK.shared.configuration.theme = "orange"
TGASDK.shared.configuration.lang = "\(Locale.current.languageCode ?? "")"
TGASDK.shared.configuration.navitaionBarTintColor = UIColor.red
TGASDK.shared.configuration.navitaionTintColor = UIColor.white
TGASDK.shared.configuration.navifationTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
TGASDK.shared.configuration.statusBarStyle = .lightContent
TGASDK.shared.configuration.navigationBackImage = UIImage()
```

### Init TGASDK
```Swift
// appkey: SDK key to use for the instance of the TGASDK SDK
// authCode: Call your own server to get the login credential authCode
TGASDK.shared.initSdk(appKey: "", authCode: "", delegate: self)
```
### Open GameCenter
```Swift
TGASDK.shared.openGameCenter()
```

### Delegate
```Swift
func tgaSdkInitSucceed() {
   debugPrint("init Succeed")
}

func tgaSdkInitError(_ error: NSError) {
    debugPrint("init failure\(error.localizedDescription)")
}

func tgaSdkOnLogout() {
   debugPrint("sdk User logout")
}

func tgaSdkCloseGameCenter() {
   debugPrint("close game Controller")
}

func tgaSdkGetAuthCode(completion: ((String?) -> Void)) {
   debugPrint("authCode: Call your own server to get the login credential authCode")
}

```


## Usage objc
```objc
#import "TGASDK/TGASDK-Swift.h"
```

### Config TGASDK
```objc
// TGASDK config attribute
TGASDK.shared.configuration.theme = @"regular";
TGASDK.shared.configuration.lang = [NSLocale currentLocale].languageCode;
TGASDK.shared.configuration.navitaionBarTintColor = [UIColor redColor];
TGASDK.shared.configuration.navitaionTintColor = [UIColor whiteColor];
TGASDK.shared.configuration.navifationTitleTextAttributes = @{NSForegroundColorAttributeName: UIColor.whiteColor};
TGASDK.shared.configuration.statusBarStyle = UIStatusBarStyleLightContent;
TGASDK.shared.configuration.navigationBackImage = [UIImage imageNamed:@"navigation_back_default"];
```
### Init TGASDK
```objc    
// appkey: SDK key to use for the instance of the TGASDK SDK
// authCode: Call your own server to get the login credential authCode
[TGASDK.shared initSdkWithAppKey:@"" authCode:@"" delegate:self];
```

### Open GameCenter
```objc
[TGASDK.shared openGameCenter];
```

### Delegate
```objc
-(void)tgaSdkInitSucceed {
    NSLog(@"register success");
}

-(void)tgaSdkInitError:(NSError *)error {
    NSLog(@"%@", [[NSString alloc] initWithFormat:@"%@%@", @"error reason: ", error.localizedDescription]);
}

-(void)tgaSdkOnLogout {
    NSLog(@"sdk User logout")
}

-(void)tgaSdkCloseGameCenter {
    NSLog(@"close game Controller");
}

-(void)tgaSdkGetAuthCodeWithCompletion:(void (^)(NSString * _Nullable))completion {
    NSLog(@"callback, authCode: Call your own server to get the login credential authCode")
}

```

## License

TGASDK is available under the Apache2.0 License. See the LICENSE file for more info.
