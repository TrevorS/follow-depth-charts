# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'follow-depth-charts/version'

Gem::Specification.new do |spec|
  spec.name          = 'follow-depth-charts'
  spec.version       = FollowDepthCharts::VERSION
  spec.authors       = ['Trevor Strieber']
  spec.email         = ['trevor@strieber.org']
  spec.summary       = %q{Keeps track of MLB's depth charts.}
  spec.homepage      = 'https://github.com/TrevorS/follow-depth-charts'
  spec.license       = 'MIT'
  spec.files         = Dir['{bin,lib,vendor}/**/*'] + ['LICENSE.txt', 'README.md']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14.1'

  spec.add_runtime_dependency 'nokogiri', '~> 1.6.1'
end
