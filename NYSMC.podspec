Pod::Spec.new do |s|
  s.name             = 'NYSMC'
  s.version          = '0.0.1'
  s.summary          = 'Choose Sheel/Application framework.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/niyongsheng/NYSMC'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '倪刚' => 'niyongsheng@outlook.com' }
  s.source           = { :git => 'https://github.com/niyongsheng/NYSMC.git', :tag => '0.0.1' }

  s.platform            = :ios, '8.0'
  s.vendored_frameworks = 'Frameworks/NYSMC.framework'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc        = true
end
