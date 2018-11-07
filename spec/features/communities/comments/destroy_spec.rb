require "rails_helper"

feature "Create Comment" do
  include_context "current user signed in"

  let!(:post) { create :post, community: current_community }
  let!(:comment) { create :comment, content: "Hello!", post: post, commenter: current_user }

  background { visit_community current_community, post_path(post) }

  def comment_division
    "li#comment#{comment.id}"
  end

  scenario "User destroys comment" do
    within comment_division do
      click_on "Destroy"
      accept_alert
    end

    expect(page).not_to have_content(comment.content)
  end
end
