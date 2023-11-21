# frozen_string_literal: true

module RatingChgkV2
  module Rest
    module Teams
      def teams(params = {})
        collection_load name: 'Teams', ep_params: [[], params]
      end

      def team(id)
        model_load name: 'Team', ep_name: 'Teams', ep_params: id
      end

      def team_seasons(id, params = {})
        collection_load name: 'PlayerSeasons', ep_name: 'Teams', ep_params: [[id, :seasons], params]
      end

      def team_tournaments(id, params = {})
        collection_load name: 'TeamTournaments', ep_name: 'Teams', ep_params: [[id, :tournaments], params]
      end

      def create_team(params)
        model_load name: 'Team', ep_name: 'Teams', ep_params: [[], params], method: :do_post
      end

      def update_team(id, params)
        model_load name: 'Team', ep_name: 'Teams', ep_params: [id, params], method: :do_patch
      end

      def delete_team(id)
        endpoint('Teams', id).do_delete
      end
    end
  end
end
