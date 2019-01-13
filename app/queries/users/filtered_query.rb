module Users
  class FilteredQuery
    attr_reader :relation, :filter_params
    private :relation, :filter_params

    def initialize(keywords: nil, min_rating: nil, relation: User.all)
      @relation = relation
      @filter_params = { keywords: keywords, min_rating: min_rating }
    end

    def all
      filter_params.reduce(relation) do |relation, (filter_param, value)|
        value.blank? ? relation : send("by_#{filter_param}", relation, value)
      end
    end

    private

    def by_min_rating(relation, rating)
      relation.where("rating >= ?", rating)
    end

    def by_keywords(relation, keywords)
      relation.search_by_full_name_and_email(keywords)
    end
  end
end
