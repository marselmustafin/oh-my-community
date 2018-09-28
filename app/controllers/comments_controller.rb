class CommentsController < ApplicationController
  respond_to :js

  expose :post
  expose_decorated :comment, parent: :post

  def create
    comment.commenter = current_user
    comment.save

    respond_with comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
