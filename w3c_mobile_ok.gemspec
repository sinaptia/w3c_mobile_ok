# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'w3c_mobile_ok/version'

Gem::Specification.new do |spec|
  spec.name          = 'w3c_mobile_ok'
  spec.version       = W3CMobileOk::VERSION
  spec.authors       = ['Patricio Mac Adden', 'J. Francisco Raposeiras']
  spec.email         = ['patriciomacadden@gmail.com', 'rapofran@gmail.com']
  spec.description   = 'W3C mobileOK Checker - Is your Web site mobile-friendly?'
  spec.summary       = 'W3C mobileOK Checker - Is your Web site mobile-friendly?'
  spec.homepage      = 'https://github.com/templ-ar/w3c_mobile_ok'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'mechanize'
  spec.add_development_dependency 'rake'

  spec.add_runtime_dependency 'mechanize'
end
