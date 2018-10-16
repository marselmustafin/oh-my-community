require "rails_helper"

feature "Destroy Post" do
  include_context "current user signed in"

  let!(:post) { create :post, community: current_community, author: current_user }

  background { visit_community current_community, edit_post_path(post) }

  scenario "User destroys post" do
    click_on "Delete Post"

    accept_alert

    expect(page).not_to have_content(post.title)
  end
end
