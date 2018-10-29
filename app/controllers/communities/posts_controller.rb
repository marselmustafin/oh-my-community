module Communities
  class PostsController < ApplicationController
    before_action :authorize_post, only: %i[edit update destroy]

    expose_decorated :post, parent: :current_community
    expose :comment, parent: :post, id: :comment_id
    expose_decorated :comments, :fetch_comments

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
      post.destroy

      redirect_to root_url
    end

    private

    def authorize_post
      authorize post
    end

    def fetch_comments
      post.comments
          .order(created_at: :desc)
          .includes(:commenter)
          .page(params[:page])
    end

    def post_params
      params.require(:post).permit(:title, :text)
    end
  end
end
