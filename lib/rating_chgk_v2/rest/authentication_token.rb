# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module AuthenticationToken
      def authentication_token(params)
        model_load name: 'AuthenticationToken', ep_params: [[], params], method: :do_post
      end
    end
  end
end
