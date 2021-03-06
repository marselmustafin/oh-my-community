class CommunitiesController < ApplicationController
  expose_decorated :posts, :fetch_posts

  def show
  end

  def edit
  end

  def update
    current_community.update(community_params)

    respond_with current_community, location: root_path
  end

  def destroy
    current_community.destroy

    redirect_to root_url(subdomain: "")
  end

  private

  def fetch_posts
    Posts::SearchQuery.new(keywords: params[:keywords], relation: current_community.posts)
                      .all
                      .order(created_at: :desc)
                      .page(params[:page])
  end

  def community_params
    params.require(:community).permit(:name, :subdomain, :description, :image)
  end
end
