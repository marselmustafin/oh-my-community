class PostsController < ApplicationController
  expose_decorated :post, parent: :current_community
  expose_decorated :comments, -> { post.comments.includes(:commenter) }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    post.author = current_user
    post.save

    respond_with post
  end

  def update
    post.update(post_params)

    respond_with post
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
