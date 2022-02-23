# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.ignore_hosts 'codeclimate.com'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = File.join(File.dirname(__FILE__), '..', 'fixtures', 'vcr_cassettes')
  c.filter_sensitive_data('<API_TOKEN>') { ENV.fetch('API_TOKEN', 'hidden') }
  c.filter_sensitive_data('<CHGK_EMAIL>') { ENV.fetch('CHGK_EMAIL', 'fake') }
  c.filter_sensitive_data('<CHGK_PASSWORD>') { ENV.fetch('CHGK_PASSWORD', 'fake') }
end

# https://github.com/vcr/vcr/pull/907
module VCR
  class LibraryHooks
    # @private
    module WebMock
      module_function

      def with_global_hook_disabled(request)
        global_hook_disabled_requests << request

        begin
          yield
        ensure
          global_hook_disabled_requests.delete(request)
        end
      end

      def global_hook_disabled?(request)
        requests = Thread.current[:_vcr_webmock_disabled_requests]
        requests&.include?(request)
      end

      def global_hook_disabled_requests
        Thread.current[:_vcr_webmock_disabled_requests] ||= []
      end
    end
  end
end
