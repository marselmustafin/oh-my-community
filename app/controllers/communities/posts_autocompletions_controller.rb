module Communities
  class PostsAutocompletionsController < ApplicationController
    def index
      render json: autocompletion_matches.as_json
    end

    private

    def autocompletion_matches
      Posts::AutocompletionBatch.new(
        keywords: params[:keywords],
        community: current_community
      ).to_a
    end
  end
end
