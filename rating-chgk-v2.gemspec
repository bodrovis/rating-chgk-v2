# frozen_string_literal: true

require File.expand_path('lib/rating_chgk_v2/version', __dir__)

Gem::Specification.new do |spec|
  spec.name                  = 'rating-chgk-v2'
  spec.version               = RatingChgkV2::VERSION
  spec.authors               = ['Ilya Bodrov-Krukowski']
  spec.email                 = ['golosizpru@gmail.com']
  spec.summary               = 'Ruby interface to the CHGK rating API'
  spec.description           = 'Ruby client for the CHGK rating API (api.rating.chgk.net).'
  spec.homepage              = 'https://github.com/bodrovis/rating-chgk-v2'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.5.0'

  spec.files = Dir['README.md', 'LICENSE',
                   'CHANGELOG.md', 'lib/**/*.rb', 'lib/rating_chgk_v2/data/*.yaml',
                   'rating-chgk-v2.gemspec', '.github/*.md',
                   'Gemfile', 'Rakefile']
  spec.test_files       = Dir['spec/**/*.rb']
  spec.extra_rdoc_files = ['README.md']
  spec.require_paths    = ['lib']

  spec.add_dependency 'addressable',                     '~> 2.5'
  spec.add_dependency 'faraday',                         '~> 2'
  spec.add_dependency 'json',                            '>= 1.8.0'

  spec.add_development_dependency 'codecov',             '~> 0.1'
  spec.add_development_dependency 'dotenv',              '~> 2.5'
  spec.add_development_dependency 'oj',                  '~> 3.10'
  spec.add_development_dependency 'rake',                '~> 13.0'
  spec.add_development_dependency 'rspec',               '~> 3.6'
  spec.add_development_dependency 'rubocop',             '~> 1.6'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5'
  spec.add_development_dependency 'rubocop-rspec',       '~> 2.0'
  spec.add_development_dependency 'simplecov',           '~> 0.16'
  spec.add_development_dependency 'vcr',                 '~> 6.0'
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
