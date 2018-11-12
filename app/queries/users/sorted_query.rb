module Users
  class SortedQuery
    attr_reader :relation, :sort_param, :order
    private :relation, :sort_param, :order

    DEFAULT_SORT = "rating".freeze
    DEFAULT_ORDER = :desc

    def initialize(sort_param: DEFAULT_SORT, order: DEFAULT_ORDER, relation: User.all)
      @relation = relation
      @sort_param = sort_param || DEFAULT_SORT
      @order = order&.to_sym || DEFAULT_ORDER
    end

    def all
      send("sort_by_#{sort_param}", relation, order)
    end

    private

    def sort_by_rating(relation, order)
      relation.order(rating: order, posts_count: DEFAULT_ORDER)
    end

    def sort_by_posts_count(relation, order)
      relation.order(posts_count: order, rating: DEFAULT_ORDER)
    end
  end
end
