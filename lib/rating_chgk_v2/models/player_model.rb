require 'yaml'

module RatingChgkV2
  module Models
    class PlayerModel
      def initialize(data)
        attrs = YAML.load_file File.expand_path('../data/player.yaml', __dir__)
        attrs.each do |att|
          next unless data.has_key?(att)

          self.class.class_exec do
            attr_reader(att)
          end

          instance_variable_set :"@#{att}", data[att]
        end
      end
    end
  end
end