Pod::Spec.new do |s|

s.name         = "AXNodeProgressView"
s.version      = "0.0.1"
s.summary      = "AXNodeProgressView node progress view."
s.description  = <<-DESC
                AXNodeProgressView node progress view on ios platform.
                DESC
s.homepage     = "https://github.com/devedbox/AXNodeProgressView"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "devedbox" => "devedbox@gmail.com" }
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/devedbox/AXNodeProgressView.git", :tag => "0.0.1" }
s.source_files  = "AXNodeProgressView/AXNodeProgressView/*.{h,m}"
s.frameworks = "UIKit", "Foundation"
s.requires_arc = true
#s.dependency "AXCollectionViewFlowLayout"
#s.dependency "AXExtensions"

end
