#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
    s.name             = 'promotion_overlay_foundation'
    s.version          = '1.0.0'
    s.summary          = 'iOS and macOS implementation of the promotion_overlay plugin.'
    s.description      = <<-DESC
  Wraps SKOverlay, showing a promotion overlay.
                         DESC
    s.homepage         = 'https://github.com/flutter/packages/tree/main/packages/promotion_overlay/promotion_overlay_foundation'
    s.license          = { :type => 'BSD', :file => '../LICENSE' }
    s.author           = { 'PsyCat Games' => 'info@psycatgames.com' }
    s.source           = { :http => 'https://github.com/flutter/packages/tree/main/packages/promotion_overlay/promotion_overlay_foundation' }
    s.source_files = 'Classes/**/*'
    s.ios.dependency 'Flutter'
    s.osx.dependency 'FlutterMacOS'
    s.ios.deployment_target = '14.0'
    s.osx.deployment_target = '14.0'
    s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
    s.xcconfig = {
       'LIBRARY_SEARCH_PATHS' => '$(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)/ $(SDKROOT)/usr/lib/swift',
       'LD_RUNPATH_SEARCH_PATHS' => '/usr/lib/swift',
    }
    s.swift_version = '5.0'
  
  end