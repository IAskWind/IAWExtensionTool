#
# Be sure to run `pod lib lint IAWExtensionTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IAWExtensionTool'
  s.version          = '0.6.0'
  s.summary          = 'A short description of IAWExtensionTool.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/IAskWind/IAWExtensionTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'IAskWind' => 'iaskwind@foxmail.com' }
  s.source           = { :git => 'https://github.com/IAskWind/IAWExtensionTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '5.0'
  s.ios.deployment_target = '12.0'

  s.source_files = 'IAWExtensionTool/IAWExtensionTool/Classes/**/*'
  s.requires_arc     = true
  s.resource_bundles = {
     'IAWExtensionTool' => ['IAWExtensionTool/IAWExtensionTool/Resources/**/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation','QuartzCore','JavaScriptCore','AVFoundation'
  # s.dependency 'AFNetworking', '~> 2.3'
   s.dependency 'SnapKit'
   s.dependency 'SVProgressHUD'
   s.dependency 'RNCryptor'
   s.dependency 'Alamofire'
   s.dependency 'AlamofireObjectMapper', '~> 5.2'
   s.dependency 'Kingfisher'
   s.dependency 'CryptoSwift'
   s.dependency 'MJRefresh'
   s.dependency 'SKPhotoBrowser', '~> 4.0.0'
   s.dependency 'Easy'
   s.dependency 'SlideMenuControllerSwift'
   s.dependency 'SwiftMessages'

end
