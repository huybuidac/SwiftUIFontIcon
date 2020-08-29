#
# Be sure to run `pod lib lint SwiftUIFontIcon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftUIFontIcon'
  s.version          = '2.1.0'
  s.summary          = 'Font icon for SwiftUI'
  
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Font icon for SwiftUI. Support: Material icon, Ionicons, Font Awesome 5 Free fonts
                       DESC

  s.homepage         = 'https://github.com/huybuidac/SwiftUIFontIcon'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huybuidac' => 'huybuidac@gmail.com' }
  s.source           = { :git => 'https://github.com/huybuidac/SwiftUIFontIcon.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.swift_version = "5.0"
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'

  s.source_files = 'Sources/SwiftUIFontIcon/**/*.swift'
  s.exclude_files = 'Sources/SwiftUIFontIcon/**/*.spm.swift'
  s.resources = "Sources/SwiftUIFontIcon/Resources/*.{ttf}"
  
  # s.resource_bundles = {
  #   'SwiftUIFontIcon' => ['SwiftUIFontIcon/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
