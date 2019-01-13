module Communities
  class UsersController < ApplicationController
    expose_decorated :users, :fetch_users

    def index
    end

    private

    def fetch_users
      Users::SortedQuery.new(
        sort_param: params[:sort_param],
        order: params[:order],
        relation: filtered_users
      ).all.with_attached_avatar.page(params[:page])
    end

    def filtered_users
      Users::FilteredQuery.new(
        keywords: params[:keywords],
        min_rating: params[:min_rating],
        relation: current_community.users
      ).all
    end
  end
end
