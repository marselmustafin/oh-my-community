module Posts
  class SearchQuery
    attr_reader :keywords, :relation
    private :keywords, :relation

    def initialize(keywords, relation = Post.all)
      @relation = relation
      @keywords = keywords
    end

    def all
      return relation if keywords.blank?

      relation.search_by_title_and_author_name(keywords)
    end
  end
end
