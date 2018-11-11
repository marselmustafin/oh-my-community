module Communities
  class UsersAutocompletionsController < ApplicationController
    def index
      render json: autocompletion_matches.as_json
    end

    private

    def autocompletion_matches
      Users::AutocompletionBatch.new(
        keywords: params[:keywords],
        community: current_community
      ).to_a
    end
  end
end
