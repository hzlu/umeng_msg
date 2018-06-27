# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'umeng_msg/version'

Gem::Specification.new do |spec|
  spec.name          = 'umeng_msg'
  spec.version       = UmengMsg::VERSION
  spec.authors       = ['luhaozhao']
  spec.email         = ['hzlu2010@163.com']
  spec.licenses       = ['MIT']
  spec.summary       = 'The encapsulation of umeng message!'
  spec.description   = '友盟推送Ruby封装'
  spec.homepage      = 'https://github.com/hzlu/umeng_msg'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'httpi', '~> 0'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 0'
  spec.add_development_dependency 'pry-byebug', '~> 0'
end
