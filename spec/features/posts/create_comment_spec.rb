require "rails_helper"

feature "Create Comment" do
  include_context "current user signed in"

  let!(:post) { create :post, community: current_community }
  let(:comment_content) { "Nice post!" }

  scenario "User creates comment to post" do
    visit_community current_community, post_path(post)

    fill_in("Comment", with: comment_content)
    click_on "Create Comment"

    expect(page).to have_content(current_user.full_name)
    expect(page).to have_content(comment_content)
  end
end
