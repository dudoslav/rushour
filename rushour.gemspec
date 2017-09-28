# coding: utf-8

Gem::Specification.new do |s|
  s.name        = 'rushour'
  s.version     = '0.0.0'
  s.date        = '2017-09-28'
  s.summary     = "OpenTTD server controlling app"
  s.description = "Gem that controlls when OpenTTD should be paused"
  s.authors     = ["Dušan Baran"]
  s.email       = 'work.dusanbaran@gmail.com'
  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.license       = 'MIT'

  s.add_runtime_dependency 'childprocess', '~> 0.8'
  s.add_runtime_dependency 'settingslogic', '~> 2.0'
  s.add_runtime_dependency 'thor', '~> 0.20'
end
