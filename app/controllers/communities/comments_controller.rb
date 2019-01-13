module Communities
  class CommentsController < ApplicationController
    respond_to :js

    expose :post
    expose_decorated :comment, parent: :post

    def create
      comment.commenter = current_user
      comment.save
    end

    def edit
    end

    def update
      comment.update(comment_params)
    end

    def destroy
      comment.destroy
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
  end
end
