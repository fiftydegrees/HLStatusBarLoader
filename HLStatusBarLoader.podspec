Pod::Spec.new do |s|
  s.name     = 'HLStatusBarLoader'
  s.version  = '1.0'
  s.platform = :ios
  s.license  = 'MIT'
  s.summary  = 'Simple non-blocking HUD displaying a loader above the status bar with a cool animation.'
  s.homepage = 'http://nscurious.com'
  s.author   = { 'Hervé Heurtault de Lammerville' => 'herve.heurtaultdelammerville@gmail.com' }
  s.source   = { :git => 'https://github.com/fiftydegrees/HLStatusBarLoader.git', :tag => s.version.to_s }

  s.description = 'Simple non-blocking HUD displaying a loader above the status bar with a cool animation. Single-line to use.'

  s.source_files = 'HLStatusBarLoader/*.swift'
  s.requires_arc = true
end
