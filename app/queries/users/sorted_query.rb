module Users
  class SortedQuery
    SORT_PARAMS = %i[rating posts_count].freeze
    DEFAULT_SORT_ORDER = :desc

    def initialize(sort_params = {}, relation = User.all)
      @relation = relation
      @sort_param = sort_params.fetch(:sort_param, "rating")
      @order = sort_params.fetch(:order, :desc).to_sym
    end

    def all
      send("sort_by_#{sort_param}", relation, order)
    end

    private

    attr_reader :relation, :sort_param, :order

    def sort_by_rating(relation, order)
      relation.order(rating: order, posts_count: DEFAULT_SORT_ORDER)
    end

    def sort_by_posts_count(relation, order)
      relation.order(posts_count: order, rating: DEFAULT_SORT_ORDER)
    end
  end
end
