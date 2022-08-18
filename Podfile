# Uncomment the next line to define a global platform for your project
# platform :ios, '14.0'

target 'ProjectGNT_iOS_ver3' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        config.build_settings["ONLY_ACTIVE_ARCH"] = "NO"
      end
    end
  end
  
  # Pods for ProjectGNT_iOS_ver3

pod 'DropDown'
pod 'KakaoSDKAuth'
pod 'KakaoSDKUser'
pod 'LGSegmentedControl'

end
