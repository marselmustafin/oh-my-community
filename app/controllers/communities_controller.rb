class CommunitiesController < ApplicationController
  expose_decorated :posts, :fetch_posts
  expose_decorated :authors, :fetch_top_authors, decorator: UserDecorator

  def show
  end

  private

  def fetch_posts
    current_community.posts.order(created_at: :desc).page(params[:page]).per(8)
  end

  def fetch_top_authors
    current_community.users.order(rating: :desc).limit(3)
  end
end
