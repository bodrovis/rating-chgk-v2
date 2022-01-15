# frozen_string_literal: true

module RatingChgkV2
  module Models
    class BaseModel
      using Lokalise::Utils::StringUtils

      attr_reader :endpoint

      def self.load(method, endpoint)
        new endpoint.send(method), endpoint
      end

      def initialize(raw_data, endpoint = nil)
        @endpoint = endpoint

        self.class.const_get(:ATTRIBUTES).each do |att|
          instance_variable_set :"@#{att}", (raw_data[att] || raw_data[att.to_sym])
        end
      end

      def self.inherited(subclass)
        subclass.class_exec do
          filename = subclass.name.base_class_name.snakecase.delete_suffix('_model')
          attrs = YAML.load_file File.expand_path("../data/#{filename}.yml", __dir__)

          const_set :ATTRIBUTES, attrs

          attrs.each do |att|
            attr_reader(att)
          end
        end

        super
      end
    end
  end
end
