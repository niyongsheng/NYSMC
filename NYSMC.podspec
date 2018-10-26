Pod::Spec.new do |s|
  s.name             = 'NYSMC'
  s.version          = '0.2.1'
  s.summary          = 'Auto Choose Sheel/Application framework.'

  s.homepage         = 'https://github.com/niyongsheng/NYSMC'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NiYongsheng' => 'niyongsheng@outlook.com' }
  s.source           = { :git => 'https://github.com/niyongsheng/NYSMC.git', :tag => '0.2.1' }

  s.platform     = :ios
  s.ios.deployment_target = "8.0"

  #s.source_files		= 'Frameworks/**/*.{h,m}'
  s.resources       = 'Resources/images.bundle'
  s.vendored_frameworks = 'Frameworks/NYSMC.framework'

  s.frameworks			= 'Foundation', 'UIKit'
  s.dependency      'AFNetworking'
  #s.requires_arc   = true

end
