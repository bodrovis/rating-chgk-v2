# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.ignore_hosts 'codeclimate.com'
  c.hook_into :faraday
  c.cassette_library_dir = File.join(File.dirname(__FILE__), '..', 'fixtures', 'vcr_cassettes')
  c.filter_sensitive_data('<API_TOKEN>') { ENV.fetch('API_TOKEN', 'fake') }
  c.filter_sensitive_data('<CHGK_EMAIL>') { ENV.fetch('CHGK_EMAIL', 'fake') }
  c.filter_sensitive_data('<CHGK_PASSWORD>') { ENV.fetch('CHGK_PASSWORD', 'fake') }
end
