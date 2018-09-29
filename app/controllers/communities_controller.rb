class CommunitiesController < ApplicationController
  expose_decorated :posts, :fetch_posts
  expose_decorated :authors, :fetch_top_authors, decorator: UserDecorator

  def show
  end

  private

  def fetch_posts
    current_community.posts.order(created_at: :desc)
  end

  def fetch_top_authors
    current_community.members.order(rating: :desc).limit(3)
  end
end
