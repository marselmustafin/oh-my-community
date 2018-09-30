class UsersController < ApplicationController
  expose_decorated :users, :fetch_users, decorator: UserDecorator

  def index
  end

  private

  def fetch_users
    Users::SortedQuery.new(sorting_params[:sorting], filtered_users).all
  end

  def filtered_users
    Users::FilteredQuery.new(filter_params, current_community.users).all
  end

  def sorting_params
    params.permit(sorting: %i[sort_param order])
  end

  def filter_params
    params.permit(:min_rating, :keywords)
  end
end
