class CommentDecorator < ApplicationDecorator
  decorates_association :commenter
  delegate :id, :content, :errors

  def commenter_name
    object.commenter.full_name
  end

  def created_at
    object.created_at.strftime("%m-%d-%y %H:%M")
  end
end
