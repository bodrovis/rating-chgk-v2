# frozen_string_literal: true

module RatingChgkV2
  module Models
    class VenueModel < BaseModel
      def update(params = {})
        endpoint.reinitialize new_params: params
        self.class.load :do_put, endpoint
      end

      def destroy
        endpoint.do_delete
      end
    end
  end
end
