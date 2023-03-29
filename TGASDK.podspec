Pod::Spec.new do |s|
  s.name             = 'TGASDK'
  s.version          = '1.2.2'
  s.summary          = 'TGASDK SDK for iOS'

  s.homepage         = 'https://github.com/Just4fun2021/tga-sdk-bundle-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'just4fun' => 'just4fun' }
  s.source           = { :git => 'https://github.com/Just4fun2021/tga-sdk-bundle-ios.git', :tag => s.version.to_s }


  s.requires_arc = true
  s.static_framework = true
  s.swift_versions = ['5']
  s.ios.deployment_target = '10.0'

  s.resource_bundles = {
     'TGASDK' => ['TGASDK/Assets/Langs.bundle', 'TGASDK/Assets/*.xcassets']
  }
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 armv7s arm64' }
  
  s.vendored_frameworks = "TGASDK/Classes/TGASDK.xcframework"
  s.dependency 'AppLovinSDK', '~> 11.5.1'
end
