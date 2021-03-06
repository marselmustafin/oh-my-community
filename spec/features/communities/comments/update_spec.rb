require "rails_helper"

feature "Create Comment" do
  include_context "current user signed in"

  let!(:post) { create :post, community: current_community }
  let!(:comment) { create :comment, content: "Hello!", post: post, commenter: current_user }

  let(:comment_content) { "Hello World!" }

  background { visit_community current_community, post_path(post) }

  def comment_division
    "li#comment#{comment.id}"
  end

  scenario "User updates comment" do
    within comment_division do
      click_on "Edit"
      fill_in("Comment", with: comment_content)
      click_on "Update Comment"
    end

    expect(page).to have_content(comment_content)
  end
end
