#
# Be sure to run `pod lib lint IAWExtensionTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IAWExtensionTool'
  s.version          = '0.2.4'
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

  s.ios.deployment_target = '9.0'

  s.source_files = 'IAWExtensionTool/IAWExtensionTool/Classes/**/*'
  s.requires_arc     = true
  s.resource_bundles = {
     'IAWExtensionTool' => ['IAWExtensionTool/IAWExtensionTool/Resources/**/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation','QuartzCore'
  # s.dependency 'AFNetworking', '~> 2.3'
   s.dependency 'SnapKit', '~> 3.1.2'
   s.dependency 'SVProgressHUD'
   s.dependency 'RNCryptor'
   s.dependency 'Alamofire', '~> 4.0'
   s.dependency 'AlamofireObjectMapper', '~> 4.0'
   s.dependency 'Kingfisher', '~> 3.2.4'
   s.dependency 'CryptoSwift'
   s.dependency 'MJRefresh'
   s.dependency 'SKPhotoBrowser', '~> 4.0.0'
   s.dependency 'OMExtension'
   s.dependency 'SlideMenuControllerSwift'

end
