Pod::Spec.new do |s|
  s.name             = 'TGASDK'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TGASDK'

  s.homepage         = 'https://github.com/dctrue/tga-sdk-bundle-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'just4fun' => 'just4fun' }
  s.source           = { :git => 'https://github.com/dctrue/tga-sdk-bundle-ios.git', :tag => s.version.to_s }


  s.requires_arc = true
  s.static_framework = true
  s.swift_versions = ['5']
  s.ios.deployment_target = '10.0'

  s.resource_bundles = {
     'TGASDK' => ['TGASDK/Assets/Langs.bundle', 'TGASDK/Assets/*.xcassets']
  }
  
  s.vendored_frameworks = "TGASDK/Classes/TGASDK.framework"
  s.dependency 'AppLovinSDK', '~> 11.4.4'
  s.dependency 'AppLovinMediationAdColonyAdapter', '~> 4.9.0.0.2'
  s.dependency 'AppLovinMediationIronSourceAdapter', '~> 7.2.4.0.0'
  s.dependency 'AppLovinMediationUnityAdsAdapter', '~> 4.3.0.0'
  s.dependency 'AppLovinMediationVungleAdapter', '~> 6.12.0.2'
  s.user_target_xcconfig = { 'LIBRARY_SEARCH_PATHS' => '$(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)' }
end
