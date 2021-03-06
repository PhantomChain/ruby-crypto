lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phantomchain/crypto/version'

Gem::Specification.new do |spec|
  spec.name          = 'phantomchain-crypto'
  spec.version       = PhantomChain::Crypto::VERSION
  spec.authors       = ['Brian Faust']
  spec.email         = ['brian@ark.io']

  spec.summary       = 'A simple Ruby Cryptography Implementation for the PHANTOM Blockchain.'
  spec.description   = 'A simple Ruby Cryptography Implementation for the PHANTOM Blockchain.'
  spec.homepage      = 'https://github.com/PhantomChain/ruby-crypto'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = Dir.glob('lib/**/*.rb')
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'codecov', '~> 0.1.4'
  spec.add_development_dependency 'simplecov', '~> 0.16.1'

  spec.add_dependency 'btcruby'
  spec.add_dependency 'deep_hash_transform'
end
