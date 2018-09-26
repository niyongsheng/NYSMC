Pod::Spec.new do |s|
  s.name             = 'NYSMC'
  s.version          = '0.0.2'
  s.summary          = 'Auto Choose Sheel/Application framework.'

  s.homepage         = 'https://github.com/niyongsheng/NYSMC'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NiYongsheng' => 'niyongsheng@outlook.com' }
  s.source           = { :git => 'https://github.com/niyongsheng/NYSMC.git', :tag => '0.0.2' }

  s.platform        = :ios, '8.0'
  #s.source_files		= 'Frameworks/**/*.{h,m}'
  s.vendored_frameworks = 'Framewoeks/NYSMC.framework'
  s.frameworks			= 'Foundation', 'UIKit'
  #s.requires_arc   = true
end
