module Posts
  class AutocompletionBatch
    attr_reader :keywords, :community
    private :keywords, :community

    BATCH_SIZE = 5

    def initialize(keywords:, community:)
      @keywords = keywords
      @community = community
    end

    def to_a
      matched_posts.map do |matched_post|
        { match: "#{matched_post.author.full_name} \"#{matched_post.title}\"" }
      end
    end

    private

    def matched_posts
      Posts::SearchQuery.new(keywords: keywords, relation: community.posts)
                        .all
                        .limit(BATCH_SIZE)
    end
  end
end
