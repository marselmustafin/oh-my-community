module Users
  class FilteredQuery
    FILTER_PARAMS = %i[min_rating keywords].freeze

    def initialize(filter_params = {}, relation = User.all)
      @relation = relation
      @filter_params = filter_params
    end

    def all
      return relation if allowed_filter_params.empty?

      allowed_filter_params.reduce(relation) do |relation, (filter_param, value)|
        value.blank? ? relation : send("by_#{filter_param}", relation, value)
      end
    end

    private

    attr_reader :relation, :filter_params

    def allowed_filter_params
      @allowed_filter_params ||= filter_params.slice(*FILTER_PARAMS).to_h
    end

    def by_min_rating(relation, rating)
      relation.where("rating >= ?", rating)
    end

    def by_keywords(relation, keywords)
      return relation if keywords.blank?

      relation.search_by_full_name_and_email(keywords)
    end
  end
end
