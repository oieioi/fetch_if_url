# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fetch_if_url/version'

Gem::Specification.new do |spec|
  spec.name          = 'fetch_if_url'
  spec.version       = FetchIfUrl::VERSION
  spec.authors       = ['oieioi']
  spec.email         = ['atsuinatsu.samuifuyu@gmail.com']

  spec.summary       = 'Download a file and return the path if it looks like URL '
  spec.description   = ' Download a file to `/tmp` dir and return the path if it looks like URL.
                        If it looks like local path, return as it is. '
  spec.homepage      = 'https://github.com/oieioi/fetch_if_url'
  spec.license       = 'MIT'
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
