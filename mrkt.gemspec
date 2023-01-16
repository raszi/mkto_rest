lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mrkt/version'

Gem::Specification.new do |spec|
  spec.name          = 'mrkt'
  spec.version       = Mrkt::VERSION
  spec.authors       = ['KARASZI István', 'Jacques Lemieux']
  spec.email         = ['github@spam.raszi.hu', 'jalemieux@gmail.com']
  spec.summary       = 'Marketo REST API Facade'
  spec.description   = 'This gem helps you to use the Marketo REST API'
  spec.homepage      = 'https://github.com/raszi/mrkt'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.required_ruby_version = '>= 2.6'

  spec.add_dependency 'faraday', '>= 1.10', '< 3'
  spec.add_dependency 'faraday-multipart'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'gem-release', '~> 2.1'
  spec.add_development_dependency 'pry-byebug', '~> 3.7'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rubocop', '~> 1.43.0'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.16'
  spec.add_development_dependency 'simplecov', '~> 0.22.0'
  spec.add_development_dependency 'webmock', '~> 3.1'
end
