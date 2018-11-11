module Users
  class AutocompletionBatch
    attr_reader :keywords, :community
    private :keywords, :community

    BATCH_SIZE = 5

    def initialize(keywords:, community:)
      @keywords = keywords
      @community = community
    end

    def to_a
      matched_users.map do |matched_user|
        { match: matched_user.pg_search_highlight }
      end
    end

    private

    def matched_users
      Users::FilteredQuery.new({ keywords: keywords }, community.users)
                          .all
                          .limit(BATCH_SIZE)
                          .with_pg_search_highlight
    end
  end
end
