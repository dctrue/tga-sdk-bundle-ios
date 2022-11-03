# TGASDK
[![Xcode - Build and Analyze](https://github.com/dctrue/tga-sdk-bundle-ios/actions/workflows/objective-c-xcode.yml/badge.svg)](https://github.com/dctrue/tga-sdk-bundle-ios/actions/workflows/objective-c-xcode.yml)
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
TGASdk.shared.configuration.lang = "\(Locale.current.languageCode ?? "")"
TGASdk.shared.configuration.statusBarStyle = .lightContent
TGASdk.shared.configuration.navigationBackImage = UIImage()
```

### Init TGASDK
```Swift
// env: default is empty
// appkey: SDK key to use for the instance of the TGASDK SDK
// userInfo: user information userId, userName, avatar
TGASdk.shared.initSdk(env: nil, appKey: "", userInfo: nil, delegate: self)
```
### Open GameCenter
```Swift
TGASdk.shared.openGameCenter(secUrl: "", secTitle: "")
```

### Logout
```Swift
TGASdk.shared.logout()
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

func tgaSdkGetUserInfo(completion: @escaping ((TGAUserInfo?) -> Void)) {
   debugPrint("TGAUserInfo: user information userId, userName, avatar")
}

```


## Usage objc
```objc
#import "TGASDK/TGASDK-Swift.h"
```

### Config TGASDK
```objc
// TGASDK config attribute
TGASdk.shared.configuration.lang = [NSLocale currentLocale].languageCode;
TGASdk.shared.configuration.statusBarStyle = UIStatusBarStyleLightContent;
TGASdk.shared.configuration.navigationBackImage = [UIImage imageNamed:@"navigation_back_default"];
```
### Init TGASDK
```objc    
[TGASdk.shared initSdkWithEnv:nil appKey:@"" userInfo:nil delegate:self];
```

### Open GameCenter
```objc
[TGASdk.shared openGameCenterWithSecUrl:nil secTitle:nil];
```

### Logout
```objc
[TGASdk.shared logout];
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

-(void)tgaSdkGetUserInfoWithCompletion:(void (^ _Nonnull)(TGAUserInfo * _Nullable))completion {
    NSLog(@"TGAUserInfo: user information userId, userName, avatar")
}

```

## License

TGASDK is available under the Apache2.0 License. See the LICENSE file for more info.
