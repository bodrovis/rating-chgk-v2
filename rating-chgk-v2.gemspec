# frozen_string_literal: true

require File.expand_path('lib/rating_chgk_v2/version', __dir__)

Gem::Specification.new do |spec|
  spec.name                  = 'rating-chgk-v2'
  spec.version               = RatingChgkV2::VERSION
  spec.authors               = ['Ilya Krukowski']
  spec.email                 = ['golosizpru@gmail.com']
  spec.summary               = 'Ruby interface for the new CHGK rating API'
  spec.description           = 'Ruby client for the new CHGK rating API (api.rating.chgk.net).'
  spec.homepage              = 'https://github.com/bodrovis/rating-chgk-v2'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.7.0'

  spec.files = Dir['README.md', 'LICENSE',
                   'CHANGELOG.md', 'lib/**/*.rb', 'lib/rating_chgk_v2/data/*.yml',
                   'rating-chgk-v2.gemspec', '.github/*.md',
                   'Gemfile', 'Rakefile']
  spec.extra_rdoc_files = ['README.md']
  spec.require_paths    = ['lib']

  spec.add_dependency 'addressable',                     '~> 2.5'
  spec.add_dependency 'faraday',                         '~> 2'
  spec.add_dependency 'faraday-gzip',                    '~> 2.0'
  spec.add_dependency 'json',                            '~> 2'
  spec.add_dependency 'zeitwerk',                        '~> 2.4'

  spec.add_development_dependency 'dotenv',              '~> 2.5'
  spec.add_development_dependency 'oj',                  '~> 3.10'
  spec.add_development_dependency 'rake',                '~> 13.0'
  spec.add_development_dependency 'rspec',               '~> 3.6'
  spec.add_development_dependency 'rubocop',             '~> 1.6'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5'
  spec.add_development_dependency 'rubocop-rake',        '~> 0.6'
  spec.add_development_dependency 'rubocop-rspec',       '~> 2.0'
  spec.add_development_dependency 'simplecov',           '~> 0.22'
  spec.add_development_dependency 'simplecov-lcov',      '~> 0.8'
  spec.add_development_dependency 'vcr',                 '~> 6.0'
  spec.add_development_dependency 'webmock',             '~> 3.14'
  spec.metadata = {
    'source_code_uri' => 'https://github.com/bodrovis/rating-chgk-v2',
    'rubygems_mfa_required' => 'true',
    'wiki_uri' => 'https://github.com/bodrovis/rating-chgk-v2/wiki',
    'changelog_uri' => 'https://github.com/bodrovis/rating-chgk-v2/blob/master/CHANGELOG.md',
    'bug_tracker_uri' => 'https://github.com/bodrovis/rating-chgk-v2/issues'
  }
end
