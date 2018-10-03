require "rails_helper"

feature "Create Post" do
  include_context "current user signed in"

  let(:post_attributes) { attributes_for(:post).slice(:title, :text) }

  scenario "User creates post", :js do
    visit_community current_community, new_post_path

    fill_form(:post, post_attributes)
    click_on "Create Post"

    expect(page).to have_content("Post was successfully created.")
  end
end
