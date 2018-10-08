class CommunitiesController < ApplicationController
  expose_decorated :posts, :fetch_posts
  expose_decorated :authors, :fetch_top_authors, decorator: UserDecorator

  def show
  end

  def edit
  end

  def update
    current_community.update(community_params)

    respond_with current_community
  end

  private

  def fetch_posts
    current_community.posts
                     .order(created_at: :desc)
                     .page(params[:page])
  end

  def fetch_top_authors
    current_community.users.order(rating: :desc).limit(3)
  end

  def community_params
    params.require(:community).permit(:name, :subdomain, :description)
  end
end
