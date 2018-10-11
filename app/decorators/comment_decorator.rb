class CommentDecorator < ApplicationDecorator
  decorates_association :commenter
  delegate :id, :content

  def commenter_name
    object.commenter.full_name
  end

  def created_at
    object.created_at.strftime("%a %m/%d/%y")
  end
end
